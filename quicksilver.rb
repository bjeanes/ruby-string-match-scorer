class String
  def score(abbreviation, offset = 0)
    length = abbreviation.length

    return 0.9 if length == 0
    return 0.0 if length > self.length

    abbreviation.length.downto(1) do |i|
      sub   = abbreviation[0,i]
      index = self.index(sub)

      next if index.nil?
      next if index + length > self.length + offset

      next_string       = self[(index+sub.length)..-1]
      next_abbreviation = (i >= abbreviation.length) ? '' : abbreviation[i..-1]

      remaining_score   = next_string.score(next_abbreviation, offset + index)

      if remaining_score > 0
        score = self.length - next_string.length

        if index != 0
          c = self[index-1]

          if (c==32 || c == 9)     # space or tab
            (index-2).downto(0) do |j|
              c = self[j]
              score -= ((c == 32 || c == 9) ? 1 : 0.15)
            end
          elsif c >= 65 && c <= 90 # capital letter
            (index-1).downto(0) do |j|
              c = self[j]
              score -= (c >= 65 && c <= 90 ? 1 : 0.15)
            end
          else
            score -= index
          end
        end

        score += remaining_score * next_string.length
        score /= self.length
        return score
      end
    end

    0.0
  end
end
