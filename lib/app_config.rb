require 'yaml'

class App_Config
  def self.token
    YAML.safe_load(IO.read('.token.yml'))['TOKEN']
  end
end
