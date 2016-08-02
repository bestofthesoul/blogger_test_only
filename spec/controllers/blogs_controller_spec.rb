require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  let(:user) { create(:user) }

  before do
      allow(controller).to receive(:current_user).and_return(user)
    end

  describe "#new" do
    it "sets blog instance variable" do
      get :new
      expect(assigns[:blog]).to be_a Blog
    end
  end

  describe "#create" do

    context "when valid params" do
      let(:params) {
        {
          blog: {
            title: "Day 1",
            content: "Feeling Good Today"
          }
        }
      }
      let(:blog_mock) { double(Blog) }

      it "saves blog under logged in user and redirect to blogs page" do
        expect(Blog).to receive(:new).with(params[:blog].merge(user_id: user.id)) { blog_mock }
        expect(blog_mock).to receive(:save) { true }

        post :create, params

        expect(response).to redirect_to(blogs_path)
      end
    end
  end

  describe "#index" do
    let(:user_mock) { double(User) }
    let(:blog) { build(:blog) }

    before do
      allow(controller).to receive(:current_user).and_return(user_mock)
    end

    it "sets blogs instance variable" do
      expect(user_mock).to receive(:blogs) { [blog] }

      get :index

      expect(assigns[:blogs]).to eq([blog])
    end
  end

end