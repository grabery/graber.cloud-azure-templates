param nsgName string
param location string

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: nsgName
  location: location
}

output nsgID string = nsg.id
