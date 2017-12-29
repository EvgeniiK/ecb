# README

* Ruby version 2.4.0
* Rails version 5.1.4

You need to have installed ruby on rails environment with postgresql.

To run project:

1) `git clone git@github.com:EvgeniiK/ecb.git`

2) `gem install bundler`

3) `bundle install`

4) rename `database.yml.example` file to `database.yml`

5) fill `database.yml` with your postgres credentials

6) run `rake db:create db:migrate`

7) start the server `rails s`

8) open `http://localhost:3000`

9) use

There are two main service in this project.
First - `parse_rates` service. You can call it from console by typing `ParseRates.perform`.

`perform` method can handle several variables:
`file: 'path_to_file'` default is file from [here](http://sdw-wsrest.ecb.europa.eu/service/data/EXR/D.USD.EUR.SP00.A?format=csvdata)

`date_column` default: 'TIME_PERIOD'

`value_column` default: 'OBS_VALUE'

Second - `exchanger` service. You can call it from console by typing `Exchanger.exchange(eur_amount, dates)`

`eur_amount` - integer amount

`dates` - can be one or array of dates