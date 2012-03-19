#!/bin/bash
git push heroku master && heroku run rake db:migrate && heroku run rake db:seed && heroku restart
