require "application_system_test_case"

class CashbookIndicesTest < ApplicationSystemTestCase
  setup do
    @cashbook_index = cashbook_indices(:one)
  end

  test "visiting the index" do
    visit cashbook_indices_url
    assert_selector "h1", text: "Cashbook Indices"
  end

  test "creating a Cashbook index" do
    visit cashbook_indices_url
    click_on "New Cashbook Index"

    fill_in "Cash in hand", with: @cashbook_index.cash_in_hand
    fill_in "Closing total", with: @cashbook_index.closing_total
    fill_in "Cr total", with: @cashbook_index.cr_total
    fill_in "Dr total", with: @cashbook_index.dr_total
    click_on "Create Cashbook index"

    assert_text "Cashbook index was successfully created"
    click_on "Back"
  end

  test "updating a Cashbook index" do
    visit cashbook_indices_url
    click_on "Edit", match: :first

    fill_in "Cash in hand", with: @cashbook_index.cash_in_hand
    fill_in "Closing total", with: @cashbook_index.closing_total
    fill_in "Cr total", with: @cashbook_index.cr_total
    fill_in "Dr total", with: @cashbook_index.dr_total
    click_on "Update Cashbook index"

    assert_text "Cashbook index was successfully updated"
    click_on "Back"
  end

  test "destroying a Cashbook index" do
    visit cashbook_indices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cashbook index was successfully destroyed"
  end
end
