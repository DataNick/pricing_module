class Product
  FOOD = 0.13
  DRUG = 0.075
  ELECTRONICS = 0.02
  PEOPLE_PERCENT = 0.012
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
      raise(ArgumentError, "Price must be either a float or integer")
    end
  end

  def flat_markup
    @price + (@price * FLAT_RATE)
  end

  def people_markup
    @people * PEOPLE_PERCENT
  end

  def category_markup
    case @category
    when "drugs" then drug_markup = flat_markup * DRUG
    when "food" then food_markup = flat_markup * FOOD
    when "electronics" then electronic_markup = flat_markup * ELECTRONICS
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

	def for_each_person(num_of_people)
		if num_of_people.is_a?(Integer) && num_of_people >= 0
			(num_of_people*0.012).round(3)
		else
			raise ArgumentError
		end
	end


	def pharmaceuticals_markup(cost)
		if cost.is_a?(Float) || cost.is_a?(Integer)
			if cost != nil
				(flat_markup(cost)*0.075).round(2)
			end
		else
			raise ArgumentError
		end
	end

	def food_markup(cost)
		if cost.is_a?(Float) || cost.is_a?(Integer)
			if cost != nil
				(flat_markup(cost)*0.13).round(2)
			end
		else
			raise ArgumentError
		end
	end

	def electronics_markup(cost)
		if cost.is_a?(Float) || cost.is_a?(Integer)
			if cost != nil
				(flat_markup(cost)*0.02).round(2)
			end
		else
			raise ArgumentError
		end
	end



	def people_checker(people)
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

	def product_checker(product)
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

  private

  def clean_price(price)

  end

end
# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
