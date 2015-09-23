	def flat_markup(cost)
		cost*(1+0.05)
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

	def add_tax(product, people)
		case product
		when 1 then 0.02 + (people * 0.012)
		when 2 then 0.075 + (people*0.012)
		when 3 then 0.13 + (people * 0.012)
		when 0 then people*0.012
		when 7 
			return
		end
	end


	def markup_calc(base_price, num_people, category)
		case category
		when 1 then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when 2 then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when 3 then puts (flat_markup(base_price) * (1+add_tax(category,num_people))).round(2)
		when 4 then puts (flat_markup(base_price) * (1+add_tax(category, num_people))).round(2)
		else puts "Please make a selection"
		end
	end

markup_calc(1299.99, 3, 3)
