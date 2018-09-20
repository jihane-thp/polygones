require "application_system_test_case"

class TabsTest < ApplicationSystemTestCase
  setup do
    @tab = tabs(:one)
  end

  test "visiting the index" do
    visit tabs_url
    assert_selector "h1", text: "Tabs"
  end

  test "creating a Tab" do
    visit tabs_url
    click_on "New Tab"

    fill_in "Menu", with: @tab.menu_id
    fill_in "Order", with: @tab.order
    fill_in "Title", with: @tab.title
    click_on "Create Tab"

    assert_text "Tab was successfully created"
    click_on "Back"
  end

  test "updating a Tab" do
    visit tabs_url
    click_on "Edit", match: :first

    fill_in "Menu", with: @tab.menu_id
    fill_in "Order", with: @tab.order
    fill_in "Title", with: @tab.title
    click_on "Update Tab"

    assert_text "Tab was successfully updated"
    click_on "Back"
  end

  test "destroying a Tab" do
    visit tabs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tab was successfully destroyed"
  end
end
