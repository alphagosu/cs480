require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have content 'Research Collaboration Tool'" do
      visit '/static_pages/home'
      expect(page).to have_content('Research Collaboration Tool')
    end
  end
end
