require "rails_helper"

RSpec.describe "Users conroller", :type => :request do

  it "does  render a users template" do
    get "/users"
    expect(response).to render_template(:index)
  end
  it "does  render a users template" do
    get "/users/:id"
    expect(response).to render_template(:show)
  end
end