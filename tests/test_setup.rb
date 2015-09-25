require "minitest/autorun"
require "./lib/price.rb"

class TestSetup < Minitest::Test

	def setup
		@object=Object.new
		@object.extend(Price)
	end

	def test_flat_markup
		assert_equal 10.5, @object.flat_markup(10)
	end

	def test_not_flat_markup
		refute_equal 11, @object.flat_markup(10)
	end

	def test_for_each_person
		assert_equal 0.144, @object.for_each_person(12)
	end

	def test_people_checker
		rando = rand(1..10000)
		assert_equal rando, @object.people_checker(rando)
	end

	def test_product_checker
		assert_equal String.new, @object.product_checker(String.new)
	end


	def test_electronics_markup
		assert_equal 2.59, @object.electronics_markup(123.50)
	end

	def test_food_markup
		assert_equal 1.84, @object.food_markup(13.50)
	end

	def test_pharmaceuticals_markup
		assert_equal 315.21, @object.pharmaceuticals_markup(4002.65)
	end

	def test_add_tax
		assert_equal 0.166, @object.add_tax("food", 3)
	end

	def test_markup_calc
		assert_equal 13707.63, @object.markup_calc(12456.95, 4, "books")
	end

end