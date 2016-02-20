require 'serverspec'

set :backend, :exec

describe port(2015) do
  it { should be_listening }
end

describe port(8080) do
  it { should be_listening }
end

describe service('caddy') do
  it { should be_enabled }
  it { should be_running }
end
