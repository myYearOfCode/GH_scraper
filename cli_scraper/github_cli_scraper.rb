require 'nokogiri'
require 'open-uri'
require 'pry'
require './repo'

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
      contributors = repo_li.search(".f6 .mr-3 a").map { |node| node["href"][1..-1]}
      repo = Repo.new(repo_name, description, language, contributors)
      repos.push(repo)
      repo.print
    end

    puts "#{find_repo_language_count(repos, "JavaScript")} total JavaScript repos found."
    puts "#{find_repo_language_count(repos, nil)} total repos found with no language listed."
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

get_repos
