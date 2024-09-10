require "test_helper"

class MutationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mutation = mutations(:one)
  end

  test "should get index" do
    get mutations_url, as: :json
    assert_response :success
  end

  test "should create mutation" do
    assert_difference("Mutation.count") do
      post mutations_url, params: { mutation: { name: @mutation.name } }, as: :json
    end

    assert_response :created
  end

  test "should show mutation" do
    get mutation_url(@mutation), as: :json
    assert_response :success
  end

  test "should update mutation" do
    patch mutation_url(@mutation), params: { mutation: { name: @mutation.name } }, as: :json
    assert_response :success
  end

  test "should destroy mutation" do
    assert_difference("Mutation.count", -1) do
      delete mutation_url(@mutation), as: :json
    end

    assert_response :no_content
  end
end
