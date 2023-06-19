# Makefile to get all directory names of a storage account

# Variables
RESOURCE_GROUP = poc-anas
STORAGE_ACCOUNT = storageaccountblob1235

.PHONY: list-directories

containername:
	#az storage blob list --account-name $(STORAGE_ACCOUNT) --container-name staging1
        az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" | jq .[].name

