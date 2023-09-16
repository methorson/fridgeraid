require "test_helper"

class FridgeListIngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fridge_list_ingredients_create_url
    assert_response :success
  end
end
