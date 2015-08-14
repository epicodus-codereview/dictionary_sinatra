require('rspec')
require('word')
require('definition')

describe('Word') do
  before() do
    Word.clear()
end

  describe('#initialize') do
    it('creates a new word') do
      test_word = Word.new({:word => 'whale'})
      expect(test_word.word()).to(eq('whale'))
    end
  end

  describe('#save') do
    it('saves a new word object to an array') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      expect(Word.all().first()).to(eq(test_word))
    end
  end

  describe('.all') do
    it('returns the array of all the words') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      test_word2 = Word.new({:word => 'seahorse'})
      test_word2.save()
      expect(Word.all()).to(eq([test_word, test_word2]))
    end
  end

  describe('.clear') do
    it('removes all values from the array of words') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      test_word2 = Word.new({:word => 'seahorse'})
      test_word2.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of a word') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the word from the array by its id') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      expect(Word.find(1)).to(eq(test_word))
    end
  end

  describe('#add_definition') do
    it('adds a definition to the array of definitions in the word object') do
      test_word = Word.new({:word => 'whale'})
      test_word.save()
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      test_word.add_definition(test_def)
      expect(test_word.definitions()).to(eq([test_def]))
    end
  end

end
