require 'rails_helper'

RSpec.describe "signatures", :type => :feature do

  it "visits root path and expect a link to an open letter" do

    visit root_path

    expect(page).to have_content("Offener Brief")
  end


  it "visits open letter, expects a field for signing and tries to sign" do

    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name

    visit open_letter_path

    expect(page).to have_content("Unterschreiben")

    click_button 'Unterschreiben'

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Unterschrift wurde eingereicht!")
    expect(page).to have_content(firstname + " " + lastname)
  end

  it "visits open letter, expects a field for signing and tries to sign with email" do

    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name

    visit open_letter_path

    expect(page).to have_content("Unterschreiben")

    click_button 'Unterschreiben'

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname

    check 'i_want_to_be_kept_up_to_date'
    expect(page).to have_content("e-Mail")

    fill_in 'e-Mail', with: Faker::Internet.email

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Unterschrift wurde eingereicht!")
    expect(page).to have_content(firstname + " " + lastname)

  end

  it "visits open letter, expects a field for signing and tries to sign with email, picture and comment" do

    comment = Faker::Lorem.paragraph
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name

    visit open_letter_path

    expect(page).to have_content("Unterschreiben")

    click_button 'Unterschreiben'

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname

    check 'i_want_to_be_kept_up_to_date'
    expect(page).to have_content("e-Mail")

    fill_in 'e-Mail', with: Faker::Internet.email

    fill_in 'Kommentar', with: comment

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Unterschrift wurde eingereicht!")
    expect(page).to have_content(firstname + " " + lastname)
    expect(page).to have_content(comment)

  end

end
