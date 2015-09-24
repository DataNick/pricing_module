require "minitest/autorun"
require "./lib/price.rb"
# require "./lib/test_setup"


describe "Price" do
	
	before do
		@object=Object.new
		@object.extend(Price)
	end

	it "returns an added five percent for a price" do
		@object.flat_markup(10).must_equal 10.5
	end

	it "returns a Float object" do
	@object.flat_markup(10).must_be_instance_of Float
	end


	it "raises an error if add_tax is passed a negative value for people" do
		proc {@object.add_tax("string", -3)}.must_raise ArgumentError
	end

	it "raises an error if add_tax is passed a non-string for product" do
		proc {@object.add_tax(2, 3)}.must_raise ArgumentError
	end


	it "raises an error if add_tax is passed a non-string for product AND a negative integer" do
		proc {@object.add_tax(2, -3)}.must_raise ArgumentError
	end

	it "raises an error when not passed a float or integer" do
		proc {@object.flat_markup("string")}.must_raise ArgumentError
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