AZ_CLI_DELETE_COMMAND := az storage blob delete --account-name $(STORAGE_ACCOUNT_NAME) --only-show-errors --container-name $(CONTAINER_NAME) --name
AZ_CLI_COMMAND := az storage blob list --account-name $(STORAGE_ACCOUNT_NAME) --container-name $(CONTAINER_NAME) --prefix "" --only-show-errors
FILTER_STRING := $(FILTER_STRING_SEARCH)
target:
	az functionapp stop --name $(function_app_name) --resource-group $(rg_name)
	az role assignment create --assignee $(azure_client_id) --role "Storage Blob Data Contributor" --scope /subscriptions/$(azure_subscription_id)/resourceGroups/$(rg_name)/providers/Microsoft.Storage/storageAccounts/$(sa_name)
	az config set extension.use_dynamic_install=yes_without_prompt
	$(foreach item,$(shell $(AZ_CLI_COMMAND) | jq -r '.[].name' | grep $(FILTER_STRING)), $(AZ_CLI_DELETE_COMMAND) "$(item)";)
	az role assignment delete --assignee $(azure_client_id) --role "Storage Blob Data Contributor" --scope /subscriptions/$(azure_subscription_id)/resourceGroups/$(rg_name)/providers/Microsoft.Storage/storageAccounts/$(sa_name)
	az functionapp start --name $(function_app_name) --resource-group $(rg_name)
	
	

	
