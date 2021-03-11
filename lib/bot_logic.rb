require_relative './app_config'
require_relative './reply'
require 'telegram/bot'

reply = Reply.new

# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength
define_method :respond do |message, id, first_name = ''|
  unless message.nil?
    if message.include?('start') || message.include?('hi')
      return [{ chat_id: id,
                text: "Hi, #{first_name} " + reply.reply_txt['welcome'], reply_markup: reply.keyboard('commands') }]
    elsif message.include?('help')
      return [{ chat_id: id, text: reply.reply_txt['commands'],
                reply_markup: reply.keyboard('commands') }]
    elsif message.include?('suggest') || message.include?('Yes')
      return [{ chat_id: id, text: reply.reply_txt['ask_category'],
                reply_markup: reply.keyboard('ask_category') }]
    elsif message.include?('No') || message.include?('stop')
      return [{ chat_id: id, text: "Bye, #{first_name}" }]
    elsif reply.scrapper.category?(message)
      reply.get_suggestions(message)
      return [{ chat_id: id,
                text: reply.reply_txt['suggestions'],
                reply_markup: reply.keyboard('show_suggestions') }]
    elsif reply.scrapper.recipe?(message)
      reply.get_recipe(message)
      return [{ chat_id: id, text: reply.reply_txt['recipe'], parse_mode: 'html' },
              { chat_id: id, text: reply.reply_txt['another_recipes'], parse_mode: 'html',
                reply_markup: reply.keyboard('yes_no') }]
    end
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength
