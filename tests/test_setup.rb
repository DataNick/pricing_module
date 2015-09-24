require "minitest/autorun"
require "./lib/price.rb"

class TestSetup < Minitest::Test
	def default_test
	end

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

	# describe "calculate markup price" do
	# 	it "must equal price plus five percent" do
	# 		@object.flat_markup(10).must_equal 10.5
	# 	end
	# end
end