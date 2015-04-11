# Github SysOps Resource Server

Docker with a simple nginx server that serves up a repo it pulls from github every X minutes

Environment variables:

- GITHUB_REPO (required)
- GITHUB_SSH_KEY (required)
- REFRESH (default 300)
- SSL_CERT (required)
- SSL_KEY (required)
- SSL_CLIENT (required)
- DOMAIN (default localhost)

You can then run via

```bash
docker run -p 80:80  --name sysops-resources-nginx -e SSL_CERT="`cat path_to_ssl_cert`" -e SSL_KEY="`cat path_to_ssl_key`" -e SSL_CLIENT="`cat path_to_ssl_client`" -e DOMAIN="www.my-website.com" -e GITHUB_REPO="git@github.com:myorg/myrepo.git" -e GITHUB_SSH_KEY="`cat path_to_my_github_key`" -e REFRESH=30 factual/sysops-resources-nginx
```
