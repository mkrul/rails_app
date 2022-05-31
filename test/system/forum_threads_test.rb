require "application_system_test_case"

class ForumThreadsTest < ApplicationSystemTestCase
  setup do
    @forum_thread = forum_threads(:one)
  end

  test "visiting the index" do
    visit forum_threads_url
    assert_selector "h1", text: "Forum Threads"
  end

  test "creating a Forum thread" do
    visit forum_threads_url
    click_on "New Forum Thread"

    fill_in "Subject", with: @forum_thread.subject
    fill_in "User", with: @forum_thread.user_id
    click_on "Create Forum thread"

    assert_text "Forum thread was successfully created"
    click_on "Back"
  end

  test "updating a Forum thread" do
    visit forum_threads_url
    click_on "Edit", match: :first

    fill_in "Subject", with: @forum_thread.subject
    fill_in "User", with: @forum_thread.user_id
    click_on "Update Forum thread"

    assert_text "Forum thread was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum thread" do
    visit forum_threads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum thread was successfully destroyed"
  end
end
