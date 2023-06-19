#target:
#	az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
MY_ARRAY := $(shell $(AZ_CLI_COMMAND))
#MY_ARRAY_LIST := $(subst $(eval) ,$(eval),$(MY_ARRAY))

target:
	
	$(foreach item,$(MY_ARRAY), \
		echo $(item); \
	)
	

.PHONY: target
