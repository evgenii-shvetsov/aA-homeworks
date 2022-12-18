# Jbuilder Exercises, Phase 3: Building A Normalized State

The [Redux docs][normalized-state] identify four characteristics of a
_normalized state_:

> - Each type of data gets its own "table" in the state.
>
> - Each "data table" should store the individual items in an object, with the
>   IDs of the items as keys and the items themselves as the values.
>
> - Any references to individual items should be done by storing the item's ID.
>
> - Arrays of IDs should be used to indicate ordering.

You have learned a bit about the benefits of maintaining a normalized state.
Today, you will practice using Jbuilder to form responses that reflect a
normalized state. Returning data formatted in this way can help you keep your
reducers clean on the frontend of a full stack application.

According to the definition above, a _normalized_ response for a guest's gift
`index` might look like this:

```json
{
  "gifts": {
    "1": {
      "id": 1,
      "title": "A Bottle of Wine",
      "description": "This one is not so great.",
      "partyId": 1,
      "guestId": 1
    },
    "2": {
      "id": 2,
      "title": "Another Bottle of Wine",
      "description": "This one is not so bad.",
      "partyId": 1,
      "guestId": 1
    }
  }
}
```

As this example shows, each gift is represented by a key-value pair where the
key is the gift's `id` and the value is the gift's information. All of the gifts
are then nested under a key of `gifts`.

In the gifts controller, change the `index` action to render `:normalized_index`
instead of `:index`, then create a corresponding Jbuilder file in __views__.
Inside the file, write a Jbuilder template to build the normalized gift state
shown above. Test your work in Postman or the browser.

Now do the same for the guest `index`. When you finish, your `normalized_index`
of guests should look like this:

```json
{
  "guests": {
    "1": {
      "id": 1,
      "name": "John Smith",
      "age": 45,
      "favorite_color": "Blue",
      "gift_ids": [
        1,
        2
      ]
    },
    "2": {
      "id": 2,
      "name": "Jane Doe",
      "age": 47,
      "favorite_color": "Green",
      "gift_ids": [
        3
      ]
    },
    "3": {
      "id": 3,
      "name": "Josh Brown",
      "age": 22,
      "favorite_color": "Brown",
      "gift_ids": [
        4,
        5
      ]
    },
    "4": {
      "id": 4,
      "name": "Helen White",
      "age": 25,
      "favorite_color": "White",
      "gift_ids": [
        6
      ]
    },
    "5": {
      "id": 5,
      "name": "Job Bluth",
      "age": 41,
      "favorite_color": "Red",
      "gift_ids": []
    }
  }
}
```

Note that if you were actually storing this information in your frontend state,
`gift_ids` would be superfluous: you already have an association of each gift
with its guest through the gift's `guest_id` field. You could accordingly
construct a list of a guest's gifts in the frontend whenever you need it simply
by using a selector, e.g.,

```js
let guestId = 3
let gifts = Object.values(state.gifts)
                  .filter(gift => gift.guestId === guestId)
```

Since storing an array of `gift_ids` under each guest would result in the
guest-gift association's being stored in two separate places, it would also
complicate deletions and risk the data getting out of sync. For these reasons,
**a normalized state will often store a foreign key but forego storing the ids
of the `has_many` side of the association.** (You are including such id arrays
in this project simply for the practice in building Jbuilder templates.)

Finally, create a normalized response for a party's `show` page. You should have
top-level keys for `parties`, `guests`, and `gifts`. Go ahead and include arrays
for the `guest_ids` and `gift_ids` under the individual `party`. It should look
like this:

```json
{
  "parties": {
    "2": {
      "id": 2,
      "name": "Charles' Christmas Party",
      "location": "San Francisco",
      "guest_ids": [
        3,
        4
      ],
      "gift_ids": [
        5
      ]
    }
  },
  "guests": {
    "3": {
      "id": 3,
      "name": "Josh Brown",
      "age": 22,
      "favorite_color": "Brown",
      "gift_ids": [
        4,
        5
      ]
    },
    "4": {
      "id": 4,
      "name": "Helen White",
      "age": 25,
      "favorite_color": "White",
      "gift_ids": [
        6
      ]
    }
  },
  "gifts": {
    "5": {
      "id": 5,
      "title": "Basketball Tickets",
      "description": "The team's going 82-0 this year.",
      "partyId": 2,
      "guestId": 3
    }
  }
}
```

Two more things to consider. First, if the requesting frontend is written in
JavaScript, then it will likely expect its keys to be in camelCase instead of
the snake_case used by Rails. (See, e.g., `favorite_color` and `gift_ids`
above.) You can address this programmatically by telling Jbuilder always to
convert keys to camelCase. To do this, simply include the following lines at the
bottom of __config/environment.rb__:

```rb
Jbuilder.key_format camelize: :lower
# Jbuilder.deep_format_keys true
```

(Depending on how you have set up your partials and templates, the second line
may or may not be necessary. You will want to include it if you need the key
transformation applied to hashes passed to `set!`, `array!`, `merge!`, and the
like. You can also set it locally by calling `json.deep_format_keys! true` in
the template where you need it.)

You've changed one of your server's environment files, so you will need to
restart the server to see the changes. Once it is restarted, navigate to the
guest `index` or a party's `show` page: the keys should all be camelCase now!

Second, your normalized templates have probably introduced another N+1 query.
Test those three templates again, checking your server logs as you do. Fix any
N+1 issues that you find.

## What you've learned

In this project, you have learned how to use Jbuilder to select and format the
data that Rails sends to the frontend. Along the way, you also practiced
eliminating N+1 queries and building a normalized state.

[normalized-state]: https://redux.js.org/usage/structuring-reducers/normalizing-state-shape#designing-a-normalized-state