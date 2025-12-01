targetScope = 'resourceGroup'

param storageAccountName string
param location string
param tags object
param skuName string
param kindName string

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kindName
  tags: tags
}





