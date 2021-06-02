class Farm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :form_of_rearing, presence: true
  validates :country, presence: true
  validates :laying_farm, presence: true
  validates :address, presence: true
end
