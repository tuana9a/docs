# backend

## Checklist

- [ ] Suddenly poweroff
- [ ] Suddenly lost connection to the database
- [ ] High network latency
- [ ] High memory usage
- [ ] High cpu usage
- [ ] Suddenly full disk usage
- [ ] DDOS attack
- [ ] Backup your data (hourly, daily, monthly)
- [ ] Practice restore data from database
- [ ] Does your backend support multiple api versions
- [ ] CI / CD
- [ ] Trap hackers with [Honeytoken](https://en.wikipedia.org/wiki/Honeytoken)
- [ ] Cache ?
- [ ] Connection pool
- [ ] N+1 query problem
- [ ] Compression (gzip)

## How to scale (in a nutshell)

| Problems:                 | Solutions:             |
| ------------------------- | ---------------------- |
| Cascading Failure         | Rate Limiting          |
| Going viral               | Pre Scale              |
| Predictable load increase | Auto Scale             |
| Bulk Job Scheduling       | Batch Processing       |
| Popular Posts             | Approximate Statistics |
