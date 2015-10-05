class Product

  FOOD_RATE = 0.13
  DRUG_RATE = 0.075
  ELECTRONICS_RATE = 0.02
  PEOPLE_RATE = 0.012
  FLAT_RATE = 0.05
  ZERO_MARKUP = 0

	attr_accessor :price, :people_required, :category

  def initialize(price, number_of_people, category)
    @price = price
    @number_of_people= number_of_people
    @category = category
  end

	# def validate_price
 #    if @price.is_a?(Float) || @price.is_a?(Integer)
 #      if (@price != nil)
 #        flat_markup
 #      end
 #    else
 #      raise(ArgumentError, "Price must be either a float or an integer")
 #    end
 #  end

  def flat_markup
    # validate_price
    @price + (@price * FLAT_RATE)
  end

  def people_markup
    people_markup = flat_markup * (@number_of_people * PEOPLE_RATE)
  end

  def category_markup
    category_markup = case @category
      when "drugs" then flat_markup * DRUG_RATE
      when "food" then flat_markup * FOOD_RATE
      when "electronics" then flat_markup * ELECTRONICS_RATE
      else
        ZERO_MARKUP
      end
  end

	def number_of_people_rate
		if @number_of_people.is_a?(Integer) && @number_of_people >= 0
			people_markup
		else
			raise(ArgumentError, "Must pass in a number")
		end
	end

	def assert_valid_people_input
		if @number_of_people.is_a?(Integer)
			if @number_of_people < 0
				raise ArgumentError
			else
				@number_of_people
			end
		else
			raise ArgumentError
		end
	end

	def assert_valid_product_input
		if !@category.is_a?(String)
			raise(ArgumentError, "Category must be a string")
		else
			@category
		end
	end

  # def pharmaceuticals_markup(cost)
  #   if cost.is_a?(Float) || cost.is_a?(Integer)
  #     if cost != nil
  #       (flat_markup(cost)*0.075).round(2)
  #     end
  #   else
  #     raise(ArgumentError, "Must pass in price as a Float or Integer")
  #   end
  # end

  # def food_markup(cost)
  #   if cost.is_a?(Float) || cost.is_a?(Integer)
  #     if cost != nil
  #       (flat_markup(cost)*0.13).round(2)
  #     end
  #   else
  #     raise ArgumentError
  #   end
  # end

  # def electronics_markup(cost)
  #   if cost.is_a?(Float) || cost.is_a?(Integer)
  #     if cost != nil
  #       (flat_markup(cost)*0.02).round(2)
  #     end
  #   else
  #     raise ArgumentError
  #   end
  # end




	def add_tax(product, people)
		product_checker(product)
		people_checker(people)
		if product == "food"
			FOOD_RATE + (for_each_person(people))
		elsif product == "drugs"
			DRUG_RATE + (for_each_person(people))
		elsif product == "electronics"
			ELECTRONICS_RATE + (for_each_person(people))
		else
			for_each_person(people)
		end
	end

	# def markup_calc(base_price, num_people, category)
	# 	case @category
	# 	when "food" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2) #removed puts since tests were reading the nil value as the returned value
	# 	when "drugs" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
	# 	when "electronics" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
	# 	when /.*/ then (flat_markup(base_price) * (1+add_tax(category, num_people))).round(2)
	# 	else puts "Not a valid input for category"
	# 	end
	# end

  def total_price
    total_price_with_all_markups = (flat_markup + people_markup + category_markup).round(2)
  end

end

product = Product.new(1299.99, 3, "food")
puts product.total_price
puts product.flat_markup
puts product.category_markup
puts product.people_markup
product2=Product.new(5432, 1, "drugs")
product3=Product.new(12456.95, 4, "books")
puts "========================"
puts product2.total_price
puts product3.total_price
# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
