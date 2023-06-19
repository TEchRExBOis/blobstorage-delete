#numbers := 1 2 3 4 5

target:
	my_array=($(az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'))
	$(foreach my_array,$(my_array), \
		echo "$(my_array)"; \
	)
