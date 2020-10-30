# File Integrity Checker

**Note: This is best ran on a remote node, to prevent tampering with the control hashes if machine is infected.**

## How to run locally
- Clone repo
- CD to File Integrity Folder
- Update source folder, excludes & host in `config.sh`
- Generate control hashes `sh generateControl.sh`
- Setup a cronjob to check hashes `0 * * * * /usr/bin/env sh /opt/samjuk-security/FileIntegrity/check.sh | mail -E -s "File Integrity" user@email.com`

## How to run from a remote "control" server
@TODO
