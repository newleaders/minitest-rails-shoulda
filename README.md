# minitest-rails-shoulda

## Description

Make shoulda-matchers available for minitest-rails.

## Installation

In Rails 3 and Bundler, add the following to your Gemfile:

```ruby
group :test do
  gem "minitest-rails-shoulda"
end
```

Add the following to your test helper:

```ruby
require "minitest/rails/shoulda"
```

## Usage

### ActiveRecord Matchers

Matchers to test associations:

```ruby
describe Post do
  subject { Post.new }
  it { must belong_to(:user) }
  it { must have_many(:tags).through(:taggings) }
end

describe User do
  subject { User.new }
  it { must have_many(:posts) }
end
```

### ActiveModel Matchers

Matchers to test validations and mass assignments:

```ruby
describe Post do
  subject { Post.new }
  it { must validate_uniqueness_of(:title) }
  it { must validate_presence_of(:body).with_message(/wtf/) }
  it { must validate_presence_of(:title) }
  it { must validate_numericality_of(:user_id) }
end

describe User do
  subject { User.new }
  it { wont allow_value("blah").for(:email) }
  it { must allow_value("a@b.com").for(:email) }
  it { must ensure_inclusion_of(:age).in_range(1..100) }
  it { wont allow_mass_assignment_of(:password) }
end
```

### ActionController Matchers

Matchers to test common patterns:

```ruby
describe PostsController, "#show" do
  context "for a fictional user" do
    before do
      get :show, :id => 1
    end

    it { must assign_to(:user) }
    it { must respond_with(:success) }
    it { must render_template(:show) }
    it { wont set_the_flash }
  end
end
```

### Shoulda Assertions (Expectations)

Assertions:

```ruby
# collection contains some value
assert_contains collection, "a"
assert_contains collection, /a/
assert_contains collection, 3

# or

refute_does_not_contain collection, "a"
refute_does_not_contain collection, /a/
refute_does_not_contain collection, 3


# collection does not contain some value
refute_contains collection, "b"
refute_contains collection, /b/
refute_contains collection, 5

# or

assert_does_not_contain collection, "b"
assert_does_not_contain collection, /b/
assert_does_not_contain collection, 5

# collections contain the same elements
assert_same_elements [1, b, "3"], ["3", 1, b]

# collection does not contain the same elements
refute_same_elements [1, b, "3"], ["4", b, 1]
```

And as Expectations:

```ruby
# collection contains some value
collection.must_contain "a"
collection.must_contain /a/
collection.must_contain 3

# collection does not contain some value
collection.wont_contain "b"
collection.wont_contain /b/
collection.wont_contain 5

# collections contain the same elements
[1, b, "3"].must_have_same_elements ["3", 1, b]

# collection does not contain the same elements
[1, b, "3"].wont_have_same_elements ["4", b, 1]
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

Many thanks go to the following who have contributed to making this library even better:

* **[@phlipper](https://github.com/phlipper)**
* **[@blowmage](https://github.com/blowmage)**


## License

**minitest-rails-shoulda**

* Freely distributable and licensed under the [MIT license](http://newleaders.mit-license.org/2012-2013/license.html).
