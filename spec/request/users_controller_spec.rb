require 'rails_helper'

RSpec.describe 'Users conroller', type: :request do
  it 'should render a correct template' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'return correct response' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end

  it 'body should includes correct placeholder text' do
    get '/users'
    expect(response.body).to include('Here is a list of users')
  end

  it 'should render a correct template' do
    get '/users/:id'
    expect(response).to render_template(:show)
  end
  it 'return correct response' do
    get '/users/:id'
    expect(response).to have_http_status(:ok)
  end
  it 'body should includes correct placeholder text' do
    get '/users/:id'
    expect(response.body).to include('Here is information about a given user')
  end
end
