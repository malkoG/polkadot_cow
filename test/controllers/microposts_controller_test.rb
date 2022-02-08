require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = create(:micropost)
  end

  test "should get index" do
    get microposts_url
    assert_response :success
  end

  test "should create micropost" do
    assert_difference("Micropost.count") do
      post microposts_url, params: { micropost: { content: @micropost.content, username: @micropost.username } }
    end
  end

  test "should destroy micropost" do
    assert_difference("Micropost.count", -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
