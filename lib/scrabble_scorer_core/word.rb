module ScrabbleScorer
  class Word
    attr_accessor :id, :word

    def destroy
      self.class.delete(id)
    end

    def initialize(id:, word:)
      @id = id
      @word = word
    end

    class << self
      def find(word)
        result = connection[word: word.upcase]
        return false unless result
        new(id: result.id, word: result.word)
      end

      def create(word)
        id = connection.insert(word: word.upcase)
        new(id: id, word: word)
      end

      def exists?(word)
        !!connection[word: word.upcase]
      end

      def delete(id)
        connection.where(id: id).delete
      end

      private

      def connection
        @connection ||= Connection.connection[:words]
      end
    end
  end
end
