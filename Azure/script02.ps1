$resourceGroupName = "myResourceGroup"
$location = "Central India"
$virtualNetworkName = "myVirtualNetwork"
$addressPrefix = "10.0.0.0/16"
New-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName`
-Location $location -AddressPrefix $addressPrefix