require "application_system_test_case"

class NotebooksTest < ApplicationSystemTestCase
  setup do
    @notebook = notebooks(:one)
  end

  test "visiting the index" do
    visit notebooks_url
    assert_selector "h1", text: "Notebooks"
  end

  test "creating a Notebook" do
    visit notebooks_url
    click_on "New Notebook"

    fill_in "Title", with: @notebook.title
    fill_in "User", with: @notebook.user_id
    click_on "Create Notebook"

    assert_text "Notebook was successfully created"
    click_on "Back"
  end

  test "updating a Notebook" do
    visit notebooks_url
    click_on "Edit", match: :first

    fill_in "Title", with: @notebook.title
    fill_in "User", with: @notebook.user_id
    click_on "Update Notebook"

    assert_text "Notebook was successfully updated"
    click_on "Back"
  end

  test "destroying a Notebook" do
    visit notebooks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notebook was successfully destroyed"
  end
end
