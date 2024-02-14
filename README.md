# dd-tracing-poc

```bash
# start the stack, ensuring the DD_API_KEY is set in the environment
DD_API_KEY=<key> docker compose up --build

# make 20 requests
./run.sh

# in the datadog UI, each request will create one trace
```

## Expected behaviour
Trace sampling rules are honored

## Actual behaviour
Trace sampling isn't taken into account