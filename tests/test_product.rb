require "minitest/autorun"
require "./lib/product.rb"

class TestSetup < Minitest::Test

	def setup
		@product=Product.new(1299.99, 3, "food")
	end

	# def test_flat_markup
	# 	assert_equal 1364.9895, @product.flat_markup(1299.99)
	# end

	def test_total_price_with_markups
		assert_equal 1591.58
	end


end