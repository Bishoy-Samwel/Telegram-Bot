require_relative './scrapper'
class Reply
  attr_reader :reply_txt, :reply_keyboard, :scrapper

  # rubocop:disable Metrics/MethodLength
  def initialize
    @scrapper = Scrapper.new
    @reply_txt = {
      'welcome' => 'Welcome to Chefo I am a Chef bot.',
      'commands' => "
      You can control me with these commands: \n
      /start - start the bot \n
      /stop - stop the bot \n
      /suggest - get a recommendation for a recipe of your preferred food category \n
      /help - see the list of available commands",
      'suggestions' => 'Here are some suggestions :)',
      'ask_category' => 'What category of food would you prefer?',
      'recipe' => 'Here we are',
      'another_recipes' => 'Would you like another suggestion?',
      'wrong_input' => "I'm afraid I can't help you with that...What can I do for you?"
    }
    @reply_keyboard = {
      'ask_category' => @scrapper.categories,
      'show_suggestion' => 'This is my suggestions',
      'yes_no' => [%w[Yes], %w[No]],
      'commands' => [['/start', '/stop'], ['/suggest', '/help']]
    }
  end

  # rubocop:enable Metrics/MethodLength
  def get_recipe(message)
    @reply_txt['recipe'] = @scrapper.one_recipe_info(message)
  end

  def get_suggestions(message)
    @reply_keyboard['show_suggestions'] = @scrapper.recipes_info(message.to_s)
  end

  def keyboard(input)
    array = input.is_a?(String) ? reply_keyboard[input] : input
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: array, one_time_keyboard: true)
  end
end
