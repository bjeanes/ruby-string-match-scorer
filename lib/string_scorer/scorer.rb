module StringScorer
  class << self
    def register(id, klass)
      scorers[id.to_sym] = klass
    end

    def []=(id, klass)
      register(id, klass)
    end

    def [](id)
      scorers[id.to_sym] || raise("No such scoring algorithm")
    end

    private
    def scorers
      @scorers ||= {}
    end
  end
end

scorers = File.expand_path(File.join(File.dirname(__FILE__), 'scorers', '*.rb'))
Dir[scorers].each do |scorer|
  load(scorer)
end
