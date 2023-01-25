#!/bin/sh

year=2010

while [ $year -lt 2023 ]; do
    exec `mkdir -p $year`

    month=1
    while [ $month -le 12 ]; do
        day=1
        start_date="$year-$month-$day"
        case $month in
            1)      day=31 ;;
            2)      day=28 ;;
            3)      day=31 ;;
            4)      day=30 ;;
            5)      day=31 ;;
            6)      day=28 ;;
            7)      day=31 ;;
            8)      day=31 ;;
            9)      day=30 ;;
            10)     day=31 ;;
            11)     day=30 ;;
            12)     day=31 ;;
        esac
    	end_date="$year-$month-$day"

        echo "* Now extracting from $start_date to $end_date..."
        filename=$year/snscrape_dengue_$year-$month.json
        if [ ! -f $filename ]; then
        # if [ ! -f $filename ] || [ -s $filename ]; then
            exec `snscrape --jsonl --progress --since $start_date twitter-search "dengue until:$end_date" > $filename`
        fi

        month=$(( month + 1 ))
    done
    year=$(( year + 1))
done

# getting tweets up to today.
#today_date = $( date + '%F' )
#echo "* Now extracting from 2023-01-01 to $today_date..."
#exec `snscrape --jsonl --progress --since $start_date twitter-search "dengue until:$end_date" > snscrape_dengue-$start_date_$end_date.json`

# full run took  3d 10h 31m 35s
