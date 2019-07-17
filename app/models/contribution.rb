class Contribution < ApplicationRecord
  belongs_to :repo
  belongs_to :programmer

  validates :repo_id, presence: true, numericality: true
  validates :programmer_id, presence: true, numericality: true
end
