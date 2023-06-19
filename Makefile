numbers := 1 2 3 4 5

target:
	$(foreach number,$(numbers), \
		$(if $(filter-out 4,$(number)), \
			$(info $(number) is less than 4), \
			$(info $(number) is greater than or equal to 4) \
		) \
	)
