# ScrabbleScorer
[![CircleCI](https://circleci.com/gh/tz3/scrabble_scorer.svg?style=shield)](https://circleci.com/gh/tz3/scrabble_scorer)
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