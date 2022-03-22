# traffic-generator

This project is used to generate traffic in a test application.

![diagram](./assets/diagram.png)

## Pre-reqs:

- Docker desktop

## Quick start

To build your local envronment is very easy.

### Step 1 - Jump to project folder

```cd traffic-generator```

### Step 2 - Launch influxdb and grafana containers

```docker-compose up -d influxdb grafana```

### Step 3 - Uhuu, Now run a test example

```docker-composer run k6 run /scripts/load.js```

## You rock

Now you have freedom for customize others test plans.

Ref.: https://k6.io/docs/getting-started/running-k6/ 