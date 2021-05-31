class Farm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :form_of_rearing, presence: true, acceptance: { accept: [0, 1, 2] }
  validates :country, presence: true, length: { is: 2 }
  validates :laying_farm, presence: true, length: { minimun: 5 }
  validates :address, presence: true
end
