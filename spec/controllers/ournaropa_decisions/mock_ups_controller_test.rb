require 'test_helper'

module OurnaropaDecisions
  class MockUpsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get decision_1" do
      get :decision_1
      assert_response :success
    end

    test "should get decision_2" do
      get :decision_2
      assert_response :success
    end

    test "should get decision_3" do
      get :decision_3
      assert_response :success
    end

  end
end
