class String
  def score(abbreviation, method = :liquid_metal)
    StringScorer[method].score(self, abbreviation)
  end
end
