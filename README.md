# README

## how to build
### for development
```bash
  $ docker-compose build
  $ docker-compose run pos bundle exec rails db:drop db:create db:migrate db:seed
  $ docker-compose up -d
```
