require 'rails_helper.rb'
require "shared.rb"

feature 'Mockup' do
      
  include_context "shared functions"  
  
  before do
    # do something
    @upvote_button = "#d_1_upvote"
    @downvote_button = "#d_1_downvote"
  end
  
  scenario "user visits home page" do
    visit root_path
    
    expect(page).to have_content("Should we close the bike shack?")
  end
  
  scenario "user clicks on decision" do
    visit root_path
    
    expect(page).not_to have_content("Discussion")
    
    click_link "d_1"
    
    expect(page).to have_content("Discussion")
  end
  
  scenario "user upvotes decision", :js => true do
    visit root_path
    
    expect(page).not_to have_content("You have upvoted decision 1")
    
    # click on upvote
    page.find(@upvote_button).click
    
    expect(page).to have_content("You have upvoted decision 1")
    expect(page.find(@upvote_button).has_css?("highlighted")).to be true
    expect(page.find(@downvote_button).has_css?("faded")).to be true
  end
  
  scenario "user downvotes decision", :js => true do
    visit root_path
    
    expect(page).not_to have_content("You have downvoted decision 1")
    
    # click on downvote
    page.find("#d_1_downvote").click
    
    # validate that downvote is active
    expect(page).to have_content("You have downvoted decision 1")
    expect(page.find(upvote_button).has_css?("faded")).to be true
    expect(page.find(downvote_button).has_css?("highlighted")).to be true
  end
  
  scenario "user changes vote on decision", :js => true do
    visit root_path
        
    # click on downvote
    page.find("#d_1_downvote").click
    
    # validate that downvote is active
    expect(page).to have_content("You have downvoted decision 1")
    expect(page.find(upvote_button).has_css?("faded")).to be true
    expect(page.find(downvote_button).has_css?("highlighted")).to be true
    
    # click on upvote
    page.find(upvote_button).click
    
    # validate that upvote is active and downvote is not
    expect(page).to have_content("You have upvoted decision 1")
    expect(page.find(upvote_button).has_css?("highlighted")).to be true
    expect(page.find(downvote_button).has_css?("faded")).to be true
  end
  
end