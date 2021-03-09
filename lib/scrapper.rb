require 'httparty'
require 'nokogiri'
class Scrapper
  attr_reader :categories
  def initialize
    @links = {
      'Breakfast and brunch' => '78/breakfast-and-brunch/', 
      'Lunch' => '17561/lunch/', 
      'Dinners' => '17562/dinner/', 
      'Appetizer and Snacks' => '76/appetizers-and-snacks/', 
      'Breads' =>'156/bread/',
      'Drinks' => '77/drinks/', 
      'Salads' => '96/salad/',
      'Deserts' => '79/desserts/',
      'Side Dishes' => '81/side-dish/',
      'Soups and Stews' => '94/soups-stews-and-chili/'
    }
    @categories = @links.keys
  end

  def is_category(message)
    categories.include?(message)
  end

  def is_recipe(message)
    unless @recipes_titles.nil?
      @recipes_titles.include?(message)
    end
  end

  def one_recipe_info(title)
    index = @recipes_titles.find_index(title)
    recipe = @recipes[index]
    result = "<b>#{recipe[:title]}</b>
  #{recipe[:description]}
    <b>#{recipe[:author]}</b>
    <a href='#{recipe[:recipes_url]}'> Read More</a>"
    unless result.nil?
      result
    else
      "Sorry I couldn't extract the required info use GOOGLE Lazy :D"
    end
    
  end

  def recipes_info(titles, descriptions, recipes_urls, reviews, authors)
    @recipes = []
    @recipes_titles = titles
    titles.length.times do |i|
      @recipes << {
        index: i,
        title: titles[i],
        description: descriptions[i],
        recipes_url: recipes_urls[i],
        review: reviews[i],
        author: authors[i]
      }
    end
    # return recipes[0]['title']
    @recipes_titles
  end

  def extract_info(category)
    @category = @links[category]
    html = HTTParty.get("https://www.allrecipes.com/recipes/#{@category}")
    @doc = Nokogiri::HTML(html.body)
    titles = @doc.css('.card__title').map { |title| title.content.strip }
    descriptions = @doc.css('.card__summary').map { |summary| summary.content.strip }
    recipes_url = @doc.css('.card__detailsContainer-left>.card__titleLink').map { |link| link['href'] }
    reviews = @doc.css('.card__ratingCount').map { |review| review.content.strip }
    authors = @doc.css('.card__authorName').map { |author| author.content.strip }
    recipes_info(titles, descriptions, recipes_url, reviews, authors)
  end
end