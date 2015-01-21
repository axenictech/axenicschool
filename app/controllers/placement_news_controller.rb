class PlacementNewsController < ApplicationController
  before_action :set_placement_news, only: [:show, :edit, :update, :destroy]

  # GET /placement_news
  # GET /placement_news.json
  def index
    @placement_news = PlacementNews.all
  end

  # GET /placement_news/1
  # GET /placement_news/1.json
  def show
  end

  # GET /placement_news/new
  def new
    @placement_news = PlacementNews.new
  end

  # GET /placement_news/1/edit
  def edit
  end

  # POST /placement_news
  # POST /placement_news.json
  def create
    @placement_news = PlacementNews.new(placement_news_params)

    respond_to do |format|
      if @placement_news.save
        format.html { redirect_to @placement_news, notice: 'Placement news was successfully created.' }
        format.json { render :show, status: :created, location: @placement_news }
      else
        format.html { render :new }
        format.json { render json: @placement_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placement_news/1
  # PATCH/PUT /placement_news/1.json
  def update
    respond_to do |format|
      if @placement_news.update(placement_news_params)
        format.html { redirect_to @placement_news, notice: 'Placement news was successfully updated.' }
        format.json { render :show, status: :ok, location: @placement_news }
      else
        format.html { render :edit }
        format.json { render json: @placement_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placement_news/1
  # DELETE /placement_news/1.json
  def destroy
    @placement_news.destroy
    respond_to do |format|
      format.html { redirect_to placement_news_index_url, notice: 'Placement news was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_placement_news
    @placement_news = PlacementNews.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def placement_news_params
    params.require(:placement_news).permit(:title, :content)
  end
end
