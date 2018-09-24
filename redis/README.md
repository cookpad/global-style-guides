# Redis

- <a name="dont-use-keys-command-in-production"></a>
  Don't use the `KEYS` (`redis.keys(*)`) command in production. Use [alternatives](https://redis.io/commands) such as `SCAN` (`redis.scan_each(match: key`) instead
  <sup>[link](#dont-use-keys-command-in-production)</sup>
  
