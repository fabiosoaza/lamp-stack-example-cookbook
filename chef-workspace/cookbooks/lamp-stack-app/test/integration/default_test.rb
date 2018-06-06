# # encoding: utf-8

# Inspec test for recipe lamp_app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  control "User root should be created" do
    title 'root exist'
    describe user('root') do
      it { should exist }
    end
  end
end

# This is an example test, replace it with your own test.
control "Port 80 should be listening" do
  title 'port is listening'
  describe port(80)  do
    it { should be_listening }
  end
end

#match 
2.times do |n|
  control "Checking Web instance #{n+1}" do
    title "Web instance #{n+1} is ok"
    describe command('curl localhost') do
      #check balancer 1
      its(:stdout) { should match(/app-web[1-2]/)}
    end
  end 
end  

#TODO add a test to verify connection of application with database