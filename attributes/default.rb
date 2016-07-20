default['caddy']['features'] = []
default['caddy']['email'] = nil
default['caddy']['hosts'] = {}
default['caddy']['ulimit'] = 4096
default['caddy']['ark']['url'] = "https://caddyserver.com/download/build?os=linux&arch=amd64&features=#{node['caddy']['features'].join(',')}"
default['caddy']['ark']['extension'] = 'tar.gz'
default['caddy']['ark']['binaries'] = ['./caddy']
default['caddy']['ark']['strip_components'] = 0
