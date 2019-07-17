class Repo < ApplicationRecord
  has_many :contributions
  has_many :programmers, through: :contributions

  validates :name, presence: true
end
