# TeamFive/bot

The bot lauches Firefox and read every posting from Goverment homepage BBS. When the program is running, it will re-lauch Firefox again and again in every 5 seconds from closing of the browser.
Written in Python 2.7 and python-selenium.


## Requirements

- Python 2.7
- python-selenium
- Firefox
- Geckodriver
- /tmp/IS521GovFlag (A flag file which can be generated by update_flag module)


## Cautions

- config.conf

  At the beginning of the program, it reads a config file, "config.conf". If the file is not exist, then it will make a file with your STDIN inputs. When it creates a config file, 4 variable are needed: ADMIN\_ID, ADMIN\_PW, SITE, DOMAIN\_NAME. ADMIN\_ID/ADMIN\_PW means the admin account of government web application. You probably set the value when install the web application. Otherwise, just set an account which can read all posting of govrnment website's BBS postings. SITE means the address of the government website. It may have the value, "127.0.0.1:12345". DOMAIN\_NAME is a domain name of a virtual web site which is described as "bank.com" in class activity requirement file, "engineering.tex". The domain name of each team is supposed to be notified later. If the domain is not available, the program will be terminated. When you miss-configured, remove "config.conf" and launch bot.py again.

      $ python bot.py
      Config file is not exist.
      Making config file...
      Enter government website admin ID: kwon
      Enter government website admin PW: password1234
      Enter government website address: http://127.0.0.1:12345
      Enter domain of bank.com: http://bank.com


- /tmp/IS521GovFlag

  The file contains 16-character value and can be generated by update_flag module. It is an essential file to set a cookie of the domain. Therefore, you should create this file with update_flag module before running the bot program.


## Run

    Xvfb :99 -ac & export DISPLAY=:99 & python bot.py

