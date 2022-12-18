# Jbuilder Exercises

This project consists of a party tracker database that stores information about
parties, guests, gifts, and invitations. The models and controllers are already
built. Your primary task is to build the API views, writing Jbuilder templates
so that calls to the API will return the right information, correctly formatted.

## Phase 0: Setup

To get started, clone the starter repo from the `Download Project` link at the
bottom of this page. Run `rails db:setup`, which will create, load, and seed
your database. Note that the starter does not have any migrations ready to run;
`db:setup` loads the database configuration directly from the schema by running
`rails db:schema:load` behind the scenes.

The first thing you need to do is to set up your routes. Note that all of your
controllers are nested in an __api__ folder and that each controller's class
name begins with `Api::`. This means that your controllers are defined under an
`Api` namespace, so you need to specify that namespace in the routes as well.
For the purposes of this exercise, you only need to define `show` and `index`
routes for `guests`, `gifts`, and `parties`. For `gifts`, nest the `index` route
under the `guests` resource using the [`shallow`] option. Use the code snippet
below as a guide for the formatting:

```ruby
namespace :api, defaults: { format: :json } do
  # Your routes here
end
```

Run `rails routes` to ensure your routes are set up as intended. Your routes
should match the following (the order is not important):

```sh
         Prefix Verb URI Pattern                           Controller#Action
api_guest_gifts GET  /api/guests/:guest_id/gifts(.:format) api/gifts#index {:format=>:json}
       api_gift GET  /api/gifts/:id(.:format)              api/gifts#show {:format=>:json}
     api_guests GET  /api/guests(.:format)                 api/guests#index {:format=>:json}
      api_guest GET  /api/guests/:id(.:format)             api/guests#show {:format=>:json}
    api_parties GET  /api/parties(.:format)                api/parties#index {:format=>:json}
      api_party GET  /api/parties/:id(.:format)            api/parties#show {:format=>:json}
```

Keep the [Jbuilder docs][docs-link] open and use them for reference as you work.

A few notes before you begin:

- Just like with ERB views, Jbuilder views have access to any instance variables
  defined within the controller action that renders the view.

- You can run any Ruby code you want in a Jbuilder template, including
  conditionals. This ends up being really helpful when, for example, you only
  want to send certain user data only if the user requesting it is logged in.

- As you did with HTML and ERB, you can build Jbuilder partials and render them
  using `json.partial!` in your templates.

- Anything that follows `json.` without a `!` will become a literal key name. To
  set key names dynamically, use `json.set!` followed by the expression to be
  evaluated for the key name. For example,

  ```rb
  name = "joe"
  json.name name
  json.set! name, :name
  ```

  yields

  ```rb
  name: "joe"
  joe: "name"
  ```

- You can nest your data in an object under a given key by using a block.
  Consider this example from the [Jbuilder docs][docs-link]:

  ```ruby
  json.author do
    json.name @message.creator.name.familiar
    json.email_address @message.creator.email_address_with_name
    json.url url_for(@message.creator, format: :json)
  end
  ```

  yields:

  ```json
   "author": {
      "name": "David H.",
      "email_address": "'David Heinemeier Hansson' <david@heinemeierhansson.com>",
      "url": "http://example.com/users/1-david.json"
    }
  ```

  Note the nested object and the use of associations (`@message.creator`) and
  view helpers (`url_for`).

## Phase 1: Basic Jbuilder templates

Time to make some templates! Start by making a `show.json.jbuilder` view for
your guest resource. Include the guest's `name`, `age`, and `favorite color`
by specifying each field and its value, like so:

```ruby
json.name @guest.name
json.age ...
```

Make sure you don't include `created_at` or `updated_at`. Test your work by
starting the server and sending a request from Postman or visiting the url
directly (e.g., `api/guests/1`). You should see something with the following
format:

```json
{
  "name": "John Smith",
  "age": 45,
  "favorite_color": "Blue"
}
```

(If you don't have a JSON formatter installed in your browser, try [this
one][formatter-link].)

Once you have it working, go ahead and create an `index` view. For this, use
`json.array!` and pass `@guests`. Use a block to specify what you want to render
for each guest. This time, use `json.extract!` instead of specifying each
field individually. When you finish, navigate to the `index` route in your
browser. Now you should see:

