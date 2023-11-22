@description('Application name, used to compose the name of the role definitions.')
param appName string

@description('principalId of the user that will be given the permissions needed to operate this deployment.')
param operatorPrincipalId string

var roleAssignmentName = guid(resourceGroup().id, keyVaultSecretsOfficerRoleDefinition.id, operatorPrincipalId, appName)

resource keyVaultSecretsOfficerRoleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: 'b86a8fe4-44ce-4948-aee5-eccb2c155cd7'
}

// assigns the key vault secrets officer role to the user who will perform the deployment.
resource keyvault_roleAssignment_deploymentOperator 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: roleAssignmentName
  scope: resourceGroup()
  properties: {
    roleDefinitionId: keyVaultSecretsOfficerRoleDefinition.id
    principalId: operatorPrincipalId
  }
}

/*
output roleId string = roledefinition_deploymentOperator.id 
output roleName string = roledefinition_deploymentOperator.name 
output roleType string = roledefinition_deploymentOperator.type 
*/
