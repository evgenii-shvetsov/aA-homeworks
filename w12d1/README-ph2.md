# Jbuilder Exercises, Phase 2: Fixing N+1 Queries

In writing these views, you've probably generated some gnarly N+1 queries. Are
you calling `.gifts` for every guest in the parties show view? That's a query
for every guest! To fix this, remember your Active Record skills. `.includes`
pre-fetches whatever data you tell it to fetch. For example, in the
`PartiesController#show`, you could call `.includes(guests: [:gifts])`; then,
when you call `.gifts` on each guest in your Jbuilder template, you will use
that pre-fetched data and won't actually have to hit the database again. Go
ahead and fix that now.

Find any other N+1 queries you've made throughout and defeat them. **Hint:**
Play around with your API in development and watch your server logs. Look for a
query followed by many repetitive queries. E.g., with the party `show` view,
before you fixed the N+1 query, your server logs would have looked something
like this:

```shell
Started GET "/api/parties/1" for ::1 at 2021-11-10 00:29:14 -0500
Processing by Api::PartiesController#show as JSON
  Parameters: {"id"=>"1"}
  Party Load (0.2ms)  SELECT "parties".* FROM "parties" WHERE "parties"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  Rendering api/parties/show.json.jbuilder
  Rendered api/parties/_party.json.jbuilder (Duration: 0.1ms | Allocations: 18)
  Guest Load (0.6ms)  SELECT "guests".* FROM "guests" INNER JOIN "invitations" ON "guests"."id" = "invitations"."guest_id" WHERE "invitations"."party_id" = $1  [["party_id", 1]]
  Gift Load (0.2ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" = $1  [["guest_id", 1]]
  Gift Load (0.2ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" = $1  [["guest_id", 2]]
  Gift Load (5.9ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" = $1  [["guest_id", 3]]
  Gift Load (4.0ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" = $1  [["guest_id", 4]]
  Gift Load (4.4ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" = $1  [["guest_id", 5]]
  Rendered api/parties/show.json.jbuilder (Duration: 87.4ms | Allocations: 18963)
Completed 200 OK in 116ms (Views: 55.6ms | ActiveRecord: 41.9ms | Allocations: 23634)
```

See all those Gift Loads? Those are the N queries to accompany your 1 query for
the party and 1 query for the guests.

When it's fixed, it should look more like this:

```sh
Started GET "/api/parties/1" for ::1 at 2021-11-10 00:27:18 -0500
Processing by Api::PartiesController#show as JSON
  Parameters: {"id"=>"1"}
  Party Load (0.2ms)  SELECT "parties".* FROM "parties" WHERE "parties"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  Invitation Load (2.5ms)  SELECT "invitations".* FROM "invitations" WHERE "invitations"."party_id" = $1  [["party_id", 1]]
  Guest Load (2.1ms)  SELECT "guests".* FROM "guests" WHERE "guests"."id" IN ($1, $2, $3, $4, $5)  [["id", 1], ["id", 2], ["id", 3], ["id", 4], ["id", 5]]
  Gift Load (42.1ms)  SELECT "gifts".* FROM "gifts" WHERE "gifts"."guest_id" IN ($1, $2, $3, $4, $5)  [["guest_id", 1], ["guest_id", 2], ["guest_id", 3], ["guest_id", 4], ["guest_id", 5]]
  Rendering api/parties/show.json.jbuilder
  Rendered api/parties/_party.json.jbuilder (Duration: 0.1ms | Allocations: 13)
  Rendered api/parties/show.json.jbuilder (Duration: 0.7ms | Allocations: 495)
Completed 200 OK in 66ms (Views: 1.3ms | ActiveRecord: 46.9ms | Allocations: 4084)
```

Only one query per table! That's what you want to see. Notice the difference in
overall time: 66ms for the pre-fetched version vs. 116ms for the version with
multiple Gift Loads. And that's just for 5 guests. Imagine how that time
differential will balloon as a guest list grows into the hundreds...

Next, practice constructing a normalized state in Phase 3!