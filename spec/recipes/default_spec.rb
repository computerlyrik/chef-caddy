require_relative '../spec_helper'

describe 'caddy::default' do
  subject { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'generates Caddyfile' do
    is_expected.to render_file('/etc/Caddyfile')
  end

  context 'complex Caddyfile' do
    let(:hosts_json) { JSON.parse(File.read("spec/fixtures/hosts.json")) }
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['caddy']['hosts'] = hosts_json
      end.converge(described_recipe)
    end

    it 'generates complex Caddyfile' do
      caddy_file = File.read("spec/fixtures/Caddyfile").chomp
      expect(chef_run).to render_file('/etc/Caddyfile').with_content(caddy_file)
    end
  end
end
