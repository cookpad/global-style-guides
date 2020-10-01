# Kafka

## Producers

- <a name="keep-small-messages"></a>
  Keep messages as small as possible. Expose just enough data so messages make sense to other systems. Use simple RESTish payloads <sup>[link](#keep-small-messages)</sup> <sup>[explanation](https://martinfowler.com/articles/microservices.html#SmartEndpointsAndDumbPipes)</sup>

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
  Prefer `{PastTenseVerb}_{Entity}`format for naming the events, [event names should be in past tense.](https://danielwhittaker.me/2014/10/18/6-code-smells-cqrs-events-avoid/) <sup>[link](#events-name-past-tense)</sup> <sup>[explanation](https://danielwhittaker.me/2014/10/18/6-code-smells-cqrs-events-avoid)</sup>

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
  "name": "voted_contest"
}
```

</details>

- <a name="topic-message-key"></a>
  Prefer `{EntityName}_#{ID}` as format of messages keys. The event ID typically maps to individual entities <sup>[link](#topic-message-key)</sup> <sup>[explanation](https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing#issues-and-considerations)</sup>

<details>
  <summary><em>Example</em></summary>


  - recipe_1
  - tip_42

</details>

- <a name="event-orders-matters"></a>
  For topics where the events order matters, make sure to keep them on the same topic partition by using the same message key or specifying the partition. <sup>[link](#event-orders-matters)</sup> <sup>[explanation](https://www.confluent.io/blog/put-several-event-types-kafka-topic/)</sup>

- Align events with real-world events.

## Consumers

- <a name="at-least-once-consumers"></a>
  Make sure consumers are idempotent when using **at-least-once** delivery <sup>[link](#at-least-once-consumers)</sup> <sup>[explanation](https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it)</sup>

- <a name="number-consumers-within-consumer-group"></a>
  Ensure the number of consumers within a consumer group is less or equal to the number of topic partitions <sup>[link](#number-consumers-within-consumer-group)</sup> <sup>[explanation](https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/ch04.html#T1_overflow_nomessage)</sup>


## Topics

- Prefer `#{produce-name}.#{enviroment}.#{topic_name}.avro` format for naming the topics.<sup>[explanation](https://itlabs.jyotirmegha.in/kiranprabhu/kafka-topic-naming-conventions-best-practices/)</sup>
- Choosing the proper number of partitions for a topic requires estimation based on the desired throughput of producers and consumers per partition, a simple formula could be: <sup>[explanation](https://www.confluent.io/blog/how-choose-number-topics-partitions-kafka-cluster/)</sup>

```
TopicPartitions = max(t/p, t/c)
```

`p`  throughout that you can achieve on a single partition for production

`c` throughout that you can achieve on a single partition for consumption

`t` target throughput

For example, if you want to be able to read 1 GB/sec, but your consumer is only able process 50 MB/sec, then you need at least 20 partitions and 20 consumers in the consumer group. Similarly, if you want to achieve the same for producers, and 1 producer can only write at 100 MB/sec, you need 10 partitions. In this case, if you have 20 partitions, you can maintain 1 GB/sec for producing and consuming messages.<sup>[ref](https://docs.cloudera.com/runtime/7.2.1/kafka-performance-tuning/topics/kafka-tune-sizing-partition-number.html)</sup>
