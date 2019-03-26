module Api
class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy], raise: false
  skip_before_action :authenticate_user!, only: [:create], raise: false

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end

  include RenderHelper
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all
    render_default_format(@rates, true)
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    if @rate.present?
      render_default_format(@rate, true, 200)
      puts "presente"
    end
  rescue Exception => e
    puts e.inspect
  end

  # GET /rates/new
  def new
    @rate = Rate.new
    render_default_format(@rate, true)
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  # POST /rates.json
  def create
    puts "llego"
    @rate = Rate.new(rate_params)
    if @rate.save
      render_success_format('rate created correctly', @rate)

    end


  rescue Exception => e
    render_default_error e, 401
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    if @rate.update(rate_params)
      render_success_format("correctly edited", @rate)
    end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate.destroy
    render_destroy_format("rate removed")
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rate
    @rate = Rate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rate_params
    params.permit(:name, :value, :date_begin, :date_end)
  end
end
end