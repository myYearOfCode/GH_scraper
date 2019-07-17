require 'rails_helper'

RSpec.describe Repo, type: :model do
  it { should have_valid(:name).when("My Great Idea")}
  it { should_not have_valid(:name).when(nil,"")}
  it { should have_many(:contributions) }
end
