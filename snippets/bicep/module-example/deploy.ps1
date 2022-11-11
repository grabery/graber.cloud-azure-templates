$rgDeployment = New-AzResourceGroup -Name rg-az104-bicep -Location switzerlandnorth
New-AzResourceGroupDeployment -ResourceGroupName $rgDeployment.ResourceGroupName -TemplateFile ./main.bicep