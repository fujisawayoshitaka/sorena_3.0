class StationsController < ApplicationController
before_action :set_station, only: [:edit, :show, :update, :destroy]
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to stations_path, notice: '駅は作成されました'
    else
      render :new
    end
  end

  def edit
  end

  def show
    #@netas = @station.netas
  end

  def update
    if @station.update(station_params)
      redirect_to stations_path, notice: '駅は編集されました'
    else
      render :edit, notice: '根岸線は不滅です'
    end
  end

  def destroy
    if @station.destroy
      redirect_to stations_path, notice: '駅は削除されました'
    else
      redirect_to stations_path, notice: '根岸線は不滅です'
    end
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name, :route)
  end
end
