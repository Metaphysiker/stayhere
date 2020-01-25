require 'rails_helper'

RSpec.describe "signatures", :type => :feature do

  it "visits root path and expect a link to an open letter" do

    visit root_path

    expect(page).to have_content("Zum offenen Brief")
    click_on('Zum offenen Brief')
    expect(page).to have_current_path(open_letter_path)
  end


  it "visits open letter, expects a field for signing and tries to sign" do

    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name

    visit open_letter_path

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Vielen Dank")
    expect(page).to have_content(firstname + " " + lastname)
  end

  it "visits open letter, expects a field for signing and tries to sign with email" do

    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = Faker::Internet.email

    visit open_letter_path

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname
    check 'signature_i_want_to_be_kept_up_to_date'
    fill_in 'e-Mail', with: email

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Vielen Dank")
    expect(page).to have_content(firstname + " " + lastname)

    expect(Signature.where(email: email).empty?).to be false

  end

  it "visits open letter, expects a field for signing and tries to sign with email, picture and comment" do

    comment = Faker::Lorem.paragraph
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name

    visit open_letter_path

    fill_in 'Vorname', with: firstname
    fill_in 'Nachname', with: lastname

    fill_in 'Kommentar', with: comment

    click_button 'Unterschrift einreichen'

    expect(page).to have_content("Vielen Dank")
    expect(page).to have_content(firstname + " " + lastname)

    visit pin_board_path
    expect(page).to have_content(comment)

  end

end
