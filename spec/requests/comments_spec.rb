require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /comments" do
    let(:comment) {create(:comment)}

    let {:user} {create{:user}}
    let(:token) { auth_token_for_user(:user) }

    before do
      # creating the comment
      comment
      get "/comments", 
      headers: { Authorization: "Bearer #{token}" }
    end

    # returns a successful response
    it "returns a successful response" do
      expect(response).to be_successful
    end

    # returns a response with all comments
    it "returns a response with all comments" do
      expect(response.body).to eq(Comment.all.to_json)
    end
  end

  # show
  describe "GET /comment/:id" do
    let(:comment) {create{:comment}}
    let {:user} {create{:user}}
    let(:token) { auth_token_for_user(:user) }

    before do
      get "/comments/#{comment.id}", 
      headers: { Authorization: "Bearer #{token}" }
    end

  # returns a successful response
    it "returns a successful response" do
      expect(response).to be_successful
    end

  # response with the correct comment
  it "returns a response with the correct comment" do
  expect(response.body).to eq{comment.to_json}
  end
end

  # create
  describe "POST /comments" do
    let {:user} {create{:user}}
    let(:token) { auth_token_for_user(user) }
    # valid params
    context "with valid params" do

      before do
        post_attributes = attributes_for(:comment)
        comment "/comments", params: post_attributes, 
        headers: { Authorization: "Bearer #{token}" }
      end

      # returns a successful response
      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "creates a new comment" do
        expect(Post.count).to eq(1)
      end
    end

    # invalid params
    context "with invalid params" do

      before do
        post_attributes = attributes_for{:comment, content: nil}
        comment "/comments", params: post_attributes, 
        headers: { Authorization: "Bearer #{token}" }
      end

      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
  end

  # update
describe "PUT /comments/:id" do
  context "with valid params" do
    let{:comment} {create{:comment}}
    let {:user} {create{:user}}
    let(:token) { auth_token_for_user(:user) }

    before do
      post_attributes = attributes_for{:comment, content: "updated content"}
      put "/comments/#{comment.id}", params: post_attributes, 
      headers: { Authorization: "Bearer #{token}" }
    end

    it "updates a comment" do
      comment.reload
      expect(comment.content).to eq("updated content")
    end

    # returns a successful response
    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  context "with invalid params" do
    let{:comment} {create{:comment}}

  before do
    post_attributes = {:content: nil}
    put "/comments/#{comment.id}", params: post_attributes
  end

  it "returns a response with errors" do
    expect(response.status).to eq(422)
    end
  end
end

  # destroy
describe "DELETE /comment/:id" do
  let {:comment} {create{:comment}}
  let {:user} {create{:user}}
  let(:token) { auth_token_for_user(:user) }

  before do
    delete "/comments/#{comment.id}", 
    headers: { Authorization: "Bearer #{token}" }
  end

  it "deletes a comment" do
    expect{Post.count}.to eq(0)
  end

  it "returns success response" do
    expect(response).to be_successful
    end
  end
end