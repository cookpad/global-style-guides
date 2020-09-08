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

- Prefer `{EntityName}_#{ID}` format for message key providing a unique identifier for stream of events, The event ID typically maps to individual entities <sup>[link](https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing#issues-and-considerations)</sup>,

<details>
  <summary><em>Example</em></summary>

  - recipe_e5cb6e1c65bc
  - tip_d1851256

</details>

- [The orders of these events matters](https://www.confluent.io/blog/put-several-event-types-kafka-topic/) for [Event Sourcing](https://martinfowler.com/eaaDev/EventSourcing.html) pattern, make sure preserve the order of those events by putting them all in the same topic partition.

## Consumers

- Build idempotent operations with at least once delivery
- The number of consumers sharing the work of consuming can be at most the number of log partition in that topic, because messages within the same partition are delivered to the same consumer. <sup>[link](https://www.oreilly.com/library/view/designing-data-intensive-applications/9781491903063/)</sup>

<details>
  <summary><em>Example</em></summary>
  <img src="https://user-images.githubusercontent.com/505427/92496663-55abf800-f1f0-11ea-8214-e603b8bbb392.png" alt="consumer_example">
</details>

## Topics

- Prefer `#{produce-name}.#{enviroment}.#{entity}.avro` format for naming the topics
