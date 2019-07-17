class RepoSerializer < ActiveModel::Serializer
  attributes :name, :description, :language, :programmers
end
