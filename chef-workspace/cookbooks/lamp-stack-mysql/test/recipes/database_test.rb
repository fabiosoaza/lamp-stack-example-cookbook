# # encoding: utf-8

# Inspec test for recipe lamp::database

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(3306) do
  it { should be_listening }
end

describe service('mysql-default') do
  it { should be_enabled }
  it { should be_running }
end

 describe mysql_session('dbadmin', 'admin_password', '127.0.0.1', 3306).query("show databases;") do
   its('stdout') { should contain('default') }
 end