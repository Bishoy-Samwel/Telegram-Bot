require 'yaml'

class Config
  def self.token
    YAML.safe_load(IO.read('.token.yml'))['TOKEN']
  end
end
