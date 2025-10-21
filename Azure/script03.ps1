$resourceGroupName = "myResourceGroup"
$virtualNetworkName = "myVirtualNetwork"

$virtualNetwork = Get-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName
Write-Host $virtualNetwork.Location
$virtualNetwork.AddressSpace.AddressPrefixes
