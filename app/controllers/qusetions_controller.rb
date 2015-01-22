class QusetionsController < ApplicationController
  before_action :set_qusetion, only: [:show, :edit, :update, :destroy]

  # GET /qusetions
  # GET /qusetions.json
  def index
    @qusetions = Qusetion.all
  end

  # GET /qusetions/1
  # GET /qusetions/1.json
  def show
  end

  # GET /qusetions/new
  def new
    @qusetion = Qusetion.new
  end

  # GET /qusetions/1/edit
  def edit
  end

  # POST /qusetions
  # POST /qusetions.json
  def create
    @qusetion = Qusetion.new(qusetion_params)

    respond_to do |format|
      if @qusetion.save
        format.html { redirect_to @qusetion, notice: 'Qusetion was successfully created.' }
        format.json { render :show, status: :created, location: @qusetion }
      else
        format.html { render :new }
        format.json { render json: @qusetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qusetions/1
  # PATCH/PUT /qusetions/1.json
  def update
    respond_to do |format|
      if @qusetion.update(qusetion_params)
        format.html { redirect_to @qusetion, notice: 'Qusetion was successfully updated.' }
        format.json { render :show, status: :ok, location: @qusetion }
      else
        format.html { render :edit }
        format.json { render json: @qusetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qusetions/1
  # DELETE /qusetions/1.json
  def destroy
    @qusetion.destroy
    respond_to do |format|
      format.html { redirect_to qusetions_url, notice: 'Qusetion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_qusetion
    @qusetion = Qusetion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def qusetion_params
    params.require(:qusetion).permit(:question, :question_type_id, :question_count)
  end
end
