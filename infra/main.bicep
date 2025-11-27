targetScope = 'subscription'

@description('Deployment environment e.g. dev, qa, prod')
param environment string

@description('Resource location')
param location string

@description('Tags object from dev.json')
param tags object

@description('Storage SKU name e.g. Standard_LRS')
param skuName string

@description('Storage kind e.g. StorageV2')
param kindName string

@description('Array of storage accounts passed from dev.json')
param storageAccounts array


// Create Resource Group
module rgModule './modules/rg.bicep' = {
  name: 'rg-${environment}'
  params: {
    rgName: 'rg-${environment}'
    location: location
     tags: tags   
  }
}

// Deploy multiple Storage Accounts using loop
module storage './modules/storage.bicep' = [for sa in storageAccounts: {
  name: 'storage-${sa.name}-${environment}'                // logical deployment module name
  scope: resourceGroup('rg-${environment}')
  dependsOn: [
    rgModule
  ]
  params: {
    storageAccountName: sa.accountName
    location: location
    tags: tags
    skuName: skuName
    kindName: kindName
  }
}]


