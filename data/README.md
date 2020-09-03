# Data

## Streaming 	

- Keep messages as small as possible using simple RESTish. Borrowed from [Smart endpoints and dumb pipes](https://martinfowler.com/articles/microservices.html#SmartEndpointsAndDumbPipes) pattern and the [Aggregate root pattern](https://martinfowler.com/bliki/DDD_Aggregate.html)

<details>
  <summary><em>Example</em></summary>

```json
# Bad
{
  "name": "published_recipe",
  "fields": [{
    "name": "approved_at",
    "type":  {
      "type": "long",
      "logicalType": "timestamp-micros"
    },
    {
      "name": "first_approved_at",
      "type": ["null", {
         "type": "long",
         "logicalType": "timestamp-micros"
      }],
      "default": null
    },

# Good
{
  "name": "published_recipe",
  "fields": [{
    "name": "approved_at",
    "type":  {
      "type": "long",
      "logicalType": "timestamp-micros"
    },
```

```json
# Bad
{
  "name": "deleted_recipe",
  "fields": [{
      "name": "event_time",
      "type": {
        "type": "long",
        "logicalType": "timestamp-micros"
      }
    },
    {
      "name": "title",
      "type": ["null", "string"],
      "default": null
    },

# Good
{
  "name": "deleted_recipe",
  "fields": [{
      "name": "event_time",
      "type": {
        "type": "long",
        "logicalType": "timestamp-micros"
      }
    }
```

</details>

- Prefer `{PastVerb}{Entity}Event`format for naming the events

<details>
  <summary><em>Example</em></summary>

  ```ruby
  ## Bad
  VotingContestEvent
  ## Good
  VotedContestEvent
  ```
</details>

## Consumers

