#!/usr/local/bin/bash
# t_date=$(date +'%m-%d-%Y')
t_date=11-19-2023
mkdir -p $t_date
touch $t_date.md
# echo "## $t_date" >> README.md
# echo "" >> README.md
# osxphotos export $t_date --album Activity_zaarif --convert-to-jpeg --jpeg-quality .4 --added-in-last '1d' --skip-original-if-edited

osxphotos export $t_date --album Activity_zaarif --convert-to-jpeg --jpeg-quality .4 --skip-original-if-edited
readarray -t array < <(ls $t_date)

for i in ${array[@]};do
         echo "" >> $t_date.md
         echo \!\[$t_date\]\($t_date/$i\) >> $t_date.md
         done

echo "" >> class_activity.md
echo \[$t_date\]\($t_date.md\) >> class_activity.md


git checkout website
git add $t_date
git add $t_date.md
git add -u
git commit -m "$t_date"
git push
