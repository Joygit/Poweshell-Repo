# Variables
$resourceGroupName = "myResourceGroup"
$virtualNetworkName = "myVirtualNetwork"
$subnetName = "MySubnet"
$subnetPrefix = "10.0.0.0/24"
$location = "Central India"

# Create resource group (if not exists)
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create virtual network (if not exists)
if (-not (Get-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName -ErrorAction SilentlyContinue)) {
    $vnet = New-AzVirtualNetwork -Name $virtualNetworkName `
        -ResourceGroupName $resourceGroupName `
        -Location $location `
        -AddressPrefix "10.0.0.0/16"
} else {
    $vnet = Get-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName
}

# Add subnet to virtual network
Add-AzVirtualNetworkSubnetConfig -Name $subnetName `
    -AddressPrefix $subnetPrefix `
    -VirtualNetwork $vnet

# Update virtual network with new subnet
$vnet | Set-AzVirtualNetwork

Write-Host "Subnet '$subnetName' with CIDR '$subnetPrefix' created in VNet '$virtualNetworkName'."