```json
[
  {
  "name": "John Smith",
  "age": 45,
  "favorite_color": "Blue"
  },
  // ...
  {
  "name": "Job Bluth",
  "age": 41,
  "favorite_color": "Red"
  }
]
```

Since your two templates do very similar things, go ahead and refactor the
single guest details into a partial. The naming convention for the partial
itself is the same as for HTML views, i.e., __\_guest.json.jbuilder__. (As with
ERB partials, you should omit the `_` when invoking the partial.) Make sure to
include `api/` in your partial path.

Remember that your partial should not rely on instance variables from a
controller but should instead receive any necessary variables as arguments; this
will enable it to work with views from various actions. If you have trouble with
the syntax, check the [Jbuilder docs][docs-link]. Test your partial to make sure
everything still renders correctly before moving on.

Next, add some associated data so that you can see gifts for individual guests,
but not when you're looking at all guests (this may be too much data). In your
`show` view, render a guest's gifts. Only include the `title`, `description`,
and `party`. This is the format you want to build:

```json
{
  "name": "John Smith",
  "age": 45,
  "favorite_color": "Blue",
  "gifts": [
    {
      "title": "A Bottle of Wine",
      "description": "This one is not so great.",
      "party": "Secret Santa Extravaganza"
    },
    {
      "title": "Another Bottle of Wine",
      "description": "This one is not so bad.",
      "party": "Secret Santa Extravaganza"
    }
  ]
}
```

**N.B.:** You might be tempted to add the gifts using something like
`json.array! @guest.gifts`, but this would try to convert the entire top-level
JSON object into an array and then throw an error because it didn't know how to
merge the other top-level guest information into that array. Instead, nest the
gifts array under a key of `gifts` using the following format:

```rb
json.key_name collection do |collection_item|
  # format data for each collection_item, will be element in array
end
```

When you finish, navigate to the `show` page to check your work.

Time to do some templates on your own! Make both a gift `show` and guest gift
`index` view. They should respectively produce the following responses:

```json
// Gift #1 show
{
  "title": "A Bottle of Wine",
  "description": "This one is not so great.",
  "guest": "John Smith",
  "party": "Secret Santa Extravaganza"
}

// Guest #1 gift index
[
  {
    "title": "A Bottle of Wine",
    "description": "This one is not so great.",
    "party": "Secret Santa Extravaganza"
  },
  {
    "title": "Another Bottle of Wine",
    "description": "This one is not so bad.",
    "party": "Secret Santa Extravaganza"
  }
]
```

Next, make the party `show` and `index` views. In the `index` view, show all
parties and include all of their guests:

```json
[
  {
    "name": "Secret Santa Extravaganza",
    "location": "Portland",
    "guests": [
      "John Smith",
      "Jane Doe",
      "Josh Brown",
      "Helen White",
      "Job Bluth"
    ]
  },
  {
    "name": "Charles' Christmas Party",
    "location": "San Francisco",
    "guests": [
      "Josh Brown",
      "Helen White"
    ]
  }
]
```

**Hint:** Options for building non-top-level arrays inside a Jbuilder template
include Jbuilder's `merge!` command, Rail's built-in association methods (such
as the [`resource_ids` getter][ids-getter]), and standard Ruby methods like
`map`.

In the `show` view, include not only all the guests, but all of the guests'
gifts as well:

```json
{
  "name": "Charles' Christmas Party",
  "location": "San Francisco",
  "guests": [
    {
      "name": "Josh Brown",
      "gifts": [
        "Basketball Tickets"
      ]
    },
    {
      "name": "Helen White",
      "gifts": []
    }
  ]
}
```

Remember that you only want to show a guest's gifts for the specified party!

Finally, modify your guest `index` view to show only guests who are between 40
and 50 years old. Normally you would do this kind of selection using Active
Record, but this gives you an opportunity to practice using Ruby in Jbuilder.

Well done! You've successfully created your Jbuilder views. In Phase 2, you will
learn how to optimize them by removing any N+1 queries.

[`shallow`]: https://guides.rubyonrails.org/routing.html#shallow-nesting
[formatter-link]: https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en
[docs-link]: https://github.com/rails/jbuilder
[ids-getter]: https://guides.rubyonrails.org/association_basics.html#methods-added-by-has-many-collection-singular-ids