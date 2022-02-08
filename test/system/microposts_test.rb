require "application_system_test_case"

class MicropostsTest < ApplicationSystemTestCase
  setup do
    @micropost = create(:micropost)
  end

  test "visiting the index" do
    visit microposts_url
    assert_selector "textarea"
  end

  test "should create micropost" do
    visit microposts_url

    assert_difference("Micropost.count", 1) do
      within(".micropost-form") do
        fill_in "micropost[content]", with: @micropost.content
      end
      click_on "글쓰기"
    end

    assert_text "Micropost was successfully created"
  end

  test "should destroy Micropost" do
    visit microposts_url

    find(".micropost-action").click
    assert_difference("Micropost.count", -1) do
      click_on "글 삭제하기", match: :first
      sleep(0.1)
    end
  end
end
