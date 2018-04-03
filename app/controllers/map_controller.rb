class MapController < ApplicationController
  def index

  end

  def data
  	render json: Car.active.to_json( except: [:created_at, :updated_at, :foreign_id] )
  end
end
