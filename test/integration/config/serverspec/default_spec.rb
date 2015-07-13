require 'spec_helper'

describe file('/home/git/gogs/custom/conf/app.ini') do
  its(:content) { should match /DOMAIN = gogs\.local/ }
  its(:content) { should match /ROOT_URL = http:\/\/gogs\.local:3000/ }
end
