require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      first_name: "Bruno",
      last_name: "Gonzalez",
      username: "bruno",
      email: "brunogonzalez@flatironschool.com",
      age: 24,
      gender: "male",
      country: "USA",
      occupation: "TCF",
      password: "password3",
      password_confirmation: "password3"
    }
  end

  let(:invalid_attributes) do
    {
      first_name: nil,
      last_name: nil,
      username: nil,
      email: nil,
      age: nil,
      gender: nil,
      country: nil,
      occupation: nil,
      password: nil,
      password_confirmation: nil
    }
  end

  describe "view and edit a user - " do
    let(:user) { User.create!(valid_attributes) }

    it "views a single user" do
      get :show, params:{ id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "fetches a user for editing" do
      get :edit, params:{ id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  context "creating a valid user" do
    before { post(:create, params:{ user: valid_attributes }) }

    it "creates a new User" do
      expect(User.count).to eq(1)
    end

    it "assigns and persists new user" do
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_persisted
    end

  end

  context "creating an invalid user" do
    before { post(:create, params:{ user: invalid_attributes}) }

    it "has not been persisted" do
      expect(assigns(:user)).to be_new_record
    end

    it "re-renders the template" do
      expect(response).to render_template("new")
    end
  end

  context "updating a user with invalid data - " do
    let(:user) { User.create!(valid_attributes) }
    before do
      patch :update, params:{ id: user.id, user: invalid_attributes }
    end

    it "does not persist changes" do
      expect(user.first_name).to eq("Bruno")
    end

    it "re-renders the 'edit' template" do
      expect(response).to render_template("edit")
    end
  end

end
