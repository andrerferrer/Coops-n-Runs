class FarmsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_farm, only: [:show, :edit]

  def show
    @farm = Farm.find(parans[:id])
    authorize @farm
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :form_of_rearing, :country, :laying_farm, :address, :latitude, :longitude, :user_id, :area, :chicken_count, :website_url)
  end

end

# create_table "farms", force: :cascade do |t|
#     t.string "name"
#     t.integer "form_of_rearing"
#     t.string "country"
#     t.string "laying_farm"
#     t.string "address"
#     t.float "latitude"
#     t.float "longitude"
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.float "area"
#     t.integer "chicken_count"
#     t.string "website_url"
#     t.index ["user_id"], name: "index_farms_on_user_id"
#   end

# belongs_to :user
#   validates :name, presence: true
#   validates :form_of_rearing, presence: true, acceptance: { accept: [0, 1, 2] }
#   validates :country, presence: true, length: { is: 2 }
#   validates :laying_farm, presence: true, length: { minimun: 5 }
#   validates :address, presence: true
# end
