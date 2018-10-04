require 'rails_helper'

describe 'Project' do
    before do
      @user1 = User.create(username: "isabelle", password: "password1", password_confirmation: "password1")
      @user2 = User.create(username: "brian", password: "password2", password_confirmation: "password2")
      @user3 = User.create(username: "bruno", password: "password3", password_confirmation: "password3")
      @category1 = Category.create(name: "Film")
      @project = Project.create(title: "Basketball", description: "A never-before-seen sports endeavor where one must place a leather bouncy ball into a 11-foot basket. Whichever team of 5 players scores more wins", funds_needed: 1000, creator: @user1, category: @category1)
      @project_backing1 = ProjectBacking.create(project_backer: @user2, backed_project: @project)
      @project_backing2 = ProjectBacking.create(project_backer: @user3, backed_project: @project)
    end

    it 'has many project_backings' do
      expect(@project.project_backings).to eq([@project_backing1, @project_backing2])
    end

    it 'has many backers, through project_backings' do
      expect(@project.backers).to eq([@user2, @user3])
    end

    it 'belongs to a creator' do
      expect(@project.creator).to eq(@user1)
    end

  end
