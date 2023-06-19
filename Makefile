ARRAY := element1 element2 element3
FILTER_STRING := element3

target:
	$(foreach item,$(ARRAY), \
		$(if $(findstring $(FILTER_STRING),$(item)), \
			@echo $(item) contains $(FILTER_STRING); \
		) \
	)

