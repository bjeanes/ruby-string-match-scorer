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

# Other Stuff

You can use different scoring algorithms. Out of the box this comes with a 
direct port of the [QuickSilver](http://is.gd/CUqC) algorithm and the adapted
[LiquidMetal](http://github.com/rmm5t/liquidmetal) one.

LiquidMetal scorer is faster with longer strings and also handles case
differences better.

It's easy to create other scoring algorithms, just look at any of the files
in `lib/scorers` directory

# License

Copyright (c) 2009 Bodaniel Jeanes

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
