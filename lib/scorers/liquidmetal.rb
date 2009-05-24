class String
  protected
  module LiquidMetal
    StringScorer.register(:liquid_metal, self)

    class << self
      def score(string, abbreviation)
         0.0
      end
    end
  end
end
