# TrackerCorreosCl

Fetch, parse and display the Tracking information from the site correos.cl according a Tracking number

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tracker_correos_cl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tracker_correos_cl

## Usage

```ruby
tracking_number = "RT11111111111"
tracking_response = TrackerCorreosCl::Tracker.new(tracking_number)
```

### Tracker Object

#### API

```ruby
# Useful method to check if the tracking number doesn't exist
tracking_response.valid?

# Useful method to check if the tracking number was delivered
tracking_response.delivered?
```

#### Properties

The Tracker Object has two properties:

* delivery: When the tracking is delivered, the delivery object has  the 'number', 'to', 'date' and 'rut' property, otherwise is nil

* tracking_collection: Array of Tracking object, where the tracking object has the 'status' , 'date' and 'office' attribute

For instance, you can iterate over tracking_collection and print all the status of the tracking number

```ruby
if tracking_response.valid?
  tracking_response.tracking_collection.each {|t| puts t.status}
end
```

## Contributing

1. Fork it ( https://github.com/rodrigore/tracker_correos_cl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
