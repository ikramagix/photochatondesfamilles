require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "visiting the index" do
    visit carts_url
    assert_selector "h1", text: "Carts"
  end

  test "should create cart" do
    visit carts_url
    click_on "New cart"

    fill_in "Total price", with: @cart.total_price
    fill_in "User", with: @cart.user_id
    click_on "Create Cart"

    assert_text "Cart was successfully created"
    click_on "Back"
  end

  test "should update Cart" do
    visit cart_url(@cart)
    click_on "Edit this cart", match: :first

    fill_in "Total price", with: @cart.total_price
    fill_in "User", with: @cart.user_id
    click_on "Update Cart"

    assert_text "Cart was successfully updated"
    click_on "Back"
  end

  test "should destroy Cart" do
    visit cart_url(@cart)
    click_on "Destroy this cart", match: :first

    assert_text "Cart was successfully destroyed"
  end
end
