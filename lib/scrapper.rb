require 'httparty'
require 'nokogiri'
class Scrapper
  attr_reader :categories, :links, :recipes_titles, :recipes

  def initialize
    @links = {
      'Breakfast and brunch' => '78/breakfast-and-brunch/',
      'Lunch' => '17561/lunch/',
      'Dinners' => '17562/dinner/',
      'Appetizer and Snacks' => '76/appetizers-and-snacks/',
      'Breads' => '156/bread/',
      'Drinks' => '77/drinks/',
      'Salads' => '96/salad/',
      'Deserts' => '79/desserts/',
      'Side Dishes' => '81/side-dish/',
      'Soups and Stews' => '94/soups-stews-and-chili/'
    }
    @categories = @links.keys
  end

  def category?(message)
    categories.include?(message)
  end

  def recipe?(message)
    @recipes_titles&.include?(message)
  end

  def one_recipe_info(title)
    index = @recipes_titles.find_index(title)
    recipe = @recipes_arr[index]
    result = "<b>#{recipe[:title]}</b>
  #{recipe[:description]}
    <b>#{recipe[:author]}</b>
    <a href='#{recipe[:recipes_url]}'> Read More</a>"
    if result.nil?
      "Sorry I couldn't extract the required info use GOOGLE Lazy :D"
    else
      result
    end
  end

  def recipes_info(category)
    recipes_dict = extract_info(category) # dictionary titles:[---]
    @recipes_arr = [] # array of recipes
    @recipes_titles = recipes_dict[:titles]
    recipes_dict[:titles].length.times do |i|
      @recipes_arr << {
        index: i,
        title: recipes_dict[:titles][i],
        description: recipes_dict[:descriptions][i],
        recipes_url: recipes_dict[:recipes_urls][i],
        review: recipes_dict[:reviews][i],
        author: recipes_dict[:authors][i]
      }
    end
    @recipes_titles
  end

  def extract_info(category)
    @category = @links[category]
    html = HTTParty.get("https://www.allrecipes.com/recipes/#{@category}")
    @doc = Nokogiri::HTML(html.body)
    recipes_dict = {}
    recipes_dict[:titles] = @doc.css('.card__title').map { |title| title.content.strip }
    recipes_dict[:descriptions] = @doc.css('.card__summary').map { |summary| summary.content.strip }
    recipes_dict[:recipes_urls] = @doc.css('.card__detailsContainer-left>.card__titleLink').map { |link| link['href'] }
    recipes_dict[:reviews] = @doc.css('.card__ratingCount').map { |review| review.content.strip }
    recipes_dict[:authors] = @doc.css('.card__authorName').map { |author| author.content.strip }
    recipes_dict
  end
end
