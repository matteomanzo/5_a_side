require 'spec_helper'

feature "User wants to register" do


  scenario "visiting the website" do
    visit '/'
    expect(page).to have_content("Not on the system? Enter a username")
  end

  scenario "being a new player and registering" do
    sign_up
    p Player.first.inspect
    expect(Player.first.username).to eq('ronaldo')
  end

  scenario "trying to register with a username already in the system" do
    expect{sign_up}.to change(Player, :count).by 1
    expect{sign_up}.to change(Player, :count).by 0
    expect(page).to have_content('This username is already taken')
  end

end

  def sign_up(username = 'ronaldo')
    visit '/'
    fill_in :username_register, :with => username
    click_button 'submit-register'
  end
