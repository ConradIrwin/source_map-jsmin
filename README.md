This is a version of Douglas Crockford's eponymous <a href="http://www.crockford.com/javascript/jsmin.html">jsmin</a> that also generates a <a href=https://github.com/ConradIrwin/ruby-source_map">source map</a> so that you can debug your javascript as though it had never been minified at all!

Huge thanks should be given to <a href="https://github.com/rgrove">Ryan Grove</a> for porting Douglas Crockford's C code to Ruby so that I could ruin it :).

Installation
============

    gem install source_map-jsmin


Creating a source map
=====================

```ruby

    input = File.read("public/javascripts/myscript.js")

    map = SourceMap::JSMin.minify(input, :input_filename => "myscript.js",
                                         :output_filename => "myscript.min.js",
                                         :source_root => "http://localhost:3000/javascripts/"
                                 )

    # Output the minified code to a file for serving
    File.open("public/javascripts/myscript.min.js", "w"){ |f| f << map.generated_output }

    # Output the map to a file in the same manner
    File.open("public/javascripts/myscript.map.json", "w"){ |f| f << map.to_s }

```


Using a source map
==================

In summary, you need to serve `public/javascripts/myscript.min.js` with an extra HTTP
header: `X-SourceMap: /javascripts/myscript.map.json`, and enable source maps in the
developer console of your Google Chrome 19+ web browser.

For more details try the `source_map` gem's <a href="https://github.com/ConradIrwin/ruby-source_map">README</a>.

Future work
===========

* I'd like to support passing an `:input_sourcemap` argument to minify so that if the
  input file was generated by a process that created a source map, the minification step
  will create a source map that refers to the original sources instead of to the
  intermediary input file.


License
=======

This is all licensed under the MIT license, though it inherits Douglas Crockfords
additional: "Must be used for good not evil" clause. If you have really pernickety lawyers
this may cause you problems; but if you're actually using it for evil, you probably don't
care too much.


Meta-fu
=======

Contributions, bug reports and feature requests are welcome, though if they are to do with
the core JSMIN please send them <a href="https://github.com/rgrove/jsmin">upstream</a> and
then notify me.
