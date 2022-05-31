require "application_system_test_case"

class ForumPostsTest < ApplicationSystemTestCase
  setup do
    @forum_post = forum_posts(:one)
  end

  test "visiting the index" do
    visit forum_posts_url
    assert_selector "h1", text: "Forum Posts"
  end

  test "creating a Forum post" do
    visit forum_posts_url
    click_on "New Forum Post"

    fill_in "Body", with: @forum_post.body
    fill_in "Forum thread", with: @forum_post.forum_thread_id
    fill_in "User", with: @forum_post.user_id
    click_on "Create Forum post"

    assert_text "Forum post was successfully created"
    click_on "Back"
  end

  test "updating a Forum post" do
    visit forum_posts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @forum_post.body
    fill_in "Forum thread", with: @forum_post.forum_thread_id
    fill_in "User", with: @forum_post.user_id
    click_on "Update Forum post"

    assert_text "Forum post was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum post" do
    visit forum_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum post was successfully destroyed"
  end
end
