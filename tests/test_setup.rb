require "minitest/autorun"
require "./lib/price.rb"

class TestSetup < Minitest::Test


# describe Price do
# 	before do
# 		@object=Object.new
# 		# @object.extend(Price)
# 	end
# end

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
		# assert_raises (RuntimeError, -1) do
		#  	raise ArgumentError, @object.people_checker(-1)
		# end
		# assert_equal ArgumentError, @object.people_checker("error")
	end

	def test_product_checker
	# 	assert_raises(RuntimeError, 1) do
	# 	 	raise ArgumentError, proc {@object.product_checker(1)}
	# 	end
	end

	def test_add_tax
		assert_equal 0.166, @object.add_tax("food", 3)
	end

	def test_markup_calc
		assert_equal 13707.63, @object.markup_calc(12456.95, 4, "books")
	end

end