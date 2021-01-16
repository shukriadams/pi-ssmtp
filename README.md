# Pi-ssmtp

https://hub.docker.com/repository/docker/shukriadams/pi-ssmtp

Docker container for sending emails from the command line on a raspberry pi. Relatively small footprint @ 119megs.

## How 

Write your smtp settings to a config file (see below). Write your email to a text file, say `mail.txt`

    To:username@example.com
    From:youraccount@gmail.com
    Subject: Test

    This is a test mail.

Assuming smtp settings and `mail.txt` are in the current directory, send with

    docker run \
        -v$(pwd)/smtp.settings:/etc/ssmtp/ssmtp.conf \
        -v$(pwd)/mail.txt:/tmp/mail.txt \
        shukriadams/pi-ssmtp:0.0.1 \
        sh -c "sendmail -t < /tmp/mail.txt"

## Gmail SMTP

You can transmit emails with a Gmail SMTP server if you have an account. Accessing Gmail SMTP from the command line in 2021 is best done with an app password - create one at https://myaccount.google.com/apppasswords. Save this password in your smtp.settings file

    root=postmaster
    mailhub=smtp.gmail.com:587
    hostname=MyRaspberrypi
    AuthUser=myUser@gmail.com
    AuthPass=my-app-password
    FromLineOverride=YES
    UseSTARTTLS=YES

