module Price

	def flat_markup(cost)
		if cost.is_a?(Float) || cost.is_a?(Integer)
			if (cost != nil && cost != 0)
				(cost*(1+0.05)).round(2)
			end
		else
			raise ArgumentError
		end
	end


	def for_each_person(num_of_people)
		if num_of_people.is_a?(Integer) && num_of_people >= 0
			(num_of_people*0.012).round(3)
		else
			raise ArgumentError
		end
	end



	# Markups added for different materials

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

	# system 2
	# Another system calculates the base price depending on the number of products needing to packaged.
	# Markup calculator needs to accept initial base price AND different categories of markups AND calculate final cost
	# Flat markup is calculated first; all other markups calculated on top of the (base price + flat markup)

	def people_checker(people)
		if people.is_a?(Integer)
			if people < 0
				raise ArgumentError
			end
		else
			raise ArgumentError
		end
	end

	def product_checker(product)
		if !product.is_a?(String)
			raise ArgumentError
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
# markup_calc(5432, 1, "drugs")
