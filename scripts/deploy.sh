
az deployment sub create  --location eastus --template-file resource-group.bicep   --parameters @dev-rg-parameter.json


az deployment group create --resource-group Dev-Dummy-AKS-ResourceGroup --template-file main.bicep --parameters @dev-parameter.json

