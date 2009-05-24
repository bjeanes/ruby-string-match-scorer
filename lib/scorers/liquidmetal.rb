class String
  protected

  # Algorithm from http://github.com/rmm5t/liquidmetal/blob/master/liquidmetal.js
  module LiquidMetal
    StringScorer.register(:liquid_metal, self)

    class << self
      SCORE_NO_MATCH             = 0.0;
      SCORE_MATCH                = 1.0;
      SCORE_TRAILING             = 0.8;
      SCORE_TRAILING_BUT_STARTED = 0.9;
      SCORE_BUFFER               = 0.85;

      def score(string, abbreviation)
        # Short circuits
        return SCORE_TRAILING if abbreviation.length == 0
        return SCORE_NO_MATCH if abbreviation.length > string.length
        return SCORE_MATCH    if abbreviation == string

        scores = score_array(string, abbreviation);
        scores.inject(0) {|v,m| v + m} / scores.size
      end

      def score_array(string, abbreviation)
        scores = Array.new(string.length)
        lower  = string.downcase
        chars  = abbreviation.downcase.split("")

        last_index = -1
        started    = false
        chars.each do |c|
          index = lower.index(c, last_index + 1)

          return fill_array(scores, SCORE_NO_MATCH) if index.nil?
          started = true if index == 0

          if new_word?(string, index)
            scores[index-1] = 1;
            fill_array(scores, SCORE_BUFFER, last_index + 1, index - 1)
          elsif uppercase?(string, index)
            fill_array(scores, SCORE_BUFFER, last_index + 1, index)
          else
            fill_array(scores, SCORE_NO_MATCH, last_index + 1, index)
          end

          scores[index] = SCORE_MATCH
          last_index = index
        end

        trailing_score = (started ? SCORE_TRAILING_BUT_STARTED : SCORE_TRAILING)
        fill_array(scores, trailing_score, last_index + 1)
        scores
      end

      def new_word?(string, index)
        c = string[index - 1]
        (index == 0 || c==32 || c == 9)
      end

      def uppercase?(string, index)
        c = string[index]
        (65..90).include?(c)
      end

      def fill_array(array, value, from=0, to=array.size)
        from = 0 if from < 0
        to   = 0 if to   < 0
        size = 1 + (to - from)

        array[from..to] = Array.new(size, value)
        array
      end
    end
  end
end
