require('rspec')
require('definition')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe('#initialize') do
    it('creates a new definition') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      expect(test_def.definition()).to(eq('large mammal that lives in the ocean'))
    end
  end

  describe('#save') do
    it('saves a new definition to an array of definitions') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      expect(Definition.all().first()).to(eq(test_def))
    end
  end

  describe('.all') do
    it('returns the array of all definitions') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      test_def2 = Definition.new({:definition => 'small fish with a snout and tail'})
      test_def2.save()
      expect(Definition.all()).to(eq([test_def, test_def2]))
    end
  end

  describe('.clear') do
    it('removes all from the array of definitions') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      test_def2 = Definition.new({:definition =>'small fish with a snout and tail'})
      test_def2.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of a definition') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      expect(test_def.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the definition by its id from the array of definitions') do
      test_def = Definition.new({:definition => 'large mammal that lives in the ocean'})
      test_def.save()
      expect(Definition.find(1)).to(eq(test_def))
    end
  end

end
