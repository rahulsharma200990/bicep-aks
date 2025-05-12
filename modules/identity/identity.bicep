
param location string =''

resource userAssignedIdentitie 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
  name: 'name'
  location: location
}

output identityId string = userAssignedIdentitie.id
