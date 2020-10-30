# Server Utils - Security

## FileIntegrity
Try to validate the integrity of files on the system, supports both, local + remote scripts. Setting up the scripts on a remote "control" machine is a more secure option to prevent tampering with the control hashes.

## LinEnum
Enumeration script to indentify potential exploit paths / weaknessed in a system. Best to run this as PHP/PYTHON/JS users or others that can be used to gain a potential shell.

### Examples
```
sh /opt/server-utils/security/LinEnum.sh | tee /tmp/LinEnum.USERNAME.log
less -R /tmp/LinEnum.USERNAME.log
```
