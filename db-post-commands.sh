#! /bin/bash
docker exec -i oracle-db bash <<'EOF'
cp /home/oracle/devops.dmp /u01/app/oracle/admin/XE/dpdump/
impdp system/oracle dumpfile=devops.dmp logfile=devops.log schemas=devops
exit
EOF
