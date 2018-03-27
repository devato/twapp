# Twitter React/Rails

Rails app with a React frontend in the `/client` directory. @tmartin314

https://twapp.staig.me

## Setup

```
$ git clone git@github.com:devato/twapp.git
$ cd twapp
```

## Setup ENV files

```
cp .env.example .env && cp client/.env.example client/.env
```

### Optional: Create a twitter app for pinging the API:

Because this project is private, I've left my creds in the `.env.example` to make it easier

If you would like to create your own:
https://apps.twitter.com/

Then add your twitter app credentials to `.env`:

```
TWITTER_CONSUMER_KEY=123
TWITTER_CONSUMER_SECRET=123
TWITTER_ACCESS_TOKEN=123
TWITTER_SECRET_TOKEN=123
```

## Build & Start the app

```
$ docker-compose up --build
```
This will take a few minutes, but it will create the db, migrate and seed it so it's ready to run.  

Once you see `You can now view client in the browser.` from the `client_1` service, you're ready to test the app in the browser:

```
Go to your localhost or docker machine IP at port: 8080
Ie. http://localhost:8080
```

## Services

| Service  | Info |
| ------------- | ------------- |
| `api` | rails app for fetching storing tweets and serving the endpoints |
| `client` |  react app for the UI which consumes the data found in the API |
| `redis` | tmp store for scheduled jobs  |
| `postgres` | main persistence DB for storing topics and tweet data |
| `sidekiq`  | background process worker service. runs fetching/pruning jobs |
| `nginx` | directs requests to the appropriate service |

## Testing

To test the Rails api there are some wrapper scripts in the `docker/` directory:

```
$ docker/test
```

Testing is the same on the client:

```
$ cd client
$ docker/test
```

