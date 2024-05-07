require "test_helper"

class BagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bags_index_url
    assert_response :success
  end

  test "should get show" do
    get bags_show_url
    assert_response :success
  end

  test "should get new" do
    get bags_new_url
    assert_response :success
  end

  test "should get create" do
    get bags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bags_destroy_url
    assert_response :success
  end
end
