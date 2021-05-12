class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @dishes = @user.dishes.paginate(page: params[:page], per_page: 5)
    @log = Log.new
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.find(params[:id])
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Make every day happy with cookingへようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_update)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to @user
    else
      render 'edit'
    end
  end
end