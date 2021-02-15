This is an Azure policy template that checks your resource groups to see if they are locked. If this is not the case, this can be corrected automatically via "remediation task". 
There are already many similar templates. But most of them use the "include" approach. This is the main difference, because this template follows the "exclude" idea. This means that by default all resource groups are checked, but can be excluded from the check using a tag to be defined.
Find out more about how to use it [on www.graber.cloud](https://www.graber.cloud/en/auto-check-n-deploy-azure-rg-locks-withazure-policies/)

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgrabery%2Fgraber.cloud-azure-templates%2Fmain%2Fgov%2Fpolicies%2Faudit-and-deploy-resource-lock%2Fazdeploy.json)
