# Redis

- <a name="dont-use-keys-in-production"></a>
  Redis is threaded this means some commands can potentially block the instance while being 
  executed, such is the case for `KEYS` (`redis.keys(*)`), look for alternative operation 
  like `SCAN`. When in doubt look at [Redis' oficial docs](https://redis.io/commands) or 
  consult with the [SRE team](https://github.com/orgs/cookpad/teams/infra/members).
  <sup>[link](#dont-use-keys-in-production)</sup>
