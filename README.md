# TavernKeeperApi

[![Code Climate](https://codeclimate.com/github/TavernKeeper/tavern-keeper-api.png)](https://codeclimate.com/github/TavernKeeper/tavern-keeper-api)
[![Travis CI]](https://travis-ci.org/TavernKeeper/tavern-keeper-api.svg)](https://travis-ci.org/TavernKeeper/tavern-keeper-api)

### Huh? Rails ... for an API ?

Right now this is a legacy holdover, we've started to split the Web App assets from the Api side of Tavern Keeper... but the we've got Chef setup to deploy a rails application. We're embedding Grape (a Ruby API Framework), inside of Rails for now. Eventually Rails will disappear complete. 

## Current Stack / Expectations

* Ruby 2.1 (Rails [Temp] / Grape )
* Unicorn / Nginx 
* Redis
* Postgres
* Mandrill (for email)

The stack is reasonably small, overall, we'd like to keep the server needs minimal to help keep the hosting cost down of people who want to deploy TK themselves. 

If money allows, we'll be enhancing TK so it can optionally use additional services / servers such as:

* ElasticSearch
* Sidekiq (Ruby Background Worker)

## Other Projects

* tavern-keeper-web - The Web App portion of TavernKeeper (HTML / CSS)
* tavern-keeper-chef - AWS Opsworks Chef Recipies, you can use for deployment. 