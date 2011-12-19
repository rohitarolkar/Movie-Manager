require 'test_helper'

class MovieDetailsControllerTest < ActionController::TestCase
  setup do
    @movie_detail = movie_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_detail" do
    assert_difference('MovieDetail.count') do
      post :create, movie_detail: @movie_detail.attributes
    end

    assert_redirected_to movie_detail_path(assigns(:movie_detail))
  end

  test "should show movie_detail" do
    get :show, id: @movie_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_detail.to_param
    assert_response :success
  end

  test "should update movie_detail" do
    put :update, id: @movie_detail.to_param, movie_detail: @movie_detail.attributes
    assert_redirected_to movie_detail_path(assigns(:movie_detail))
  end

  test "should destroy movie_detail" do
    assert_difference('MovieDetail.count', -1) do
      delete :destroy, id: @movie_detail.to_param
    end

    assert_redirected_to movie_details_path
  end
end
