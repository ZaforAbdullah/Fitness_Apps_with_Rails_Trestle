require "test_helper"

class NutritionLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nutrition_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get nutrition_logs_create_url
    assert_response :success
  end

  test "should get index" do
    get nutrition_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get nutrition_logs_show_url
    assert_response :success
  end

  test "should get edit" do
    get nutrition_logs_edit_url
    assert_response :success
  end

  test "should get update" do
    get nutrition_logs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get nutrition_logs_destroy_url
    assert_response :success
  end
end
