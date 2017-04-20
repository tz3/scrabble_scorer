# ScrabbleScorer
[![CircleCI](https://circleci.com/gh/tz3/scrabble_scorer.svg?style=shield)](https://circleci.com/gh/tz3/scrabble_scorer)
[![Coverage Status](https://coveralls.io/repos/github/tz3/scrabble_scorer/badge.svg?branch=master)](https://coveralls.io/github/tz3/scrabble_scorer?branch=master)
### Dependencies
* Postgres
* ruby

### Database Config
To make the applications work with DB, you have to configure
credentials. You can do it in DB config file.
DB config is in `config/database.yml`, by default it use `development`
enviropment.

### Prepare to run
* bundle install
* bundle exec rake db:create
* bundle exec rake db:migrate
* bundle exec rake db:load

### Run server
bundle exec bin/server -o 0.0.0.0 -p 3000


## Usage
Example request/response from the terminal
```bash
> curl -X GET 'http://localhost:3000/score_word/test'
{"word":"test","valid":true,"score":4}
```

## Tests
### Prepare
* RACK_ENV=test bundle exec rake db:create
* RACK_ENV=test bundle exec rake db:migrate
### Run tests
bundle exec rake test

## Try

Service was deployed on digital ocean, so here you can try it.
http://95.85.42.243:3000/score_word/title

## Deployment

### Dependencies 
* Ansible
* python

### Get Started
Further actions are executed from the folder config/provision folder

Firstly run setup playbook for configuring your instance. For example,
```
ansible-playbook -i hosts --private-key=~/.ssh/id_rsa setup.yml
```
and finally, run the deploy playbook for deploy.

```
ansible-playbook -i hosts --private-key=~/.ssh/id_rsa deploy.yml
```


