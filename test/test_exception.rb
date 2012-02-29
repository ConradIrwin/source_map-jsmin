require File.expand_path(File.dirname(__FILE__) + "/../lib/source_map/jsmin")
require 'test/unit'

class ExceptionTest < Test::Unit::TestCase
  def test_exception
    File.open("js/error.js") do |i|
      SourceMap::JSMin.minify(i, :input_filename => 'source.js')
    end
    assert_raise {}
  rescue SourceMap::JSMin::ParseError => e
    assert_equal %q{JSMin Parse Error: unterminated string literal: "\n" at line 4 of #<File:js/error.js>},
                  e.to_s
  end
end
