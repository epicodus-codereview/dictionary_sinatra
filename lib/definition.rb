class Definition
  attr_reader(:definition)

  @@stored_definitions = []

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @definition_id = @@stored_definitions.length().+(1)
  end

  define_method(:save) do
    @@stored_definitions.push(self)
  end

  define_singleton_method(:all) do
    @@stored_definitions
  end

  define_singleton_method(:clear) do
    @@stored_definitions = []
  end

  define_method(:id) do
    @definition_id
  end

  define_singleton_method(:find) do |identification|
    found_definition = nil
    @@stored_definitions.each() do |definition|
      if definition.id().eql?(identification.to_i())
        found_definition = definition
      end
    end
    found_definition
  end

end
