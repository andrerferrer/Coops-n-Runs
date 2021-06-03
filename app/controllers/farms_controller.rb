class FarmsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_farm, only: [:show, :edit]

  def index
    if params[:query].present?
      @farms = Farm.where("name ILIKE @@ :query OR syllabus ILIKE :query", query: "%{params[:query]}%")
    else
      @farms = Farm.all
    end
  end

  def show
    # authorize @farm
    @markers = [@farm].map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude
      }
    end
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


