class JamsController < ApplicationController
  before_action :set_jam, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /jams
  # GET /jams.json
  def index
    @jams = Jam.order(title: :desc)
  end

  # GET /jams/1
  # GET /jams/1.json
  def show
    @games = Game.where(jam_id: params[:id])
  end

  # GET /jams/new
  def new
    @jam = Jam.new
    authorize! :create, @jam
  end

  # GET /jams/1/edit
  def edit
    @games = @jam.games
    authorize! :edit, @jam
  end

  # POST /jams
  # POST /jams.json
  def create
    @jam = Jam.new(jam_params)

    respond_to do |format|
      if @jam.save
        format.html { redirect_to @jam, notice: 'Jam was successfully created.' }
        format.json { render :show, status: :created, location: @jam }
      else
        format.html { render :new }
        format.json { render json: @jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jams/1
  # PATCH/PUT /jams/1.json
  def update
    respond_to do |format|
      if @jam.update(jam_params)
        format.html { redirect_to @jam, notice: 'Jam was successfully updated.' }
        format.json { render :show, status: :ok, location: @jam }
      else
        format.html { render :edit }
        format.json { render json: @jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jams/1
  # DELETE /jams/1.json
  def destroy
    @jam.destroy
    respond_to do |format|
      format.html { redirect_to jams_url, notice: 'Jam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jam
      @jam = Jam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jam_params
      params.require(:jam).permit(:title, :theme, :mechanic, :status, :winner)
    end
end
