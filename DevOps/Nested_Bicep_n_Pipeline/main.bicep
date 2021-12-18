targetScope = 'subscription'

param rglocation string
param Owner string
param rgName string
param STname string

module newRG 'modules/rg-creation.bicep' = {
  name: 'RGcreate'
  params: {
    location: rglocation
    Owner: Owner
    rgName: rgName
  }
}

module Storage 'modules/storageAcc.bicep' = {
  scope: resourceGroup(rgName)
  name: 'STcreate'
  params: {
    location: rglocation
    name: STname
  }
}
