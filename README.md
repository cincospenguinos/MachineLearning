# MachineLearning

A pure ruby implementation of a variety of machine learning algorithms. This grew out of my own miniature library I developed for CS 5450.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'machine_learning'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install machine_learning

## Usage

1. Gather some data and instantiate an Example for each one.
2. Set the acceptable labels : `MachineLearning::Classifier.acceptable_labels = your_acceptable_labels`
3. Instantiate the classifier of your choice and do what you want

You can also design your own classifier and include it--just extend the `MachineLearning::Classifier` class and implement the constructor and `guess_for` method.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cincospenguinos/machine_learning. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cincospenguinos/machine_learning/blob/master/CODE_OF_CONDUCT.md).
