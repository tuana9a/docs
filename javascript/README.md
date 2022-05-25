# COMMON

```ts
const printReach = ((init: number) => {
    return (i: number) => {
        console.log(`reach ${i || init++}`);
    };
})(0);
```