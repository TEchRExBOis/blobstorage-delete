test:
           echo "Test Commands"
containername:
             az storage container list --account-name storageaccountblob1235  --account-key '${{ secrets.STORAGE_ACCOUNT_KEY }}' --query "[].name" --output tsv
