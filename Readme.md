# Architectural findings

- First of all - my experience being mostly on the front-end, it did take me a
  while longer than expected. I did not get to statistics at all. It took me
  an hour to configure the basics :-/. I feel that particular hindrance is not
  really representative of day-to-day tasks though.
- Considering the above, I decided to focus on writing really thorough tests, with
  hopes that it would lead me to making better design decisions in areas where I'm
  weak (database stuff). It paid off.
- Instructions called for replacing all tags if entity already existed - but it
  seemed more efficient to only create new ones for changed tags, and delete the
  ones that are no longer present. Implemented it that way and also tested that
  this is actually what's happening.
- Instructions called for deleting all the tags when entity would be deleted - but
  it seemed more efficient to allow same tag to be shared by multiple entities, so
  instead I delete only tags that have no entities left.
- On final note - I found routes prescribed in instructions a little excessive
  (didn't feel the need for both `entity_id` and `entity_type` to be dynamic),
  however made them work exactly as requested.

#### Running tests:
Just run

```
rspec
```

## Notes as I was going along:

- Haven't built a rails app from scratch in... years. My experience has been
  mostly front-end, but much more full-stack at my previous job (Chalk).
- Cleaning up default `Gemfile` found out about `Jbuilder`. This is probably
  something that would be useful for this exercise - but I will forgo learning
  about it as it seems like a rabbit hole that might take up more time than two
  hours allotted.

#### Onwards to the actual exercise.

- Being a front-ender, I would probably want an index page of some sort to allow
  testing the calls. However, that's "extra credit", so will leave it to the end
  after I've used up my 2h following the instructions.
- Seems like I need two models, `entities` and `tags`. Entity has `type`, tag has
 `text`. Let's start with that and tests for these models & relationship.
- Woah, tests took more minutes to configure than I had hoped. Oh well. So,
  onwards - going from lower level out, next bit necessary would be controllers
  to allow creating, reading and deleting entities with tags. As we would be
  manipulating `Entity` objects seems like `entities_controller` is the right
  place to put that code.
-  Just added a controller with appropriate actions and made routes match what
the instructions asked for (also, of course - added tests). At that moment, 2h
that I was supposed to spend on the task has expired.

Because next bits - fleshing out create/show/destroy actions & tests - are the
meat and gravy of the exersize, and because most of the first hour I spent
setting up and configuring the newly-minted rails app -  I will carry on and spend
a bit more time getting at least that bit done. Won't get to the stats, but will
at least get taggability working.


---
... Came back to this challenge 6h later. Will try to TDD the entities
controller, even though that's taking me longer than allowed 2h.

Discovered while writing tests that `Entities` need another attribute, and that it
would probably be better to have a join table between entities & tags to avoid
creating duplicate tags with same text.
Added a migration for db changes, wrote test descriptions for the controller.

Ok, a few more hours later - done! Yay, test-driving it was pretty fun, actually. A
lot less intimidating, because only needed to think about one thing at a time. Time
to go to sleep, and send this off.


* * *

# Instructions:

# Generic Tagging JSON API

We will be building a Generic Tagging JSON API that can store, retrieve, delete and report on the usage of a "tag" across different entities. This is a guide for the endpoints, if you think you have a better route or would like to modify the naming/schema feel free.

### Create an Entry

```
POST /tag

- Entity Type, e.g. 'Product', 'Article'
- Entity Identifier, e.g. '1234', '582b5530-6cdb-11e4-9803-0800200c9a66'
- Tags, e.g. ['Large', 'Pink', 'Bike']

If the entity already exists it should replace it and all tags, not append to it
```

### Retrieve an Entry

```
GET /tags/:entity_type/:entity_id

- should return a JSON representation of the entity and the tags it has assigned
```

### Remove an Entry

```
DELETE /tags/:entity_type/:entity_id

Completely removes the entity and tags
```

### Retrieve Stats about all Tags

```
GET /stats

Retrives statistics about all tags

e.g. [{tag: 'Bike', count: 5}, {tag: 'Pink', count: 3}]
```

### Retrieve Stats about a specific Entity

```
GET /stats/:entity_type/:entity_id

Retrives statistics about a specific tagged entity
```

### What we're looking for:

* It runs!
* We can see that all of the tests pass.
* You followed directions and used your best judgement to ensure a correct solution.
* You explained your reasoning in readme.md
* The code is understandable and easy to read.
* You followed standards and conventions relating to Ruby and Rails development.
* You've written the code as though it will be released to production.

