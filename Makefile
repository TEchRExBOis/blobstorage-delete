numbers := 1 2 3 4 5
my_array=($(az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'))
target:
	$(foreach my_array,$(my_array), \
		#$(if $(filter-out 4,$(number)), \
		#	$(info $(number) is less than 4), \
		#	$(info $(number) is greater than or equal to 4) \
			$(info $(my_array)) \
		#) \
	)
