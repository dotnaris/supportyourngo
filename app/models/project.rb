class Project < ApplicationRecord
  belongs_to :user

  has_many :contributions, dependent: :destroy
  has_many :pledges, dependent: :destroy

  has_one_attached :photo

  validates :user_id, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :paragraph_title, presence: true
  validates :description, presence: true

end
