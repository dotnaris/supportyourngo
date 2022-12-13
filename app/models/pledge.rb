class Pledge < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :reward, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
