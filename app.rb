require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all().sort_by{ |word| word.word().downcase()}
  erb(:index)
end

get('/words') do
  @words = Word.all().sort_by{ |word| word.word().downcase()}
  erb(:words)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions)
end

get('/words/new') do
  erb(:new_word_form)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:new_definition_form)
end

get('/words/:id/definitions/definition_removal') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_removal_form)
end

get('/words/word_removal') do
  @words = Word.all().sort_by{ |word| word.word().downcase()}
  erb(:word_removal_form)
end

post('/new_word') do
  new_word = params.fetch('new_word')
  initial_definition = params.fetch('initial_definition')
  @word = Word.new({:word => new_word})
  @word.save()
  @first_definition = Definition.new({:definition => initial_definition})
  @first_definition.save()
  @word.add_definition(@first_definition)
  erb(:new_word_success)
end

post('/new_definition') do
  new_definition = params.fetch('new_definition')
  @definition = Definition.new({:definition => new_definition})
  @definition.save()
  @word = Word.find(params.fetch('word_id'))
  @word.add_definition(@definition)
  erb(:new_definition_success)
end

post('/word_removal') do
  @word_to_remove = params.fetch('remove_word').to_i()
  @word_at_index = @word_to_remove.-(1)
  Word.all().delete_at(@word_at_index)
  erb(:word_removal_success)
end

post('/definition_removal') do
  @word = Word.find(params.fetch('word_id'))
  @definition_to_remove = params.fetch('remove_definition').to_i()
  @definition_at_index = @definition_to_remove.-(1)
  @word.definitions().delete_at(@definition_at_index)
  erb(:definition_removal_success)
end
