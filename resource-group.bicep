
param resourceGroupName string
param location string = 'eastus'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: resourceGroupName
  location: location
}
