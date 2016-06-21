## Notes as I go along:

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

