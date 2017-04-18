require 'sequel'
require 'yaml'
module ScrabbleScorer
class Connection
  class << self
    def connection(database: true)
      return common_connection_url unless database
      @connection ||= Sequel.connect(connection_url)
    end

    def common_connection_url
      @connection ||= Sequel.connect("#{config['adapter']}://#{config['username']}:#{config['password']}@#{config['host']}:#{config['port']}/")
    end

    def connection_url
      "#{config['adapter']}://#{config['username']}:#{config['password']}@#{config['host']}:#{config['port']}/#{config['database']}"
    end

    def close
      @connection.disconnect
      @connection = nil
    end

    def config
      return @config if @config

      file = File.expand_path('config/database.yml')
      raise "Database configuration was not found #{file}" unless File.exist?(file)

      @config = YAML.safe_load(File.read('config/database.yml'))[ENV['RACK_ENV'] || 'development']
    end
  end
end
end
