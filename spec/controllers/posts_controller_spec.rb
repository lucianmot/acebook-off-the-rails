require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end
  
end
