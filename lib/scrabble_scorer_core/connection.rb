require 'sequel'
require 'yaml'
module ScrabbleScorer
  class Connection
    class << self
      def connection
        @connection ||= Sequel.connect(
            "#{config['adapter']}://#{config['database']}",
            {max_connections: config['pool'], timeout: config['timeout']}
        )
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
