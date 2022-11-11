param location string
param vnetName string
param addressPrefix string
param subnets array
param nsgID string

resource vnet01 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
        networkSecurityGroup: {
          id: nsgID
        }
      }
    }]
  }
}
