class RelationshipsController < ApplicationController
    
    
  def create
    user = User.find(params[:user_id])
    relationship = Relationship.new(follower_id: current_user.id , followed_id: user.id)
    relationship.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    relationships=Relationship.all
    relationship = relationships.find_by(follower_id: current_user.id ,followed_id: user.id)
    relationship.destroy
    redirect_back(fallback_location: root_path)
  end
  
def followers
  @user = User.find(params[:id])
  @users=@user.followers
end

def followings
  @user = User.find(params[:id])
  @users=@user.followings
end


  
end
    
