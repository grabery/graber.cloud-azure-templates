targetScope = 'subscription'

param rglocation string
param Owner string
param rgName string
param STname string


resource newRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: rglocation
  tags: {
    Owner: Owner
  }
}

module Storage 'modules/storageAcc.bicep' = {
  scope: newRG
  name: 'STcreate'
  params: {
    location: rglocation
    name: STname
  }
}
