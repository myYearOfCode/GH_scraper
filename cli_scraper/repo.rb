class Repo
  attr_reader :name, :description, :language, :contributors

  def initialize(name, description, language = nil, contributors)
    @name = name
    @description = description
    @language = language
    @contributors = contributors
  end

  def print

    puts "##############################################################"
    puts "name: #{name}"
    puts "description: #{description}"
    puts "language: #{language || "NA"}"
    puts "contributors: #{contributors}"
    puts "##############################################################", ()
  end
end
