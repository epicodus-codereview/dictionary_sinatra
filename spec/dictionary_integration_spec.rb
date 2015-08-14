require('capybara/rspec')
require('./app')
Capybara.app= Sinatra::Application
set(:show_exceptions, false)

describe('dictionary integration user path', {:type => :feature}) do

  it('traces user path to create a new word') do
    visit('/')
    click_link('Add a new word')
    fill_in('new_word', :with => 'whale')
    fill_in('initial_definition', :with => 'a water mammal')
    click_button('Add Word')
    expect(page).to have_content('Your word and definition were added!')
  end

  it('traces user path to view a new word and its definitions') do
    visit('/')
    click_link('whale')
    expect(page).to have_content('Definitions')
  end

  it('traces user path to create a new definition for a word') do
    visit('/')
    click_link('whale')
    click_link('Add a New Definition')
    fill_in('new_definition', :with => 'a big fat blubbery water mammal')
    click_button('Add Definition')
    expect(page).to have_content('Your new definition was added!')
  end

  it('traces user path to remove a definition') do
    visit('/')
    click_link('whale')
    click_link('Remove a Definition')
    fill_in('remove_definition', :with => '1')
    click_button('Remove Definition')
    expect(page).to have_content('Definition has been deleted!')
  end
end
