require "minitest/autorun"
require "./lib/price.rb"
# require "./lib/test_setup"


describe "Price" do
	
	before do
		@object=Object.new
		@object.extend(Price)
	end

	describe "when a price is inputed" do
		it "returns an added five percent for a price" do
			@object.flat_markup(10).must_equal 10.5
		end
	end

	describe "when must return an object of type Float" do
		it "returns a Float object" do
			@object.flat_markup(10).must_be_instance_of Float
		end
	end

	describe "when passing a non-integer or non-float object" do
		it "raises an error when not passed a float or integer" do
			proc {@object.flat_markup("string")}.must_raise ArgumentError
		end
	end

	describe "when passing num_of_people value" do
		it "raises an error when number is negative value and is not an integer" do
			proc {@object.for_each_person(-2)}.must_raise ArgumentError
		end
	end

	describe "when passing cost to pharmaceutical method" do
		it "returns flat_markup cost plus the pharmaceutical markup" do
			@object.pharmaceuticals_markup(1500.00).must_equal 118.13 #since puts returns a nil value
		end
	end

	describe "when passing cost to food method" do
		it "returns flat_markup cost plus the food markup" do
			@object.food_markup(1275.10).must_equal 174.05 #since puts returns a nil value
		end
	end

	describe "when passing cost to electronics method" do
		it "returns flat_markup cost plus the electronics markup" do
			@object.electronics_markup(1895.25).must_equal 39.80 #since puts returns a nil value
		end
	end

	describe "when passing the number of people" do
		it "raises an error if argument is not an integer" do
			proc {@object.people_checker("23")}.must_raise ArgumentError
		end
	end

	describe "when passing the number of people" do
		it "raises an error if number of people is less than zero" do
			proc {@object.people_checker(-23)}.must_raise ArgumentError
		end
	end

	describe "when passing the type of product" do
		it "raises an error if variable passed is not a string" do
			proc {@object.product_checker(!Object.new.is_a?(String))}.must_raise ArgumentError
		end
	end

	describe "when negative values are passed as arguments" do
		it "raises an error if add_tax is passed a negative value for people" do
			proc {@object.add_tax("string", -3)}.must_raise ArgumentError
		end
	end

	describe "when passed a non-string object in product variable" do
		it "raises an error if add_tax is passed a non-string for product" do
			proc {@object.add_tax(2, 3)}.must_raise ArgumentError
		end
	end

	describe "when passed negative and non-string values" do
		it "raises an error if add_tax is passed a non-string for product AND a negative integer" do
			proc {@object.add_tax(2, -3)}.must_raise ArgumentError
		end
	end

	describe "when passing not a string to category value" do
		it "puts a sentence saying invalid input" do
			@object.markup_calc(1299.99, 3, 3).must_equal nil #since puts returns a nil value
		end
	end

	describe "when passing category value" do
		it "puts a sentence saying invalid input" do
			@object.markup_calc(12456.95, 4, "3").must_equal 13707.63 #since puts returns a nil value
		end
	end

end


# class TestPrice < MiniTest::Test


#   def setup
# 		@object=Object.new
# 		@object.extend(Price)
# 	end

# 	def test_flat_markup
# 		assert_equal 10.5, @object.flat_markup(10)
# 	end

# end