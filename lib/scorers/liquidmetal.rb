class String
  protected

  # Algorithm from http://github.com/rmm5t/liquidmetal/blob/master/liquidmetal.js
  module LiquidMetal
    StringScorer.register(:liquid_metal, self)

    class << self
      def score(string, abbreviation)
         0.0
      end
    end
  end
end
