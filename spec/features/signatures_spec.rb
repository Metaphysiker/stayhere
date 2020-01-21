require 'rails_helper'

RSpec.describe "signatures", :type => :feature do

  it "visits root path and expect an open letter" do

    visit root_path

    expect(page).to have_content("Familie")
  end

end
