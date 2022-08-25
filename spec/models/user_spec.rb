require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(name: 'ilham', photo: 'www.pp.com', bio: 'student from Morocco')}

  before {subject.save}


  it 'name should be present' do
    subject.name = nil 
    expect(subject).to_not be_valid
  end

  it 'postCounter must be integer greater than or equal zero' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'postCounter must be integer greater than or equal zero' do
    subject.postsCounter = 0
    expect(subject).to be_valid
  end
end