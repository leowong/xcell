require File.dirname(__FILE__) + '/../spec_helper'
 
describe SessionsController do
  fixtures :all
  integrate_views
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Session.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Session.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(root_url)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    session = Session.first
    delete :destroy, :id => session
    response.should redirect_to(root_url)
    Session.exists?(session.id).should be_false
  end
end
