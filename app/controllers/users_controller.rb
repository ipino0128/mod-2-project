class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def notes
    @user = User.find(params[:id])
  end

  def notes_save
    @user = User.find(params[:id])
    @user.update(note_content: params[:user][:note_content])
    redirect_to note_path(@user)
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email, :age, :gender, :country, :occupation, :note_content)
  end

end
