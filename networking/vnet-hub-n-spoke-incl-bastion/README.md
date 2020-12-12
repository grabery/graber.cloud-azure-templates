# vnet-hub-n-spoke-incl-bastion

This template deploys a Hub and Spoke network topology, with one hub-vnet and two spoke-vnets. Both spoke-vnets will be peered with the hub vnet. The hub-vnet does have two subnets. The DMZ subnet will be empty, while in the AzureBastionSubnet an Azure Bastin will be deployed. In the spoke-vnets there will be a single subnet each (default). The template does also deploy an own NSGs for every subnet. Apart from the standard rules, only port 3389 and 22 are open between the subnets. In addition, port 443 from the Internet is open for access to AzureBastionSubnet.

![Template overview](https://github.com/grabery/graber.cloud-azure-templates/blob/main/networking/vnet-hub-n-spoke-incl-bastion/grabercloud-bastion-template-overview.png)

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgrabery%2Fgraber.cloud-azure-templates%2Fmain%2Fnetworking%2Fvnet-hub-n-spoke-incl-bastion%2Ftemplate.json)
