#!/usr/bin/ruby

class String
  def to_alphanumberic
    gsub /[^\w\s]/,''
  end
end

require 'test/unit'
class StringExtensionsTest < Test::Unit::TestCase
  def test_strips_non_alphanumberic_characters
    assert_equal '3 the Magic Number','#3, the *Magic, Number*?'.to_alphanumberic
  end
end

#p StringExtensionsTest.new(0).test_strips_non_alphanumberic_characters
