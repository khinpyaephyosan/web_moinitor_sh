
stat=$(curl -s -o /dev/null -I -w "%{http_code}" https://www.kbzgateway.com/)
echo $stat
DATE=$(date '+%Y-%m-%d %H:%M:%S')
if [ $stat == 200 ] 
then
   echo "ok"
else
   $(mail -s "KBZGW website status alert" it.kbzgw@kbzgateway.com  <<< "KBZGW webiste was down at $DATE! Error Status Code was $stat.")
fi
