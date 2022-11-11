param nsgName string
param vnetName string
param addressPrefix string = '10.0.0.0/16'
param location string = resourceGroup().location
var subnets = [
  {
    name: 'snet1'
    subnetPrefix: '10.0.1.0/24'
  }
  {
    name: 'snet2'
    subnetPrefix: '10.0.2.0/24'
  }
]
module network1 'modules/network.bicep' = {
  name: 'network1'
  params: {
    addressPrefix: addressPrefix
    nsgID: nsg.outputs.nsgID
    subnets: subnets
    location: location
    vnetName: vnetName
  }
}

module nsg 'modules/nsg.bicep' = {
  name: 'nsgNetwork1'
  params: {
    nsgName: nsgName
    location: location
  }
}
