# # encoding: utf-8

# Inspec test for recipe map-stack-haproxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe service('haproxy') do  
  it { should be_enabled }
  it { should be_running }
end

describe command('curl localhost') do
  its(:stdout) { should contain("Hello World!")}
end
