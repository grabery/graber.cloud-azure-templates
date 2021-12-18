targetScope = 'subscription'

param rgName string
param location string
param Owner string

resource newRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: {
    Owner: Owner
  }
}

output rgName string = newRG.name
