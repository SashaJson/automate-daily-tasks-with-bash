#Script to send Birthday Wishes through email from csv file
TO="to@address.com"
FROM="from@address.com"

#extract day and month from date command
todayDay=$(date | cut -d" " -f3 )
todayMonth=$(date | cut -d" " -f2 )
count=$(cat BirthDay.csv | wc -l)

#extract each field from csv
for (( i = 2; i <= count; i++ )); do
name=$(cut -d, -f1 <BirthDay.csv | sed -n "$i"p)
dobMonth=$(cut -d, -f2 <BirthDay.csv | cut -d- -f2 | sed -n "$i"p)
dobDay=$(cut -d, -f2 <BirthDay.csv | cut -d- -f1 | sed -n "$i"p)
email=$(cut -d, -f3 <BirthDay.csv | sed -n "$i"p)
if [[ "$todayDay" -eq "$dobDay" ]] && [[ "$todayMonth" = "$dobMonth" ]]; then
  echo "happy birthday $name" | mail -s Subject:Birth_Day_Wishes ${FROM} ${TO}
fi
done
