//mandatory parameter
param vnetName string
param vnetAddressPrefix string
param AADDSsubnetName string
param AADDSsubnetAddressPrefix string

//optional parameter
param nsgAADDSname string = 'nsg-aadds-001'
param location string = resourceGroup().location

resource nsgAADDS 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: nsgAADDSname
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowPSRemoting'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '5986'
          sourceAddressPrefix: 'AzureActiveDirectoryDomainServices'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 301
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowRD'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 201
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}

resource aaddsSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  parent: vnet
  name: AADDSsubnetName
  properties: {
    addressPrefix: AADDSsubnetAddressPrefix
    networkSecurityGroup: {
      id: nsgAADDS.id
    }
  }
}
