#
# My personal profile script that send email on user login
# Must be placed at /etc/profile.d/
#

TO="gustavopantuza@gmail.com"
SUBJECT="[DEFCON 0] $HOSTNAME"
USER_IP=$(echo $SSH_CLIENT | awk '{print $1}')
MSG="User $USER logged on $HOSTNAME at $(date +%d.%m.%Y-%H:%M) from $USER_IP"
MAILX=$(which mailx);


echo $MSG | ${MAILX} -s "$SUBJECT" $TO
