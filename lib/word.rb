class Word
  attr_reader(:word)

  @@stored_words = []
  @@sorted_stored_words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @word_id = @@stored_words.length().+(1)
    @word_definitions = []
  end

  define_method(:save) do
    @@stored_words.push(self)
  end

  define_singleton_method(:all) do
    @@stored_words
  end

  define_singleton_method(:clear) do
    @@stored_words = []
  end

  define_method(:id) do
    @word_id
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@stored_words.each() do |word|
      if word.id().eql?(identification.to_i())
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @word_definitions.push(definition)
  end

  define_method(:definitions) do
    @word_definitions
  end

  define_singleton_method(:alphabetize) do
    Word.all().each() do |item|
      temp_holder = item.word()
      @@sorted_stored_words.push(temp_holder)
    end
    @@sorted_stored_words.sort!()
  end

  define_singleton_method(:all_sorted) do
    @@sorted_stored_words
  end

end
