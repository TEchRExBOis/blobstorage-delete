#target:
#	az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
MY_ARRAY := $(shell $(AZ_CLI_COMMAND) | jq -r '.[].name')
MY_ARRAY_LIST := $(subst $(eval) ,$(eval),$(MY_ARRAY))

target:
	@echo "my_array=($(MY_ARRAY))"
	@echo "my_array_list=$(MY_ARRAY_LIST)"

.PHONY: target
