AZ_CLI_DELETE_COMMAND := az storage blob delete --account-name $(STORAGE_ACCOUNT_NAME) --only-show-errors --container-name $(CONTAINER_NAME) --name
AZ_CLI_COMMAND := az storage blob list --account-name $(STORAGE_ACCOUNT_NAME) --container-name $(CONTAINER_NAME) --prefix "" --only-show-errors
FILTER_STRING := $(FILTER_STRING_SEARCH)
target:
	bash script.sh $(STORAGE_ACCOUNT_NAME) $(CONTAINER_NAME) $(FILTER_STRING_SEARCH)
	
	

	
