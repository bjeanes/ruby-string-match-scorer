# Usage

Just require `string_scorer` into your Ruby code and use the `String#score`
method to find out the score for a matching string. Especially useful for
sorting arrays of strings in search results etc...

    require 'string_scorer'

    string = "Hello, World"

    puts string.score("xyz")                        # => 0.0
    puts string.score("Hello World")                # => 0.915384615384615
    puts string.score("H,W")                        # => 0.642307692307692
    puts string.score("orl")                        # => 0.353846153846154
    puts string.score("ll")                         # => 0.707692307692308

    puts string.score("xyz", :quicksilver)          # => 0.0
    puts string.score("Hello World", :quicksilver)  # => 0.708333333333333
    puts string.score("H,W", :quicksilver)          # => 0.568402777777778
    puts string.score("orl", :quicksilver)          # => 0.75
    puts string.score("ll", :quicksilver)           # => 0.766666666666667
