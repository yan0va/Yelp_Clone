require 'spec_helper'

describe "the restaurants index page" do
  
  context "no restaurants have been added" do

    it "should dispay a warning message" do
      visit '/restaurants'
      expect(page).to have_content("No restaurants added")
    end

    context "adding a restaurant" do

      it "should be listed on the index" do
        visit '/restaurants'
        click_link "Add a restaurant"
        fill_in "Name", with: "Ozone Coffee"
        fill_in "Category", with: "Breakfast & Brunch"
        fill_in "Location", with: "Shoreditch, East London"
        click_button "Create Restaurant"

        expect(current_path).to eq '/restaurants'
        expect(page).to have_content("Ozone Coffee")
      end

    end

  end

  context "with existing restaurants" do

    before do
      Restaurant.create({:name => "Ozone Coffee"})
    end

    context "editing a restaurant" do

      it "should update the restaurant details" do
        visit '/restaurants'
        click_link "Edit"
        fill_in "Name", with: "Coffee House"
        click_button "Update Restaurant"

        expect(page).to have_content("Coffee House")
      end

    end

  end

end




