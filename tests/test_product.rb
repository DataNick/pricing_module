require "minitest/autorun"
require "./lib/product.rb"

class TestSetup < Minitest::Test

  def test_total_price_with_markups
    assert_equal 1591.58, Product.new(1299.99, 3, "food").total_price_with_markups
  end

  def test_total_price_with_markups_equals_second_test_case
    assert_equal 6199.81, Product.new(5432.00, 1, "drugs").total_price_with_markups
  end

  def test_total_price_with_markups_equals_third_test_case
    assert_equal 13707.63, Product.new(12456.95, 4, "books").total_price_with_markups
  end

  def test_price_cannot_be_string
    assert_raises ArgumentError do
      Product.new("1299.99", 3, "food")
    end
  end

  def test_price_cannot_be_blank
    assert_raises ArgumentError do
      Product.new(nil, 3, "food")
    end
  end

  def test_number_of_people_must_be_an_integer
    assert_equal true, Product.new(1299, 3, "food").number_of_people.is_a?(Integer)
  end

  def test_number_of_people_cannot_be_a_float
    assert_equal false, Product.new(1299.99, 3, "food").number_of_people.is_a?(Float)
  end

  def test_number_of_people_cannot_be_blank
    assert_raises ArgumentError do
      Product.new(1299.99, nil, "food")
    end
  end

  def test_materials_cannot_be_blank
    assert_raises ArgumentError do
      Product.new(1299.99, 3, nil)
    end
  end

  def test_materials_must_be_a_string
    assert_raises ArgumentError do
      Product.new(1299.99, 3, 3)
    end
  end

end