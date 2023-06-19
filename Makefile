AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
FILTER_STRING := temp-logs 

target:
	my_array=($(az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'))
	echo "${my_array[0]}"
