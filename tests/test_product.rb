require "minitest/autorun"
require "./lib/product.rb"

class TestSetup < Minitest::Test

	def setup
		@product=Product.new(1299.99, 3, "food")
	end

	def test_total_price_with_markups
		assert_equal 1591.58, @product.total_price_with_markups
	end

	# def test_total_price_with_markups
	# 	refute_equal 1591.58, @product.price= "1299.99"
	# end

end