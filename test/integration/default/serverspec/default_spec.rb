require 'spec_helper'

describe user('git') do
  it { should exist }
  it { should belong_to_group 'git' }
  it { should have_home_directory '/home/git' }
end

describe file('/etc/rc.d/init.d/gogs') do
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:sha256sum) { should eq 'ebc9c582d36fd139bf742af6df4717c91ace0202d9766d077669f795efcf777a' }
end
