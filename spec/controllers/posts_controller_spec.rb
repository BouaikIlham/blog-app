require 'rails_helper'

RSpec.describe 'Posts conroller', type: :request do
  it 'should render a correct template' do
    get '/users/:user_id/posts'
    expect(response).to render_template(:index)
  end
  it 'return correct response' do
    get '/users/:user_id/posts'
    expect(response).to have_http_status(:ok)
  end

  it 'body should includes correct placeholder text' do
    get '/users/:user_id/posts'
    expect(response.body).to include('Here is a list of posts for a given user')
  end

  it 'should render a correct template' do
    get '/users/:user_id/posts/:id'
    expect(response).to render_template(:show)
  end
  it 'return correct response' do
    get '/users/:user_id/posts/:id'
    expect(response).to have_http_status(:ok)
  end
  it 'body should includes correct placeholder text' do
    get '/users/:user_id/posts/:id'
    expect(response.body).to include('Post content for a given user')
  end
end
