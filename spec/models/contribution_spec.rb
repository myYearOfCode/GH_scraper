require 'rails_helper'

RSpec.describe Contribution, type: :model do
  it { should belong_to(:repo) }
  it { should belong_to(:programmer) }
  it { should have_valid(:repo_id).when(5)}
  it { should_not have_valid(:repo_id).when(nil,"","X")}
  it { should have_valid(:programmer_id).when(5)}
  it { should_not have_valid(:programmer_id).when(nil,"","e")}
end
