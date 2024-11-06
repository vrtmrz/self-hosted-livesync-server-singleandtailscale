## The Single Dockerfile of CouchDB with Tailscale Funnel


### What is this
- CouchDB Server which configured about CORS for Obsidian and Self-hosted LiveSync in a **single Dockerfile**.
  - This enables you to bring your server to the Oracle Cloud, AWS App Runner, Google CloudRun or any other cloud Docker-PaaS services **without any domain and SSL Certificate**. Very thankfully, they have mostly free tiers.
- Instead of your domain and SSL Certificate, This image uses [TailScale](https://tailscale.com/) Funnel. Also have free tier, tremendous thankfully!

### Prerequisites
You should have an account of Tailscale.
Your Tailscale account should enabled Funnel once.

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


Note: If you are first to this, some interaction will be shown in the log. Please follow messages. 

```
Funnel is enabled, but the list of allowed nodes in the tailnet policy file does not include the one you are using.
To give access to this node you can edit the tailnet policy file, or visit:

         https://login.tailscale.com/f/funnel?node=something random

```

And, if you have completed the configuration, following will also be shown.

```
Success.
Available on the internet:

https://{TS_HOSTNAME}.xxxxxxx.ts.net/
|-- proxy http://127.0.0.1:5984

```

That's it. Enjoy your CouchDB with Tailscale Funnel.