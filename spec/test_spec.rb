require_relative '../lib/scrapper'
require_relative '../lib/reply'

describe 'scrapper' do
  let(:scrapper){Scrapper.new}
  let(:first_category){scrapper.links.keys.first}
  let(:first_link){scrapper.links[scrapper.links.keys.first]}

  it "links_attribute has 10 links for each category" do
    expect(scrapper.links.keys.length).to eql(10)
  end

  it "categories_attibute has 10 values " do
    expect(scrapper.categories.length).to eql(10)
  end

  it "is_category should return true if included" do
    expect(scrapper.is_category(first_category)).to eql(true)
  end

  it "extract_info should return a dictionary of reciepes info and has 5 key-value pairs" do
    expect(scrapper.extract_info(first_category).length).to eql(5)
  end

  it "recipe_info should set recipes_arr, recipes_titles attributes" do
    scrapper.recipes_info(first_category)
    expect(scrapper.recipes.nil? && scrapper.recipes_titles.nil?).not_to eql(true)
  end

  it "is_recipe should return true if included in recepies_titles" do
    scrapper.recipes_info(first_category)
    first_title = scrapper.recipes_titles.first
    expect(scrapper.is_recipe(first_title)).to eql(true)
  end
end


 
end