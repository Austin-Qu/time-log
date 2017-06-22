require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    FactoryGirl.create(:post, user_id: user.id)
  end

  before do
    user
    post
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      # build_stubbed to avoid hitting database, create to see real page effect
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/first|more/)
    end

    it 'has a scope so that only post creators can see their posts' do
      post_from_another_user = FactoryGirl.create(:post_from_another_user)
      visit posts_path
      expect(page).to_not have_content(/other/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post_delete = FactoryGirl.create(:post, user: user)
      visit posts_path

      click_link("delete_post_#{post_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new post page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Assocaiation"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Assocaiation")
    end
  end

  describe 'edit' do
    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link "edit_#{post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edit content"
      click_on "Save"

      expect(page).to have_content("Edit content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      @non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(@non_authorized_user, :scope => :user)

      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end
end
