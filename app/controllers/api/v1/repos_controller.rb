require 'nokogiri'
require 'open-uri'
require "json"

class Api::V1::ReposController < ApplicationController
  def index
    if Rails.env == "test"
      test_data = {"repos": [
        {
          "name": "996.ICU",
          "description": "Repo for counting stars and contributing. Press F to pay respect to glorious developers.",
          "language": "Rust",
          "programmers": [
            {
              "id": 766,
              "name": "996icu",
              "created_at": "2019-04-29T02:08:13.703Z",
              "updated_at": "2019-04-29T02:08:13.703Z"
            },
            {
              "id": 767,
              "name": "ChangedenCZD",
              "created_at": "2019-04-29T02:08:13.732Z",
              "updated_at": "2019-04-29T02:08:13.732Z"
            },
            {
              "id": 768,
              "name": "bofeiw",
              "created_at": "2019-04-29T02:08:13.741Z",
              "updated_at": "2019-04-29T02:08:13.741Z"
            },
            {
              "id": 769,
              "name": "happymili",
              "created_at": "2019-04-29T02:08:13.749Z",
              "updated_at": "2019-04-29T02:08:13.749Z"
            },
            {
              "id": 770,
              "name": "xianfengting",
              "created_at": "2019-04-29T02:08:13.758Z",
              "updated_at": "2019-04-29T02:08:13.758Z"
            }
          ]
        }
      ]
    }
      response = test_data
    else
      response = get_repos
    end
    render json: response
  end

  private

  def get_repos
      main_url = "https://github.com/trending?since=weekly"
      data = data_scraper(main_url)
      repos = []
      divs = data.search(".repo-list").search("li")
      divs.each do |repo_li|
        repo_name = repo_li["id"][3..-1]
        description = repo_li.search("div p").text.strip
        begin
          language = repo_li.search(".f6 .ml-0").last.text.strip
        rescue NoMethodError
          language = nil
        end
        puts repo_name
        programmers = repo_li.search(".f6 .mr-3 a").map { |node| node["href"][1..-1]}
        repo = Repo.find_or_create_by(
          name: repo_name,
          description: description,
          language: language,
          contributors_list: programmers
        )
        programmers.each do |programmer|
          new_programmer = Programmer.create(name: programmer)
          Contribution.create(repo:repo, programmer: new_programmer)
        end
        repos.push(repo)

      end

      puts "#{find_repo_language_count(repos, "JavaScript")} total JavaScript repos found."
      puts "#{find_repo_language_count(repos, nil)} total repos found with no language listed."
      repos
  end

  def find_repo_language_count(repo_array, language)
      js_count = 0
      repo_array.each do |repo|
        if repo.language == language
          js_count += 1
        end
      end
      return js_count
  end

  def data_scraper(url)
      Nokogiri::HTML(open(url))
  end
end
