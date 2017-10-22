#!/bin/bash
echo "SORTED RESULT"
echo "-------------"
echo "Dovecot_plain"
egrep -o 'dovecot_plain[^ ]+' /var/log/exim_mainlog | sort|uniq -c|sort -nk 1 |tail -n 5
echo "Dovecot_login"
egrep -o 'dovecot_login[^ ]+' /var/log/exim_mainlog | sort|uniq -c|sort -nk 1 |tail -n 5
echo "Directory_based"
grep "cwd=/home" /var/log/exim_mainlog | awk '{for(i=1;i<=10;i++){print $i}}' | sort | uniq -c | grep cwd | sort -n |tail -n 5
echo "Exim Queue"
exim -bpc

