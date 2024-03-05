require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a first_name, last_name, password and confirmation password' do
    user = build(:user, password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end
  
  it 'is not valid without a email' do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a first_name' do
    user = build(:user, first_name: nil)
    expect(user).not_to be_valid
  end
  
  it 'is not valid without a last_name' do
    user = build(:user, last_name: nil)
    expect(user).not_to be_valid
  end

  it 'hashes the password using BCrypt' do
    user = create(:user, password: 'password')

    expect(user.password_digest).not_to eq 'password'

    expect(BCrypt::Password.new(user.password_digest)).to be_truthy

    expect(BCrypt::Password.new(user.password_digest).is_password?('password')).to be true
  end
end 

context 'Uniqueness tests' do
  it 'is not valid without a unique user name' do
    user1 = create(:user)
    user2 = build(:user, user_name: user1.user_name)

    expect(user2).not_to be_valid
    expect(user2.errors[:user_name]).to include("has already been taken")
  end

  it 'is not valid without a unique email' do
    user1 = create(:user)
    user2 = build(:user, email: user1.email)

    expect(user2).not_to be_valid
    expect(user2.errors[:email]).to include("has already been taken")
    end
  end

context 'destroy user and everything dependent on it' do
  let (:user) {create(:user)}
  let (:user) {user.id}

  before do
    user.destroy
  end

  # deletes user profile
  it 'deletes profile' do
    profile = Profile.find_by(user_id: user_id)
    expect(profile).to be_nil
  end

  # deletes user posts
  it 'deletes posts' do
    posts = Post.where(user_id: user_id)
    expect(posts).to be_empty
  end

  # deletes user comments
  it 'deletes comments' do
    comments = Comment.where(user_id: user_id)
    expect(comments).to be_empty
  end

end