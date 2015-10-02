class Product

  FOOD_RATE = 0.13
  DRUG_RATE = 0.075
  ELECTRONICS_RATE = 0.02
  PEOPLE_RATE = 0.012
  FLAT_RATE = 0.05

	attr_accessor :price, :people_required, :category

  def initialize(price, people_required, category)
    @price = price
    @people_required = people_required
    @category = category
  end

	def validate_price(input)
    if @price.is_a?(Float) || @price.is_a?(Integer)
      if (@price != nil)
        flat_markup
      end
    else
      raise(ArgumentError, "Price must be either a float or an integer")
    end
  end

  def flat_markup
    @price + (@price * FLAT_RATE)
  end

  def people_markup
    @people * PEOPLE_RATE
  end

  def category_markup
    category_markup = case @category
      when "drugs" then flat_markup * DRUG
      when "food" then flat_markup * FOOD
      when "electronics" then flat_markup * ELECTRONICS
      else
        0
      end
  end

	# def flat_markup(cost)
	# 	if cost.is_a?(Float) || cost.is_a?(Integer)
	# 		if (cost != nil && cost != 0)
	# 			(cost*(1+0.05)).round(2)
	# 		end
	# 	else
	# 		raise ArgumentError
	# 	end
	# end

	def number_of_people_rate(number)
		if number.is_a?(Integer) && number >= 0
			(number * PEOPLE_RATE)
		else
			raise(ArgumentError, "Must pass in a number")
		end
	end


	# def pharmaceuticals_markup(cost)
	# 	if cost.is_a?(Float) || cost.is_a?(Integer)
	# 		if cost != nil
	# 			(flat_markup(cost)*0.075).round(2)
	# 		end
	# 	else
	# 		raise(ArgumentError, "Must pass in price as a Float or Integer")
	# 	end
	# end

	# def food_markup(cost)
	# 	if cost.is_a?(Float) || cost.is_a?(Integer)
	# 		if cost != nil
	# 			(flat_markup(cost)*0.13).round(2)
	# 		end
	# 	else
	# 		raise ArgumentError
	# 	end
	# end

	# def electronics_markup(cost)
	# 	if cost.is_a?(Float) || cost.is_a?(Integer)
	# 		if cost != nil
	# 			(flat_markup(cost)*0.02).round(2)
	# 		end
	# 	else
	# 		raise ArgumentError
	# 	end
	# end



	def assert_valid_people_input(people)
		if people.is_a?(Integer)
			if people < 0
				raise ArgumentError
			else
				people
			end
		else
			raise ArgumentError
		end
	end

	def assert_valid_product_input(product)
		if !product.is_a?(String)
			raise ArgumentError
		else
			product
		end
	end

	def add_tax(product, people)
		product_checker(product)
		people_checker(people)
		if product == "food"
			0.13 + (for_each_person(people))
		elsif product == "drugs"
			0.075 + (for_each_person(people))
		elsif product == "electronics"
			0.02 + (for_each_person(people))
		else
			for_each_person(people)
		end
	end

	def markup_calc(base_price, num_people, category)
		case category
		when "food" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2) #removed puts since tests were reading the nil value as the returned value
		when "drugs" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when "electronics" then (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when /.*/ then (flat_markup(base_price) * (1+add_tax(category, num_people))).round(2)
		else puts "Not a valid input for category"
		end
	end

end
# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
