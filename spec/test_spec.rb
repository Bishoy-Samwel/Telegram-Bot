require_relative '../lib/scrapper'
require_relative '../lib/reply'
require_relative '../lib/bot_logic'
describe 'scrapper' do
  let(:scrapper) { Scrapper.new }
  let(:first_category) { scrapper.links.keys.first }
  let(:first_link) { scrapper.links[scrapper.links.keys.first] }

  it 'links_attribute has 10 links for each category' do
    expect(scrapper.links.keys.length).to eql(10)
  end

  it 'categories_attibute has 10 values ' do
    expect(scrapper.categories.length).to eql(10)
  end

  it 'category? should return true if included' do
    expect(scrapper.category?(first_category)).to eql(true)
  end

  it 'extract_info should return a dictionary of reciepes info and has 5 key-value pairs' do
    expect(scrapper.extract_info(first_category).length).to eql(5)
  end

  it 'recipe_info should set recipes_arr, recipes_titles attributes' do
    scrapper.recipes_info(first_category)
    expect(scrapper.recipes.nil? && scrapper.recipes_titles.nil?).not_to eql(true)
  end

  it 'recipe? should return true if included in recepies_titles' do
    scrapper.recipes_info(first_category)
    first_title = scrapper.recipes_titles.first
    expect(scrapper.recipe?(first_title)).to eql(true)
  end

  it 'links_attribute has 10 links for each category' do
    expect(scrapper.links.keys.length).to eql(10)
  end

  it 'categories_attibute has 10 values ' do
    expect(scrapper.categories.length).to eql(10)
  end

  it 'category? should return true if included' do
    expect(scrapper.category?(first_category)).to eql(true)
  end

  it 'extract_info should return a dictionary of reciepes info and has 5 key-value pairs' do
    expect(scrapper.extract_info(first_category).length).to eql(5)
  end

  it 'recipe_info should set recipes_arr, recipes_titles attributes' do
    scrapper.recipes_info(first_category)
    expect(scrapper.recipes.nil? && scrapper.recipes_titles.nil?).not_to eql(true)
  end

  it 'recipe? should return true if included in recepies_titles' do
    scrapper.recipes_info(first_category)
    first_title = scrapper.recipes_titles.first
    expect(scrapper.recipe?(first_title)).to eql(true)
  end
  # negative
  it 'links_attribute has 10 links for each category' do
    expect(scrapper.links.keys.length).not_to eql(0)
  end

  it 'categories_attibute has 10 values ' do
    expect(scrapper.categories.length).to_not eql(0)
  end

  it 'category? should return true if included' do
    expect(scrapper.category?(first_category)).to_not eql(false)
  end

  it 'extract_info should return a dictionary of reciepes info and has 5 key-value pairs' do
    expect(scrapper.extract_info(first_category).length).to_not eql(0)
  end

  it 'recipe? should return true if included in recepies_titles' do
    scrapper.recipes_info(first_category)
    first_title = scrapper.recipes_titles.first
    expect(scrapper.recipe?(first_title)).to_not eql(false)
  end
end

describe 'bot_logic' do
  let(:reply) { Reply.new }
  it 'responds with welcome message when /start' do
    response = respond('/start', '0')[0][:text]
    expect(response.include?('Welcome to Chefo I am a Chef bot.')).to eql(true)
  end
  it 'responds with stop message when No or /stop' do
    response = respond('/stop', '0')[0][:text]
    expect(response.include?('Bye')).to eql(true)
  end
  it 'responds with suggest message when /suggest' do
    response = respond('/suggest', '0')[0][:text]
    expect(response.include?('What category of food would you prefer?')).to eql(true)
  end
  it 'responds with help message when /help' do
    response = respond('/help', '0')[0][:text]
    expect(response.include?('You can control me with these commands:')).to eql(true)
  end
  let(:reply) { Reply.new }
  it 'responds with welcome message when /start' do
    response = respond('/start', '0')[0][:text]
    expect(response.include?('Bye')).to_not eql(true)
  end
  it 'responds with stop message when No or /stop' do
    response = respond('/stop', '0')[0][:text]
    expect(response.include?('Welcome')).to_not eql(true)
  end
  it 'responds with suggest message when /suggest' do
    response = respond('/suggest', '0')[0][:text]
    expect(response.include?('Hi')).to_not eql(true)
  end
  it 'responds with help message when /help' do
    response = respond('/help', '0')[0][:text]
    expect(response.include?('Welcome')).to_not eql(true)
  end
end
