require 'rails_helper'

RSpec.describe "root", :type => :feature do

  it "visits root_path and expects the word familie" do

    visit root_path

    expect(page).to have_content("Familie")
  end

end
