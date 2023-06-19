numbers := 1 2 3 4 5

target:
	$(foreach number,$(numbers), \
		@echo "The number is $(number)"; \
	)
