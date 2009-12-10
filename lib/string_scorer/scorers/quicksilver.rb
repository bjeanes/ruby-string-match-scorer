class String
  protected

  # Algorithm from http://is.gd/CUqC 
  module Quicksilver
    StringScorer.register(:quicksilver, self)

    class << self
      def score(string, abbreviation, offset = 0)
        length = abbreviation.length

        return 0.9 if length == 0
        return 0.0 if length > string.length

        abbreviation.length.downto(1) do |i|
          sub   = abbreviation[0,i]
          index = string.index(sub)

          next if index.nil?
          next if index + length > string.length + offset

          next_string       = string[(index+sub.length)..-1]
          next_abbreviation = (i >= abbreviation.length) ? '' : abbreviation[i..-1]

          remaining_score   = score(string, next_abbreviation, offset + index)

          if remaining_score > 0
            score = string.length - next_string.length

            if index != 0
              c = string[index-1]

              if (c==32 || c == 9)     # space or tab
                (index-2).downto(0) do |j|
                  c = string[j]
                  score -= ((c == 32 || c == 9) ? 1 : 0.15)
                end
              elsif c >= 65 && c <= 90 # capital letter
                (index-1).downto(0) do |j|
                  c = string[j]
                  score -= (c >= 65 && c <= 90 ? 1 : 0.15)
                end
              else
                score -= index
              end
            end

            score += remaining_score * next_string.length
            score /= string.length
            return score
          end
        end

        0.0
      end
    end
  end
end
