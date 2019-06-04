
stat=$(curl -s -o /dev/null -I -w "%{http_code}" https://www.kbzgateway.com/)
echo $stat
DATE=$(date '+%Y-%m-%d %H:%M:%S')
mail_addr= ""
if [ $stat == 200 ] 
then
   echo "ok"
else
   $(mail -s "KBZGW website status alert" $mail_addr  <<< "KBZGW webiste was down at $DATE! Error Status Code was $stat.")
fi
