require "test_helper"

class FridgeListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fridge_list_index_url
    assert_response :success
  end

  test "should get new" do
    get fridge_list_new_url
    assert_response :success
  end

  test "should get edit" do
    get fridge_list_edit_url
    assert_response :success
  end
end
