array_name := az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
#ARRAY := element1 element2 element3
ARRAY := $(shell $(array_name))
FILTER_STRING := unwaxed

target:
	$(foreach item,$(ARRAY), \
		$(if $(findstring $(FILTER_STRING),$(item)), \
			@echo $(item) contains $(FILTER_STRING); \
		) \
	)

