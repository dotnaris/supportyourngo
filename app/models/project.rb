class Project < ApplicationRecord
  belongs_to :user

  has_many :contributions
  has_many :pledges

  has_one_attached :photo
end
