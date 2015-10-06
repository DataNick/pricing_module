class Product

  FOOD_RATE = 0.13
  DRUG_RATE = 0.075
  ELECTRONICS_RATE = 0.02
  PEOPLE_RATE = 0.012
  FLAT_MARKUP_RATE = 0.05
  ZERO_MARKUP = 0

	attr_accessor :price, :number_of_people, :material, :final_cost

  def initialize(price, number_of_people, material)
    @price = price
    @number_of_people= check_for_valid_number_of_people(number_of_people)
    @material = check_for_valid_material_input(material)
  end


  def flat_markup
    @price + (@price * FLAT_MARKUP_RATE)
  end

  def people_markup
    people_markup = flat_markup * (@number_of_people * PEOPLE_RATE)
  end

  def material_markup
    material_markup = case @material
      when "drugs" then flat_markup * DRUG_RATE
      when "food" then flat_markup * FOOD_RATE
      when "electronics" then flat_markup * ELECTRONICS_RATE
      else
        ZERO_MARKUP
      end
  end

  def total_price_with_markups
    total_price_with_markups = (flat_markup + people_markup + material_markup).round(2)
    @final_cost = total_price_with_markups
  end

  private

  def check_for_valid_input(price)
    return false if price.nil?
    return false if !price.match(/\d/)
    price
    # return false if !input.is_a?(Integer)
    # return false if !input.is_a?(String)
  end

  def check_for_valid_material_input(material)
    raise ArgumentError, "Must pass a string" unless material.is_a?(String)
    material
  end

  def check_for_valid_number_of_people(number_of_people)
    raise ArgumentError, "Must pass an integer" unless number_of_people.is_a?(Integer)
    number_of_people
  end

end

product = Product.new(1299.99, "3", "food")
product2 = Product.new(5432, 1, "drugs")
product3 = Product.new(12456.95, 4, "books")

puts product
puts product.material
puts product.number_of_people
# puts product.material
puts product.total_price_with_markups
# puts product.final_cost
puts product2.total_price_with_markups
puts product3.total_price_with_markups
# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
