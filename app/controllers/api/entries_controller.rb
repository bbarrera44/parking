module Api
  class EntriesController < ApplicationController
    before_action :set_entrie, only: [:show, :edit, :update, :destroy, :show_ticket], raise: false
    skip_before_action :authenticate_user!, only: [:create], raise: false

    respond_to :json

    def all
    end

    def default_serializer_options
      {root: false}
    end

    include RenderHelper
    # GET /entries
    # GET /entries.json
    def index
      @entries = Entry.all
      render_default_format(@entries, true)
    end

    def vehicles_out_side
      @entries = Entry.where("exit_time is null")
      render_success_format("Vehiculos dentro del parquedero", @entries)
    end


    def vehicles_inside
      @entries = Entry.where("exit_time is not null")
      render_success_format("Vehiculos fuera del parquedero", @entries)
    end

    # GET /entries/1
    # GET /entries/1.json
    def show
      if @entry.present?
        render_default_format(@entry, true, 200)
        puts "presente"
      end
    rescue Exception => e
      puts e.inspect
    end

    # GET /entries/new
    def new
      @entrie = Entry.new
      render_default_format(@entrie, true)
    end

    # GET /entries/1/edit
    def edit
    end

    # POST /entries
    # POST /entries.json
    def create
      @entrie = Entry.new(entrie_params)
      puts 'hello'
      if @entrie.verify_entries
        render_default_error("the selected vehicle, has an entry ", 400)
      else
        @entrie.exit_time = nil
        @entrie.entry_time = Time.now
        @entrie.price = nil
        @entrie.total_time = nil
        if @entrie.save
          render_success_format("entry vehicle", @entrie)
        else
          render_default_error("falló #{@entrie} ", 400)
        end

      end
    rescue Exception => e
      render_default_error e, 401
    end


    def exit_vehicle
      vehicle = params[:vehicle]
      @entrie = Entry.find_by_vehicle_id vehicle
      if @entrie.verify_exit
        @entrie.exit_time = Time.now
        @entrie.total_time = @entrie.calcule_minutes_1
        @entrie.price = @entrie.minute_charge
        @entrie.save!
        if @entrie.save
          render_success_format("Hasta luego", @entrie)
        else
          render_default_error("updated failed", @entrie)
        end
      else
        render_default_error("ya salio", 400)
      end
    rescue StandardError => e
    rescue Exception => e
      render_default_error e, 401
    end
    def show_ticket
      render_default_format(format_exit(@entrie), true, 200)
    rescue Exception => e
      render_default_error e, 401
    end

    def format_exit model
      model.as_json(
          only: %i[  total_time price],
          methods: %i[format_time_exit format_time_entry],
          include: {
              parking:{
                  only: %i[name],
              },
              vehicle:{
                  only: %i[plate color]

      }
          }
      )

    end
    # PATCH/PUT /entries/1
    # PATCH/PUT /entries/1.json
    def update
      if @entrie.update(@entrie_params)
        render_success_format "correctly edited", @entrie
      end
    rescue StandardError => e
      Airbrake.notify(e)
      raise e
    end

    # DELETE /entries/1
    # DELETE /entries/1.json
    def destroy
      @entrie.destroy
      render_destroy_format("entrie removed")
    end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entrie
    @entrie = Entry.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def entrie_params
    params.permit(:entry_time, :exit_time, :total_time, :price, :rate_id, :parking_id, :vehicle_id)
  end
  end
  end

