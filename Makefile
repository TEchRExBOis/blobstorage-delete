# Makefile to get all directory names of a storage account

# Variables
RESOURCE_GROUP = poc-anas
STORAGE_ACCOUNT = storageaccountblob1235

.PHONY: list-directories

containername:
	az storage fs directory list \
		--account-name $(STORAGE_ACCOUNT) \
		--resource-group $(RESOURCE_GROUP) \
		--output table

