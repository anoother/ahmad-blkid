require 'spec_helper'
describe 'blkid' do

  context 'with defaults for all parameters' do
    it { should contain_class('blkid') }
  end
end
