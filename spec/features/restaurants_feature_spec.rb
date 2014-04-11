require 'spec_helper'

describe "the restaurants index page" do
  
  context "no restaurants have been added" do

    it "should dispay a warning message" do
      visit '/restaurants'
      expect(page).to have_content("No restaurants added")
    end

  end

end