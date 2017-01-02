require 'spec_helper'
describe 'just_the_facts' do

  context 'with defaults for all parameters' do
    it { should contain_class('just_the_facts') }
  end
end
