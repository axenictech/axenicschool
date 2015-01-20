class QusetionTypesController < ApplicationController
  before_action :set_qusetion_type, only: [:show, :edit, :update, :destroy]

  # GET /qusetion_types
  # GET /qusetion_types.json
  def index
    @qusetion_types = QusetionType.all
  end

  # GET /qusetion_types/1
  # GET /qusetion_types/1.json
  def show
  end

  # GET /qusetion_types/new
  def new
    @qusetion_type = QusetionType.new
  end

  # GET /qusetion_types/1/edit
  def edit
  end

  # POST /qusetion_types
  # POST /qusetion_types.json
  def create
    @qusetion_type = QusetionType.new(qusetion_type_params)

    respond_to do |format|
      if @qusetion_type.save
        format.html { redirect_to @qusetion_type, notice: 'Qusetion type was successfully created.' }
        format.json { render :show, status: :created, location: @qusetion_type }
      else
        format.html { render :new }
        format.json { render json: @qusetion_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qusetion_types/1
  # PATCH/PUT /qusetion_types/1.json
  def update
    respond_to do |format|
      if @qusetion_type.update(qusetion_type_params)
        format.html { redirect_to @qusetion_type, notice: 'Qusetion type was successfully updated.' }
        format.json { render :show, status: :ok, location: @qusetion_type }
      else
        format.html { render :edit }
        format.json { render json: @qusetion_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qusetion_types/1
  # DELETE /qusetion_types/1.json
  def destroy
    @qusetion_type.destroy
    respond_to do |format|
      format.html { redirect_to qusetion_types_url, notice: 'Qusetion type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qusetion_type
      @qusetion_type = QusetionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qusetion_type_params
      params.require(:qusetion_type).permit(:type)
    end
end
