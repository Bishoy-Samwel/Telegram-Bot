require_relative 'scrapper'
class Reply
  attr_reader :reply_txt, :reply_keyboard
  def initialize
    @reply_txt= {
      'welcome' => 'Welcome to Chefo I am a Chef bot, what can I do for you?',
      # rubocop:disable Layout/LineLength
      'commands' => "You can control me with these commands: \n /start - start the bot \n /stop - stop the bot \n /book - get a recommendation for a recipe of your preferred food category \n /help - see the list of available commands",
      # rubocop:enable Layout/LineLength
      'ask_category' => 'What category of food would you prefer?',
      'another_recipes'=> 'Would you like another suggestion?',
      'wrong_input' => "I'm afraid I can't help you with that...What can I do for you?"
    }
    @reply_keyboard={
      'ask_category' => ,
      'yes_No' => [%w[Yes], %w[No]]
    }
  end


  def keyboard(keyboard)
    array = reply_keyboard[keyboard]
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: array, one_time_keyboard: true)
  end


end
