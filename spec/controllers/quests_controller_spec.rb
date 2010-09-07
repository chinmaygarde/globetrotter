require 'spec_helper'

describe QuestsController do

  def mock_quest(stubs={})
    @mock_quest ||= mock_model(Quest, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all quests as @quests" do
      Quest.stub(:all) { [mock_quest] }
      get :index
      assigns(:quests).should eq([mock_quest])
    end
  end

  describe "GET show" do
    it "assigns the requested quest as @quest" do
      Quest.stub(:find).with("37") { mock_quest }
      get :show, :id => "37"
      assigns(:quest).should be(mock_quest)
    end
  end

  describe "GET new" do
    it "assigns a new quest as @quest" do
      Quest.stub(:new) { mock_quest }
      get :new
      assigns(:quest).should be(mock_quest)
    end
  end

  describe "GET edit" do
    it "assigns the requested quest as @quest" do
      Quest.stub(:find).with("37") { mock_quest }
      get :edit, :id => "37"
      assigns(:quest).should be(mock_quest)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created quest as @quest" do
        Quest.stub(:new).with({'these' => 'params'}) { mock_quest(:save => true) }
        post :create, :quest => {'these' => 'params'}
        assigns(:quest).should be(mock_quest)
      end

      it "redirects to the created quest" do
        Quest.stub(:new) { mock_quest(:save => true) }
        post :create, :quest => {}
        response.should redirect_to(quest_url(mock_quest))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quest as @quest" do
        Quest.stub(:new).with({'these' => 'params'}) { mock_quest(:save => false) }
        post :create, :quest => {'these' => 'params'}
        assigns(:quest).should be(mock_quest)
      end

      it "re-renders the 'new' template" do
        Quest.stub(:new) { mock_quest(:save => false) }
        post :create, :quest => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested quest" do
        Quest.should_receive(:find).with("37") { mock_quest }
        mock_quest.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :quest => {'these' => 'params'}
      end

      it "assigns the requested quest as @quest" do
        Quest.stub(:find) { mock_quest(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:quest).should be(mock_quest)
      end

      it "redirects to the quest" do
        Quest.stub(:find) { mock_quest(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(quest_url(mock_quest))
      end
    end

    describe "with invalid params" do
      it "assigns the quest as @quest" do
        Quest.stub(:find) { mock_quest(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:quest).should be(mock_quest)
      end

      it "re-renders the 'edit' template" do
        Quest.stub(:find) { mock_quest(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested quest" do
      Quest.should_receive(:find).with("37") { mock_quest }
      mock_quest.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the quests list" do
      Quest.stub(:find) { mock_quest }
      delete :destroy, :id => "1"
      response.should redirect_to(quests_url)
    end
  end

end
