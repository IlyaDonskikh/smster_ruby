# Smster (ruby)
[![Code Climate](https://codeclimate.com/github/IlyaDonskikh/smster_ruby/badges/gpa.svg)](https://codeclimate.com/github/IlyaDonskikh/smster_ruby)

SMS sending service through different providers with maximum convenience.

Supported: 
* [Smsru](http://sms.ru/)
* [Nexmo](https://www.nexmo.com/)
* [Clickatell](https://www.clickatell.com/)

## Setup

Install gem:

```gem install smster_ruby```

Add configuration folder and file ```config/initializers/smster.rb```:

```ruby
Smster.configure do |config|
  ## Smsru
  config.smsru_api_id = API_KEY
  
  ## Nexmo
  config.nexmo_key = API_KEY
  config.nexmo_sekret = API_SECRET

  ## Clickatell
  config.clickatell_authorization_code = API_KEY
end
```

## Sending message

Select a service provider and send you first message:

```ruby
require 'smster'

Sms::Smsru.send_sms(to: $phone, text: $text) # ::Nexmo, ::Clickatell
```

## Feedback

Please use the [issue tracker](https://github.com/IlyaDonskikh/smster_ruby/issues) or send mail to [donivrecord@gmail.com](mailto:donivrecord@gmail.com).
