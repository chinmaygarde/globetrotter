class FriendshipsController < ApplicationController

  # POST /friendships
  # POST /friendships.xml
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to current_user, :notice => 'You have added a friend' }
        format.xml  { render :xml => @friendship, :status => :created, :location => @friendship }
      else
        format.html { redirect_to root_url }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.xml
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.xml  { head :ok }
    end
  end
end
