# Infusionsoft::Api

[Infusionsoft Api](https://github.com/davidlumley/infusionsoft-api) is an interface for accessing [Infusionsoft's](http://help.infusionsoft.com/developers/api-basics) API.

It's based on the [MYOB Api](https://github.com/davidlumley/myob-api) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'infusionsoft-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infusionsoft-api

## Usage

### API Client Setup

Create an api_client:

    api_client = Infusionsoft::Api::Client.new({
      :api_key  => USERS_API_KEY,
      :app_name => USERS_APP_NAME,
    })

The `:api_key` can be found in Infusionsoft under Admin -> Settings -> Application Setttings (Application). The `:app_name` is the subdomain of `app_name.infusionsoft.com`('app_name').

### API Methods

####  Contacts

Return a list of all contacts

    api_client.contact.all

You can also pass a query hash

    api_client.contact.all({
      :FirstName => 'David',
    })

####  Contact Groups

Return a list of all contact groups
    api_client.contact_group_assign.all

You can also pass a hash query

    api_client.contact_group_assign.all({
      :GroupCategoryId => 12,
    })

####  Contact Group Assignments

Return a list of all contact group assignments (i.e. contacts with a tag or group)
    api_client.contact_group_assign.all

You can also pass a hash query

    api_client.contact_group_assign.all({
      :ContactGroup => 'New Customer',
    })

####  Contact Group Categories

Return a list of all contact group categories
    api_client.contact_group_category.all

You can also pass a hash query

    api_client.contact_group_category.all({
      :CategoryName => 'Custom Tags',
    })

## Todo

* Expand API methods
* Refactor client factory architecture
* Tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
