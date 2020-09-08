class UserManagementsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/new
  def new
    @user_management = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/1/edit
  def edit
    @user_management = User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /users
  # POST /users.json
  def create
    byebug
    @user_management = User.new(user_params)
    respond_to do |format|
      if @user_management.save
        format.html { redirect_to user_management_url(@user_management), notice: 'User was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user_management.update(user_params)
        format.html { redirect_to @user_management, notice: 'User was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user_management.destroy
    respond_to do |format|
      format.html { redirect_to user_managements_url, notice: 'User was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user_management = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :mobile, :image)
    end
end
