makrConst=0.11407955
if [ $# -gt 0 ]
then
    workingDate=$1
else
    workingDate="@$(date +%s)"
fi
day=$(date -d "$workingDate" +%j)
day=$(expr $day + 0)
hour=$(date -d "$workingDate" +%H)
hour=$(expr $hour + 0)
oldYear=$(date -d "$workingDate" +%Y)
hoursInYear=$(( $(date -d "$oldYear-12-31T23:59:59" +%j)*24 + $(date -d "$oldYear-12-31T23:59:59" +%H) ))
t1=$(( $day*24 + $hour ))
t2=$(echo "$t1*1000 / $hoursInYear" | bc)
#t2=$(echo "$t1 * $makrConst" | bc)
fraction=${t2%.*}
#fraction=${fraction: -3}
millenia=$(expr ${oldYear:0:-3} + 1)
year=${oldYear: -3}
short="$fraction.$year.M$millenia"
long="0.$short"
echo $short
