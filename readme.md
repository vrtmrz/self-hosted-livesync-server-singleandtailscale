## The Single Dockerfile of CouchDB with Tailscale Serve


### What is this
- CouchDB Server which configured about CORS for Obsidian and Self-hosted LiveSync in a **single Dockerfile**.
  - This enables you to bring your server to the Oracle Cloud, AWS App Runner, Google CloudRun or any other cloud Docker-PaaS services **without any domain and SSL Certificate**. Very thankfully, they have mostly free tiers.
- Instead of your domain and SSL Certificate, This image uses [TailScale](https://tailscale.com/) Serve. Also have free tier, tremendous thankfully!

### Prerequisites
You should have an account of Tailscale.
Your Tailscale account should enabled Serve.

(To more instructions, read the [official document](https://tailscale.com/blog/docker-tailscale-guide)).

# How to use

You should make sure following Environment variables.

| Key              | Value                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------- |
| COUCHDB_USER     | Anything as you like                                                                      |
| COUCHDB_PASSWORD | Also anything as you like                                                                 |
| TS_AUTHKEY       | Your Tailscale's AuthKey (OAuth's one is recommended) like (`tskey-client-kZzPua6vh....`) |
| TS_EXTRA_ARGS    | As you configured, like : `--advertise-tags=tag:container`                                |
| TS_HOSTNAME      | anything you like as `tailscaled-couchdb` (This would be a subdomain of your node)        |


> **Note:** When you run the container for the first time, you may see interactive messages in the log. Please follow the instructions.

This version uses **Tailscale Serve** so that CouchDB is only accessible within your Tailnet. After successful configuration, you should see something like:

```
Success.
Available on your Tailnet:

https://{TS_HOSTNAME}.{tailnet-name}.ts.net/
|-- proxy http://127.0.0.1:5984

```

That's it. Enjoy your CouchDB with Tailscale Serve.
