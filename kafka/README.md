# Kafka

## Producers

- <a name="keep-small-messages"></a>
  Keep messages as small as possible. Expose just enough data so messages make sense to other systems. Use simple RESTish payloads. <sup>[link](#keep-small-messages)</sup> <sup>[explanation](https://martinfowler.com/articles/microservices.html#SmartEndpointsAndDumbPipes)</sup>

<details>
  <summary><em>Example</em></summary>
  
```javascript
// Bad
{
  "type": "record",
  "name": "published_recipe",
  "fields": [{
    "name": "published_at",
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
    }]
}

// Good
{
  "type": "record",
  "name": "published_recipe",
  "fields": [{
    "name": "published_at",
    "type":  {
      "type": "long",
      "logicalType": "timestamp-micros"
    }}]
}},
```

</details>

- <a name="events-name-past-tense"></a>
  Prefer `{PastTenseVerb}_{Entity}`format for naming the events, event names should be in past tense. <sup>[link](#real-world-events) [explanation](https://youtu.be/JzWJI8kW2kc?t=707)</sup>

<details>
  <summary><em>Example</em></summary>
  
```javascript
// Bad
{
  "type": "record",
  "name": "publishing_recipe"
}

// Good
{
  "type": "record",
  "name": "published_recipe"
}
```

</details>

- <a name="topic-message-key"></a>
  Prefer `{EntityName}_#{ID}` as the messages key format. The event ID typically maps to individual entities. <sup>[link](#topic-message-key)</sup> <sup>[explanation](https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing#issues-and-considerations)</sup>

<details>
  <summary><em>Example</em></summary>
  - recipe_1
  - tip_42

</details>

- <a name="event-orders-matters"></a>
  For topics where the events order matters, make sure to keep them on the same topic partition by using the same message key or specifying the partition. <sup>[link](#event-orders-matters)</sup> <sup>[explanation](https://www.confluent.io/blog/put-several-event-types-kafka-topic/)</sup>

## Consumers

- <a name="consumer-group-name-format"></a>
  Prefer `#{consumer-app-name}.#{enviroment}.#{consumer-group-name}` format for naming the consumer groups. <sup>[link](#consumer-group-name-format)</sup> <sup>[explanation](https://itlabs.jyotirmegha.in/kiranprabhu/kafka-topic-naming-conventions-best-practices/)</sup>

- <a name="at-least-once-consumers"></a>
  Make sure consumers are idempotent when using **at-least-once** delivery. <sup>[link](#at-least-once-consumers)</sup> <sup>[explanation](https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it)</sup>

- <a name="number-consumers-within-consumer-group"></a>
  Ensure the number of consumers within a consumer group is less or equal to the number of topic partitions. <sup>[link](#number-consumers-within-consumer-group)</sup> <sup>[explanation](https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/ch04.html#T1_overflow_nomessage)</sup>


## Topics

- <a name="topic-name-format"></a>
  Prefer `#{producer-name}.#{enviroment}.#{topic-name}.avro` format for naming topics. <sup>[link](#topic-name-format)</sup> <sup>[explanation](https://itlabs.jyotirmegha.in/kiranprabhu/kafka-topic-naming-conventions-best-practices/)</sup>

- <a name="topic-number-of-partitions"></a>
  Choose the proper number of partitions for a topic using this formula: <sup>[link](#topic-number-of-partitions)</sup> <sup>[explanation](https://www.confluent.io/blog/how-choose-number-topics-partitions-kafka-cluster/)</sup>

  ```
   TopicPartitions = max(TargetThroughput/ProducerThroughput, TargetThroughput/ConsumerThroughput)
  ```
