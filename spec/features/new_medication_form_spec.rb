require "spec_helper"

feature 'new medication form' do

  before :each do
    @med = create(:med)
    sign_in
    visit(new_users_med_path)
  end

  scenario 'shows new medication form' do
    expect(page).to have_content('New Medication')
  end

  scenario 'create new users_med' do
    select(@med.to_s, from: 'users_med_med_id')
    select('Four times', from: 'users_med_freq')
    select('daily', from: 'users_med_freq_unit')
    fill_in('users_med_start', with: Date.today)
    fill_in('users_med_num_doses', with: 5)
    click_button('Add to My Medication List')
    expect(page).to have_content('Generic 10mg (Brand) was successfully added.')
  end

  scenario 'correct number of doses are displayed', js: true do
    select('One time', from: 'users_med_freq')
    expect(page).to have_content('First dose')
    select('Two times', from: 'users_med_freq')
    expect(page).to have_content('Second dose')
    select('Three times', from: 'users_med_freq')
    expect(page).to have_content('Third dose')
    select('Four times', from: 'users_med_freq')
    expect(page).to have_content('Fourth dose')
    select('Five times', from: 'users_med_freq')
    expect(page).to have_content('Fifth dose')
    select('Six times', from: 'users_med_freq')
    expect(page).to have_content('Sixth dose')
  end

end
