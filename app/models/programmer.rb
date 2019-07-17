class Programmer < ApplicationRecord
  has_many :contributions
  has_many :repos, through: :contributions

  validates :name, presence: true
end
