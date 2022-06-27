# Info

often metion with DDD and Event Sourcing

# CQS Command Query Separation

- command
  - change object internal state then
  - return nothing or meta-data only
- query
  - return infomation but
  - **doesn't** change internal state

A method should never be both simultaneously

Examples:

- Stack.push: command
- Stack.top: query
- Stack.pop: **violate** pattern

Can separate databases for reading and writing

But a client does not find out whether a command has already been processed and what the result was
Therefore, it is recommended to use a third API, **the Events API**, which informs about events via **push notifications** via web sockets, HTTP streaming, or a similar mechanism.

So instead of returning result immediately, it return result later by pushing those data to client

**Interesting**

# Refs

[https://levelup.gitconnected.com/what-is-cqrs-8ddd74ca05bb](https://levelup.gitconnected.com/what-is-cqrs-8ddd74ca05bb)