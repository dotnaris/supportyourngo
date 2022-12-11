class Project < ApplicationRecord
  belongs_to :user

  has_many :contributions, dependent: :destroy
  has_many :pledges, dependent: :destroy

  has_one_attached :photo
end
