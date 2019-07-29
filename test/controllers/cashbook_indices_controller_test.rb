require 'test_helper'

class CashbookIndicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cashbook_index = cashbook_indices(:one)
  end

  test "should get index" do
    get cashbook_indices_url
    assert_response :success
  end

  test "should get new" do
    get new_cashbook_index_url
    assert_response :success
  end

  test "should create cashbook_index" do
    assert_difference('CashbookIndex.count') do
      post cashbook_indices_url, params: { cashbook_index: { cash_in_hand: @cashbook_index.cash_in_hand, closing_total: @cashbook_index.closing_total, cr_total: @cashbook_index.cr_total, dr_total: @cashbook_index.dr_total } }
    end

    assert_redirected_to cashbook_index_url(CashbookIndex.last)
  end

  test "should show cashbook_index" do
    get cashbook_index_url(@cashbook_index)
    assert_response :success
  end

  test "should get edit" do
    get edit_cashbook_index_url(@cashbook_index)
    assert_response :success
  end

  test "should update cashbook_index" do
    patch cashbook_index_url(@cashbook_index), params: { cashbook_index: { cash_in_hand: @cashbook_index.cash_in_hand, closing_total: @cashbook_index.closing_total, cr_total: @cashbook_index.cr_total, dr_total: @cashbook_index.dr_total } }
    assert_redirected_to cashbook_index_url(@cashbook_index)
  end

  test "should destroy cashbook_index" do
    assert_difference('CashbookIndex.count', -1) do
      delete cashbook_index_url(@cashbook_index)
    end

    assert_redirected_to cashbook_indices_url
  end
end
