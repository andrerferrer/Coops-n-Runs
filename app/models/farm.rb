class Farm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :form_of_rearing, presence: true
  validates :country, presence: true
  validates :laying_farm, presence: true
  validates :address, presence: true

  # added geocoder here, should convert address into lat/long -chris
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
