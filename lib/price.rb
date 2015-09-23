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

