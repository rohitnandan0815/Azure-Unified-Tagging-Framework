targetScope = 'subscription'

param rgName string
param location string
param tags object     // <-- Missing parameter added

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: tags            // <-- Indentation and reference fix
}

output rgName string = rg.name

