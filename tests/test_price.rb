require "minitest/autorun"
require "./lib/price.rb"
# require "./lib/test_setup"

class TestPrice < MiniTest::Test

  def test_sample
    assert_equal(4, 2+2)
  end

  def setup
		@object=Object.new
		@object.extend(Price)
	end

	def test_flat_markup
		assert_equal 10.5, @object.flat_markup(10)
	end

end