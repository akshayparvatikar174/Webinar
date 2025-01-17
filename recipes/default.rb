package 'git' do
  action :install
end

# Install Apache
package 'apache2' do
  action :install
end

# Ensure Apache is enabled and started
service 'apache2' do
  action [:enable, :start]
end

# Create the target directory
directory '/var/www/html' do
  action :create
  recursive true
end

# Clone or sync the GitHub repository to /var/www/html
git '/var/www/html' do
  repository 'https://github.com/akshayparvatikar174/HTMLpages.git' # Replace with your GitHub repo URL
  revision 'main' # Specify the branch or tag
  action :sync
end

# Ensure the downloaded index.html is correctly placed and accessible
file '/var/www/html/index.html' do
  content lazy {
    ::File.read('/var/www/html/index.html')
  }
  owner 'www-data'
  group 'www-data'
  mode '0644'
  action :create
end

# Ensure permissions are set for Apache
execute 'set_permissions' do
  command 'chown -R www-data:www-data /var/www/html'
  action :run
end

# Restart Apache to apply any changes
service 'apache2' do
  action :restart
end
