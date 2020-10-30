# Server Util
Source: https://github.com/SamJUK/server-utils 


### Security
Collection of security scripts, see local README file


### Disk_Alert.sh
Send an email alert to specified emails if the disk space is above a set threshold. Works best set against a cronjob.

#### Parameters
- "-e": Emails to send the alert to, comma seperated
- "-a": Percentage of disk used to send alert above
- "--exclude": List of devices to exclude

#### Example Cron Job
```sh
0 0 * * * /usr/bin/env bash /opt/server-utils/disk_alert.sh -e "user@domain.com" -a 85
``` 
