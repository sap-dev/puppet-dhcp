require 'spec_helper'
describe 'dhcp' do

  context 'with defaults for all parameters' do
    it { should contain_class('dhcp') }
  end
end
