# Smster (ruby)
[![Code Climate](https://codeclimate.com/github/IlyaDonskikh/smster_ruby/badges/gpa.svg)](https://codeclimate.com/github/IlyaDonskikh/smster_ruby)

SMS sending service through different providers with maximum convenience.

Supported:
* [Clickatell](https://www.clickatell.com/)
* [Nexmo](https://www.nexmo.com/)
* [Smsru](http://sms.ru/)
* [SmsUslugi](http://sms-uslugi.ru/)

## Use

Install gem:

```gem install smster_ruby```

Follow instruction: 

https://github.com/IlyaDonskikh/smster_ruby/wiki.

## Preview

Add configuration file ```config/initializers/smster.rb```:

```ruby
Smster.configure do |config|
  ## Clickatell
  config.clickatell_authorization_code = API_KEY
end
```

And send sms:

```ruby
require 'smster'

Sms::Clickatell.send_sms(to: $phone, text: $text)
```

## Feedback

Please use the [issue tracker](https://github.com/IlyaDonskikh/smster_ruby/issues) or send mail to [donivrecord@gmail.com](mailto:donivrecord@gmail.com).
