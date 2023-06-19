AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
MY_ARRAY := $(shell $(AZ_CLI_COMMAND) | jq -r '.[].name')

target:
	@echo "my_array=($(MY_ARRAY][0]))"
