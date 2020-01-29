class RelationshipsController < ApplicationController

  before_action :set_user, except: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @relationships = Relationship.where(user_id:@user.id)
  end

  def edit
    @user = User.find(params[:id])
    @relationships = Relationship.where(follow_id:@user.id)

  end



  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end


end
