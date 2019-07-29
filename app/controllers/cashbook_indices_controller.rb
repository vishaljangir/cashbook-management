class CashbookIndicesController < ApplicationController
 

  before_action :set_cashbook_index, only: [:show, :edit, :update, :destroy]

  # GET /cashbook_indices
  # GET /cashbook_indices.json
  def index

    @cashbook_indices = current_user.cashbook_indices.all

  end


  # GET /cashbook_indices/1
  # GET /cashbook_indices/1.json
  def show
    @cashbook_index = current_user.cashbook_indices.find(params[:id])
    @credits = @cashbook_index.credits.all
    @debits = @cashbook_index.debits.all
    @closing_cashes = @cashbook_index.closing_cashes.all
    
  end

  # GET /cashbook_indices/new
  def new
    @cashbook_index = CashbookIndex.new
    
    15.times do 
      @cashbook_index.credits.new
      @cashbook_index.debits.new
    end
    10.times do
      # @cashbook_index.opening_cashes.new
      @cashbook_index.closing_cashes.new
    end
  end

  # GET /cashbook_indices/1/edit
  def edit
    15.times do 
      @cashbook_index.credits.new
      @cashbook_index.debits.new
    end
  end

  # POST /cashbook_indices
  # POST /cashbook_indices.json
  def create
    @cashbook_index = CashbookIndex.new(cashbook_index_params)
    @cashbook_index.user = current_user
    respond_to do |format|
      if @cashbook_index.save
        format.html { redirect_to @cashbook_index, notice: 'Cashbook index was successfully created.' }
        format.json { render :show, status: :created, location: @cashbook_index }
      else
        format.html { render :new }
        format.json { render json: @cashbook_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashbook_indices/1
  # PATCH/PUT /cashbook_indices/1.json
  def update
    respond_to do |format|
      if @cashbook_index.update(cashbook_index_params)
        format.html { redirect_to @cashbook_index, notice: 'Cashbook index was successfully updated.' }
        format.json { render :show, status: :ok, location: @cashbook_index }
      else
        format.html { render :edit }
        format.json { render json: @cashbook_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashbook_indices/1
  # DELETE /cashbook_indices/1.json
  def destroy
    @cashbook_index.destroy
    respond_to do |format|
      format.html { redirect_to cashbook_indices_url, notice: 'Cashbook index was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashbook_index
      @cashbook_index = CashbookIndex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cashbook_index_params
      params.require(:cashbook_index).permit(:id, :user_id, :cr_total, :dr_total, :cash_in_hand, :closing_total, :credits_attributes => [:id, :_destroy, :cashbook_index_id, :particular_name, :reference, :amount, :total], :debits_attributes => [:id, :_destroy, :cashbook_index_id, :particular_name, :reference, :amount, :total], :closing_cashes_attributes => [:id, :_destroy, :cashbook_index_id, :denomination, :quantity, :total] )
      # params.require(:cashbook_index).permit(:id, :cr_total, :dr_total, :cash_in_hand, :credits_attributes => [:id, :_destroy, :user_id, :cashbook_index_id, :particular_name, :reference, :amount, :total], :debits_attributes => [:id, :_destroy, :user_id, :cashbook_index_id, :particular_name, :reference, :amount, :total], :opening_cashes_attributes => [:id, :_destroy, :user_id, :cashbook_index_id, :denomination, :quantity, :total], :closing_cashes_attributes => [:id, :_destroy, :user_id, :cashbook_index_id, :denomination, :quantity, :total] )
    end

    
end
