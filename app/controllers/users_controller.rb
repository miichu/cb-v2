class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #wrap_parameters :user, include: [:name, :email, :password, :password_confirmation]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  #POST /users
  #POST /users.json
  def create
    @user = User.new(user_params) #params[:user])#user_params)
    
    
    #respond_to do |format|
    if @user.save
      flash[:success] = "Welcome to CourseBuddies!"
      redirect_to @user
      
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated."
      redirect_to @user
      #format.html { redirect_to @user, notice: 'User was successfully updated.' }
      #format.json { render :show, status: :ok, location: @user }
    else
      render 'edit'
      #format.html { render :edit }
      #format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :pasword, :password_confirmation)
    end
end
