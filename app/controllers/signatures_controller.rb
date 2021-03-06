class SignaturesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, except: [:add_signature, :signatures, :index, :pin_board]
  before_action except: [:add_signature, :signatures, :index, :pin_board] do
    allow_if_user_has_role("admin")
  end

  before_action :set_signature, only: [:show, :edit, :update, :destroy]

  # GET /signatures
  # GET /signatures.json
  def index
    @signatures = Signature.all
  end

  def emails

  end

  # GET /signatures/1
  # GET /signatures/1.json
  def show
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures
  # POST /signatures.json
  def create
    @signature = Signature.new(signature_params)

    respond_to do |format|
      if @signature.save
        format.html { redirect_to @signature, notice: 'Signature was successfully created.' }
        format.json { render :show, status: :created, location: @signature }
      else
        format.html { render :new }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signatures/1
  # PATCH/PUT /signatures/1.json
  def update
    respond_to do |format|
      if @signature.update(signature_params)
        format.html { redirect_to @signature, notice: 'Signature was successfully updated.' }
        format.json { render :show, status: :ok, location: @signature }
      else
        format.html { render :edit }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatures/1
  # DELETE /signatures/1.json
  def destroy
    @signature.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Signature was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def add_signature
    @signature = Signature.new(signature_params)
    respond_to do |format|
      if @signature.save
        format.js
      else
        format.js
      end
    end
  end

  def pin_board

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_params
      params.require(:signature).permit(:firstname, :lastname, :email, :i_want_to_be_kept_up_to_date, :comment, :picture)
    end
end
