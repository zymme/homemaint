require 'test_helper'

class HomeitemsControllerTest < ActionController::TestCase
  setup do
    @homeitem = homeitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homeitem" do
    assert_difference('Homeitem.count') do
      post :create, homeitem: { desc: @homeitem.desc, name: @homeitem.name, stagetime: @homeitem.stagetime, status: @homeitem.status, userid: @homeitem.userid }
    end

    assert_redirected_to homeitem_path(assigns(:homeitem))
  end

  test "should show homeitem" do
    get :show, id: @homeitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homeitem
    assert_response :success
  end

  test "should update homeitem" do
    patch :update, id: @homeitem, homeitem: { desc: @homeitem.desc, name: @homeitem.name, stagetime: @homeitem.stagetime, status: @homeitem.status, userid: @homeitem.userid }
    assert_redirected_to homeitem_path(assigns(:homeitem))
  end

  test "should destroy homeitem" do
    assert_difference('Homeitem.count', -1) do
      delete :destroy, id: @homeitem
    end

    assert_redirected_to homeitems_path
  end
end
