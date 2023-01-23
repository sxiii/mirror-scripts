# mirror-scripts
Scripts to make a cherry-pick package mirrors for multiple linux distributions. SSL protection by Certbot (Let's Encrypt) is included and enabled by default.

This will allow you, for example, add multiple different packages (and only them) by adding direct links to these packages to a one single webserver, making it eventually a multi-mirror for different linux distributions for particular packages.

# How to use
Step 1.
```
git clone https://github.com/sxiii/mirror-scripts`
cd mirror-scripts
```

Step 2.
Open file `nginx.conf` and replace "your.website.com" with your website's FQDN. Save file.

Step 3.
Open file `step1-docker-certbot.sh` and replace "your.website.com" with your website's FQDN. Save file.

Step 4.
Open file `step2-download-packages.sh` and replace packages URLs (samples are given for DEB, RPM and ArchLinux ZSTs) with direct links to the packages you like (or keep the ones that are there just for testing purposes).

Step 5.
Your DNS should be already pointing to your server. Otherwise Certbot wouldn't be able to fetch SSL cert.
Run `./step1-docker-certbot-run.sh` and wait a little, check that cert is fetched and added to folder.
NB: Step names in the files are correspondent to the order of running, not to the steps in this README file.

Step 6.
Run `./step2-download-packages.sh'. Wait for your packages finish downloading, check the paths and files themselves if you'd like.

Step 7.
Run `./step3-nginx-run.sh`. Point your mirror lists of your distributions to https://your.website.com/distribution.name, where distribution.name depends on which folder you used. By default this assumes you have /srv/http folder with `ubuntu`, `arch` and `alma` folders inside and some packages in these folders that was downloaded automatically on step2.

Step 8. Update your distributions and check that your mirrors are providing your packages again.

## Improvements
There are extremely many improvements that can be done on this code. This is just to test an idea.
