#!/bin/bash

echo "***************************************************************************"
echo "                               Генерируем метрики                          "
echo "***************************************************************************"


cat << EOF
{ "data": [
  { "{#ITEMNAME}":"metric1" },
  { "{#ITEMNAME}":"metric2" },
  { "{#ITEMNAME}":"metric3"}
]}
EOF

agenthost="`hostname -f`"
zserver="localhost"
zport="10051"

cat /dev/null > /tmp/zdata.txt
for item in "metric1"  "metric2" "metric3"; do
  randNum="$(( (RANDOM % 100) ))"
  echo $agenthost otus_important_metrics[$item] $randNum >> /tmp/zdata.txt
  #echo $agenthost $item $randNum >> /tmp/zdata.txt
done

# push all these trapper values back to zabbix
zabbix_sender -vv  -s  $agenthost  -z $zserver -p $zport -i /tmp/zdata.txt
# >> /tmp/zsender.log 2>&1 


#cat  /tmp/zdata.txt