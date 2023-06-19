#target:
#	az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'
MY_ARRAY := $(shell $(AZ_CLI_COMMAND))
target:	
	$(foreach item,$(ARRAY), \
		@echo $(item); \
	)
.PHONY: target
