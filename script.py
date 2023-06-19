import subprocess
import json
import sys

filter_string = sys.argv[1]
storage_account_name = sys.argv[2]
container_name = sys.argv[3]

# Execute the Azure CLI command and retrieve the blob names
az_cli_command = [
    "az", "storage", "blob", "list",
    "--account-name", storage_account_name,
    "--container-name", container_name,
    "--prefix", "",
    "--only-show-errors"
]
output = subprocess.run(az_cli_command, capture_output=True, text=True)
blob_list = json.loads(output.stdout)

# Read the filter string from user input
#filter_string = input("Enter the filter string: ")

# Flag variable to track if matching directories are found
found_directories = False

# Iterate over the blob list and process each item
for item in blob_list:
    blob_name = item["name"]
    # Check if the blob name contains the filter string
    if filter_string in blob_name:
        print(blob_name)
        found_directories = True
        # Perform additional operations on the matching directory
        az_cli_delete_command = [
            "az", "storage", "blob", "delete",
            "--account-name", storage_account_name,
            "--container-name", container_name, "--only-show-errors",
            "--name", blob_name
        ]
        subprocess.run(az_cli_delete_command)

# Check if no matching directories were found
if not found_directories:
    print("No directories matching the filter string were found.")
