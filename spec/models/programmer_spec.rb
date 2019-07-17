require 'rails_helper'

RSpec.describe Programmer, type: :model do
  it { should have_valid(:name).when("Lisa Edwards")}
  it { should_not have_valid(:name).when(nil,"")}
  it { should have_many(:contributions) }
end
