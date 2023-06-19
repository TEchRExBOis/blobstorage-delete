AZ_CLI := az
STORAGE_ACCOUNT_NAME := storageaccountblob1235
CONTAINER_NAME := staging1

containername:
    my_array=($$(($(AZ_CLI) storage blob list --account-name $(STORAGE_ACCOUNT_NAME) --container-name $(CONTAINER_NAME) --prefix "" --only-show-errors | jq -r '.[].name')))
    found_directories=false; \
    for item in $${my_array[@]}; do \
        if [[ "$$item" == *"${FILTER_STRING}"* ]]; then \
            echo "$$item"; \
            $(AZ_CLI) storage blob delete --account-name $(STORAGE_ACCOUNT_NAME) --container-name $(CONTAINER_NAME) --name "$$item"; \
            found_directories=true; \
        fi; \
    done; \
    if [ "$$found_directories" = false ]; then \
        echo "No directories matching the filter string were found."; \
    fi
