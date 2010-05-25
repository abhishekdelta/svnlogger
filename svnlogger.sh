#!/bin/bash
svn log | grep -v "^$" | grep -v ^- | awk -F "|" ' 
BEGIN{
print "svnlogger 0.1 by abhishekdelta (Abhishek Shrivastava)\n"
username=""
date=""
revno=""
}
{
if($1 ~ /^r[0-9]*/)
{
 username=$2
 date=substr($3,1,19)
 revno=substr($1,2)
}
else
{
 print "Revision " revno " : " $1 " by " username " on " date
} 
}' > $1
