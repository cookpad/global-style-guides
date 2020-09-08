# Kafka

## Streaming

- Keep messages as small as possible using simple RESTish. Borrowed from [Smart endpoints and dumb pipes](https://martinfowler.com/articles/microservices.html#SmartEndpointsAndDumbPipes) pattern and the [Aggregate root pattern](https://martinfowler.com/bliki/DDD_Aggregate.html)

<details>
  <summary><em>Example</em></summary>

  ```javascript
    // Bad
    {
      "type": "record",
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

    // Good
    {
      "type": "record",
      "name": "published_recipe",
      "fields": [{
        "name": "approved_at",
        "type":  {
          "type": "long",
          "logicalType": "timestamp-micros"
        },
  ```

  ```javascript
    // Bad
    {
      "type": "record",
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

    // Good
    {
      "type": "record",
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

- Prefer `{PastVerb}_{Entity}`format for naming the events

<details>
  <summary><em>Example</em></summary>

  ```javascript
    // Bad
    {
      "type": "record",
      "name": "voting_contest",

    // Good
    {
      "type": "record",
      "name": "voted_contest",

  ```
</details>

- Provide a unique identifier for stream of events, The event ID typically maps to individual entities <sup>[link](https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing#issues-and-considerations)</sup>

## Consumers

- Build idempotent operations with at least once delivery

## Topics

- Prefer `#{produce-name}.#{enviroment}.#{entity}.avro` format for naming the topics
