include_recipe 'lamp-stack-apache::default'

template "#{node['lamp']['web']['document_root']}/index.php" do
    source 'index.php.erb'
    variables ({
                servername: node['lamp']['database']['host'],  
                admin_username: node['lamp']['database']['admin_username'],
                admin_password: node['lamp']['database']['admin_password'],
                dbname: node['lamp']['database']['dbname']
     })
end