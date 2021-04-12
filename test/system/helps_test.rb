require "application_system_test_case"

class HelpsTest < ApplicationSystemTestCase
  setup do
    @help = helps(:one)
  end

  test "visiting the index" do
    visit helps_url
    assert_selector "h1", text: "Helps"
  end

  test "creating a Help" do
    visit helps_url
    click_on "New Help"

    fill_in "Email", with: @help.email
    fill_in "Message", with: @help.message
    fill_in "Name", with: @help.name
    click_on "Create Help"

    assert_text "Help was successfully created"
    click_on "Back"
  end

  test "updating a Help" do
    visit helps_url
    click_on "Edit", match: :first

    fill_in "Email", with: @help.email
    fill_in "Message", with: @help.message
    fill_in "Name", with: @help.name
    click_on "Update Help"

    assert_text "Help was successfully updated"
    click_on "Back"
  end

  test "destroying a Help" do
    visit helps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Help was successfully destroyed"
  end
end
