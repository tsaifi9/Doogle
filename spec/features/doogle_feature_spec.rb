require "spec_helper"

feature "Doogle", js: true do
  context "word search" do
    scenario "word can be searched" do
      visit root_path
      expect(page).to have_content("Doogle")

      fill_in "word", with: "Test"
      click_button "Doogle Search"

      expect(page).to have_content("stubbed definition")
    end
  end
end