class Product

  FOOD_RATE = 0.13
  DRUG_RATE = 0.075
  ELECTRONICS_RATE = 0.02
  PEOPLE_RATE = 0.012
  FLAT_MARKUP_RATE = 0.05
  ZERO_MARKUP = 0

  private_constant :FOOD_RATE, :DRUG_RATE, :ELECTRONICS_RATE, :PEOPLE_RATE, :FLAT_MARKUP_RATE, :ZERO_MARKUP

	attr_accessor :price, :number_of_people, :material

  def initialize(price, number_of_people, material)
    check_validity(price, number_of_people, material)
    @price = price
    @number_of_people= number_of_people
    @material = material
  end

  def total_price_with_markups
    (flat_markup + people_markup + material_markup).round(2)
  end

  private

  def flat_markup
    @price + (@price * FLAT_MARKUP_RATE)
  end

  def people_markup
    flat_markup * (@number_of_people * PEOPLE_RATE)
  end

  def material_markup
    case @material
    when "drugs" then flat_markup * DRUG_RATE
    when "food" then flat_markup * FOOD_RATE
    when "electronics" then flat_markup * ELECTRONICS_RATE
    else
      ZERO_MARKUP
    end
  end

  def check_validity(price, number_of_people, material)
    raise ArgumentError, "Price must be present" unless price
    raise ArgumentError, "Price must be Integer or Float" unless check_price_validity(price)
    raise ArgumentError, "Material must be a String" unless material.is_a?(String)
    raise ArgumentError, "Number of People must be an integer" unless number_of_people.is_a?(Integer)
  end

  def check_price_validity(price)
    price.is_a?(Float) || price.is_a?(Integer)
  end

end

product = Product.new(1299.99, 3, "food")
product2 = Product.new(5432, 1, "drugs")
product3 = Product.new(12456.95, 4, "books")

puts product
# puts product.material
# puts product.number_of_people
# puts product.material
# puts product.flat_markup
puts product.total_price_with_markups
puts product2.total_price_with_markups
puts product3.total_price_with_markups
# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
