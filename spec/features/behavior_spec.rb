require 'rails_helper'

RSpec.describe 'Creating an user', type: :feature do
    scenario "User creates a new user account" do
        visit new_user_path
        fill_in 'Name', with: 'Alexis'
        fill_in 'Email', with: 'Something@mail.com'
        click_on 'Create User'
        visit users_path 
        expect(page).to have_content('Alexis')
    end

    scenario "User creates a new user account with invalid name input" do
        visit new_user_path
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'Something@mail.com'
        click_on 'Create User'
        expect(page).to have_content("Name can't be blank")
    end
end

RSpec.describe 'User sees index content', type: :feature do
    scenario "and access a new micropost path" do
        visit root_path
        click_on 'New Micropost'
        visit new_micropost_path
        expect(page).to have_content('Content')
    end
end