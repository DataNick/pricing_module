module Price

	def flat_markup(cost)
		if cost.is_a?(Float) || cost.is_a?(Integer)
			if (cost != nil && cost != 0)
				cost*(1+0.05)
			end
		else
			raise ArgumentError
		end
	end


	def for_each_person(num_of_people)
		num_of_people*0.012
	end



	# Markups added for different materials

	def pharmaceuticals_markup(cost)
		flat_markup(cost)*0.075
	end

	def food_markup(cost)
		flat_markup(cost)*0.13
	end

	def electronics_markup(cost)
		flat_markup(cost)*0.02
	end

	# system 2
	# Another system calculates the base price depending on the number of products needing to packaged.
	# Markup calculator needs to accept initial base price AND different categories of markups AND calculate final cost
	# Flat markup is calculated first; all other markups calculated on top of the (base price + flat markup)

	# def add_tax(product, people)
	# 	case product
	# 	when 1 then 0.02 + (people * 0.012)
	# 	when 2 then 0.075 + (people*0.012)
	# 	when 3 then 0.13 + (people * 0.012)
	# 	when 0 then people*0.012
	# 	when 7 
	# 		return
	# 	end
	# end

	def add_tax(product, people)
		if people < 0
			raise ArgumentError
		end
		if !product.is_a?(String)
			raise ArgumentError
		end
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
		when "food" then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when "drugs" then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when "electronics" then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when /.*/ then puts (flat_markup(base_price) * (1+add_tax(category, num_people))).round(2)
		else puts "Not a valid input"
		end
	end

end

# markup_calc(1299.99, 3, "food")
# markup_calc(5432, 1, "drugs")
# markup_calc(12456.95, 4, "books")
