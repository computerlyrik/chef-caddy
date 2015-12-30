property :port, Integer, default: 81
property :ssl, :kind_of => [TrueClass, FalseClass], default: true


load_current_value do
end

action :create do
	
  

  file '/var/www/html/index.html' do
    content homepage
  end
end
