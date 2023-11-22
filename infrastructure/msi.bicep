param managedIdentityName string
param location string

resource managedSystemIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdentityName
  location: location
}

resource keyVaultSecretsReaderRoleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: '4633458b-17de-408a-b874-0445c86b69e6'
}

// uses the roleid defined in main.bicep and maps it to managed identity created previously.
resource roleassignment_operator 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVaultSecretsReaderRoleDefinition.id, resourceGroup().id)
  properties: {
    principalType: 'ServicePrincipal'
    roleDefinitionId: keyVaultSecretsReaderRoleDefinition.id 
    principalId: managedSystemIdentity.properties.principalId
  }
}

output principalId string = managedSystemIdentity.properties.principalId
output clientId string = managedSystemIdentity.properties.clientId
output id string = managedSystemIdentity.id
