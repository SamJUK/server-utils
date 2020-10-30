#!/usr/bin/env bash

while [ $# -gt 0 ]; do
  case "$1" in
    -e|--email)
      ADMIN="$2"
      ;;
    -a|--alert)
      ALERT="$2"
      ;;
    --exclude)
      EXCLUDE_LIST="$2"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
  shift
done



if [[ -z "$ADMIN" ]]; then
    echo "Missing admin email";
    exit 1;
fi

if [[ -z "$ALERT" ]]; then
    echo "Missing Alert Percentage";
    exit 1;
fi


# Exclude list of unwanted monitoring, if several partions then use "|" to separate the partitions.
# E.G: EXCLUDE_LIST="/dev/hdd1|/dev/hdc5"
if [[ -z "$EXCLUDE_LIST" ]]; then
    EXCLUDE_LIST=""
fi

function main_prog() {
while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
  partition=$(echo $output | awk '{print $2}')

  IP_DIG=$(dig +short myip.opendns.com @resolver1.opendns.com)
  IP_CURL=$(curl -s ifconfig.me)

  if [[ -z "$IP_DIG" ]]; then
     IP="$IP_CURL"
  else
     IP="$IP_DIG"
  fi

  if [ $usep -ge $ALERT ] ; then
     echo "Running out of space \"$partition ($usep%)\" on server $(hostname)@$IP , $(date)" | \
     mail -s "Alert: Almost out of disk space $usep%" $ADMIN
  fi
done
}

if [ "$EXCLUDE_LIST" != "" ] ; then
  df -H | grep -vE "^Filesystem|tmpfs|cdrom|${EXCLUDE_LIST}" | awk '{print $5 " " $6}' | main_prog
else
  df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}' | main_prog
fi
