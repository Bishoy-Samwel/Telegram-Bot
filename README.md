![](https://img.shields.io/badge/Microverse-blueviolet)

# Telegram-Chef-Bot (Ruby Capstone Project) 


## Chefo The Chef Bot
> A Telegram Bot that recommends recipes of a chosen category.

![1](./assets/4.png)
![2](./assets/5.png)


## Built With

- Ruby
- telegram-bot-ruby gem
- Telegram's BotFather
- RSpec
- Nokogiri
- httparty

## Getting Started

### Creating the bot - Having the token
- The first step in creating our bot is to talk to the BotFather.
- Type in the search form BotFather.
- Hit the start button which will display a list of commands that we can use to interact with the BotFather.
- Let’s create our bot using the command `/newbot`.
- `/token`, it will give us an API token to access our bot through HTTPS. (We will use it later)
 

To get a local copy up and running follow these simple steps.

### Prerequisites
- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- From terminal or cmd type `gem install rspec`

### Install

#### Clone the repository
- Click on the "code" button above in this page and copy the link of the repository
- From terminal or cmd type type `git clone` and paste the link you copied in the previous step, then hit Enter
- Go to the cloned repository using `cd` command

#### Setup
- Run `bundle install` to install the required gems in your computer
- Type `export TOKEN=`+ the token value we got form BotFather
- From within the directory of the project, type `ruby bin/bot` to run the exectuable file and hit Enter

### Usage

- Open Telegram app
- Search ChefBot
- Click on the Start button or type `/start` to initialize the bot.
- Type `/suggest` to get a recommendation of a book. You can choose from the categories listed: Breakfast, Lunch, Dinners, Appetizer and Snacks, Salads, Deserts etc...
- Type `/help` to see the list of available commands
- Use CTRL + C in your terminal to stop the bot 

### Run tests

From the root folder, run `rspec` to run the tests

## Authors

👤 **Bishoy Samwel Faheem**
- GitHub: [@Bishoy Samwel Faheem](https://github.com/Bishoy-Samwel)
- LinkedIn: [Bishoy Samwel](https://www.linkedin.com/in/bishoy-samwuel-ss/)
- Twitter: [@bisho](https://twitter.com/BishoFaheem15)

## 🤝 Contributing
Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bishoy-Samwel/Telegram-Bot/chefo-bot//issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
- Inspired by:
- [Fritz The Librarian Bot](https://github.com/aliciapaz/ruby_bot)
- [Allrecipes Web Scraper](https://github.com/jadx2/recipes_scraper)
## 📝 License

This project is [MIT](LICENSE) licensed.
