class QuestMembershipsController < ApplicationController
  before_filter :authorize
  def create
    current_user.quests_as_member << Quest.find(params[:quest_id])
    redirect_to user_quest_path(current_user, params[:quest_id])
  end
  def destroy
    current_user.quests_as_member.find(params[:quest_id]).destroy
    redirect_to user_quests_path(current_user)
  end
end