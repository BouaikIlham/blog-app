require "rails_helper"

RSpec.describe "Posts conroller", :type => :request do

  it "does  render a posts template" do
    get "/users/:user_id/posts"
    expect(response).to render_template(:index)
  end
  it "does  render a posts template" do
    get "/users/:user_id/posts/:id"
    expect(response).to render_template(:show)
  end
end