class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource
  skip_authorize_resource :only => [:new, :create]

  # GET /games
  # GET /games.json
  def index
    @games = Game.order(jam_id: :asc)
    @jams = Jam.order(title: :desc)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    commontator_thread_show(@game)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = current_user.games.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    @game.send params[:vote], current_user
    redirect_to games_path
  end

  # def upvote
  #   @game.upvote_by current_user
  #   redirect_to games_path
  # end

  # def downvote
  #   @game.downvote_by current_user
  #   redirect_to games_path
  # end

  # def unvote
  #   @game.unvote_by current_user
  #   redirect_to games_path
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find_by(title: params[:id]) || Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :description, :external_link, :game_file, :url, :height, :width, :jam_id, {screenshots:  []}, {multifiles: []})
    end
end
