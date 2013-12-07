require "spec_helper"

feature 'user signs in' do
  scenario 'with valid email and password' do
    sign_in
    expect(page).to have_content('Signed in successfully.')
  end
end

feature 'user signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'
    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''
    expect(page).to have_content("Password can't be blank")
  end
end
