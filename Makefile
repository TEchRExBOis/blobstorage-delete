containername:
	#az storage blob list --account-name $(STORAGE_ACCOUNT) --container-name staging1
        az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" | jq .[].name
	az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" | jq .[].name
