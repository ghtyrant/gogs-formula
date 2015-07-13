require 'spec_helper'

describe package('daemonize') do
  it { should be_installed }
end

describe user('git') do
  it { should exist }
  it { should belong_to_group 'git' }
  it { should have_home_directory '/home/git' }
end

describe file('/home/git/gogs') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
end

describe file('/home/git/gogs/gogs') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
end

describe file('/home/git/gogs/log') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
end

describe file('/etc/rc.d/init.d/gogs') do
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:sha256sum) { should eq '87701136031c45e156d4075ef3ce9c656d6da2db122add395daaff20382a16f5' }
end

describe service('gogs') do
  it { should be_enabled }
  it { should be_running }
end

describe process('gogs') do
  it { should be_running }
  its(:user) { should eq 'git' }
  its(:group) { should eq 'git' }
end

describe port(3000) do
  it { should be_listening.with('tcp') }
end

describe file('/home/git/gogs/custom/conf/app.ini') do
  it { should be_mode 644 }
  it { should be_owned_by 'git' }
  it { should be_grouped_into 'git' }
  its(:sha256sum) { should eq 'f1a6d5d2dbe602f6651ff4ffa3b87dfe424c14f209b42028f78c9d4ac4078b5b' }
end
