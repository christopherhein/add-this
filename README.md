# Add This

Ruby wrapper for the [Add This Analytics API](http://www.addthis.com/help/analytics-api#.TzzlN0zC4V).

## Installation

```bash
$ gem i add_this
```

## Usage

With your user_id and password define a configure block that defines them like so:

### Global Config

```ruby
AddThis.configure do |config|
  config.user_id = "generalthings"
  config.password = "awesome"
end
```

### or Per Request

```ruby
add_this = AddThis::Client.new(user_id: "generalthings", password: "awesome")
```

For making requests to the api is quite simple it follows most of the current Add 
This Structure for urls only broken by an underscore so [/shares/day](https://api.addthis.com/analytics/1.0/pub/shares/day.csv)
would be a method called `shares_day`


## Example calls

You have two ways available to get data one on the AddThis class like so:

```ruby
AddThis.get.shares_url
```

or by creating the client and requesting through that like so:

```ruby
add_this = AddThis::Client.new
add_this.shares_url
```

or passing query params you just need to provide a hash into that method as so:

```ruby
AddThis.get.shares_url({service: "facebook_like"})
```


Resources:

* [Add This Analytics API](http://www.addthis.com/help/analytics-api#.TzzlN0zC4V)


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 General Things Inc. See LICENSE for details.
