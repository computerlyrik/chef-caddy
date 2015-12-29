resource_name :caddy

property :host, String
property :port, Integer
property :backend_port, Integer

load_current_value do
end

action :create do
  template 'Caddyfile' do
    variables ({ :resource => @current_resource })
  end
end
