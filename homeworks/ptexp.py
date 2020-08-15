import http.server
from prometheus_client import start_http_server
from prometheus_client import Histogram
from prometheus_client import Gauge
from prometheus_client import Counter

LATENCY = Histogram('av_latency_seconds',
        'Time for a request for service')

INPROGRESS = Gauge('av_inprogress',
        'Number of call in progress.')
LAST = Gauge('av_last_time_seconds',
        'The last time a call was served.')

REQUESTS = Counter('av_total',
        'Service requested.')

class MyHandler(http.server.BaseHTTPRequestHandler):
    @LATENCY.time()
    def do_GET(self):
        INPROGRESS.inc()
        REQUESTS.inc()
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"call my service")
        LAST.set(time.time())
        INPROGRESS.dec() 


if __name__ == "__main__":
    start_http_server(8000)
    server = http.server.HTTPServer(('0.0.0.0', 8001), MyHandler)
    server.serve_forever()