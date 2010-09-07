require "spec_helper"

describe QuestsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quests" }.should route_to(:controller => "quests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quests/new" }.should route_to(:controller => "quests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quests/1" }.should route_to(:controller => "quests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quests/1/edit" }.should route_to(:controller => "quests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quests" }.should route_to(:controller => "quests", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quests/1" }.should route_to(:controller => "quests", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quests/1" }.should route_to(:controller => "quests", :action => "destroy", :id => "1")
    end

  end
end
