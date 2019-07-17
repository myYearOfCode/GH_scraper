require 'rails_helper'
RSpec.describe Api::V1::ReposController, type: :controller do

  feature 'user visits the repos api endpoint', %Q{
    As a user
    I want to see the repo info
    So that I can find a repo
  } do

    scenario "the api returns valid JSON data" do
      get :index
      expect {JSON.parse(response.body)}.to_not raise_error
      parsed = JSON.parse(response.body)
      expect(parsed.class).to be(Hash)
      expect(parsed.first.class).to be(Array)
    end

    scenario "the api returns valid repo data" do
      get :index
      parsed = JSON.parse(response.body)
      expect(parsed["repos"][0].keys).to include("name")
      expect(parsed["repos"][0].keys).to include("description")
      expect(parsed["repos"][0].keys).to include("language")
      expect(parsed["repos"][0].keys).to include("programmers")
    end
  end
end
