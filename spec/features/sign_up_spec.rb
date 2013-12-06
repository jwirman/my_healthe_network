require "spec_helper"

describe 'the signup process' do

  before :each do
    User.create(first_name: 'Justin',
                last_name: 'Wirman',
                email: 'jwirman@gmail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  it 'signs me in' do
    visit(new_user_session_path)
    within("#main") do
      fill_in 'Email', :with => 'jwirman@gmail.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end

end
