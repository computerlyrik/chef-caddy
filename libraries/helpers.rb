def caddy_letsencrypt_arguments
  node['caddy']['email'] ? "-agree -email #{node['caddy']['email']}" : ''
end
