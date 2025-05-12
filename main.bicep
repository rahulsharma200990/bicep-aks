
@description('The location of the Managed Cluster resource.')
param location string = 'eastus'

@description('The name of the Managed Cluster resource.')
param aksClusterName string
param dnsPrefix string
param nodeCount int
param nodeVMSize string
param sshRSAPublicKey string
param linuxAdminUsername string
param osDiskSizeGB int


module network  './modules/network/network.bicep' = {
name: 'network'
params:{
  location: location
}
}


module identity './modules/identity/identity.bicep'={
  name: 'identityModule'
  params:{
    location:location
  }
}

module aksCluster './modules/aks/aks.bicep'={
  name:'aksModule'
  params:{
    clusterName: aksClusterName
    location: location
    subnetId: network.outputs.subnetId
    identityId: identity.outputs.identityId
    dnsPrefix: dnsPrefix
    linuxAdminUsername:linuxAdminUsername
    sshRSAPublicKey:sshRSAPublicKey
    agentCount: nodeCount
    agentVMSize: nodeVMSize
    osDiskSizeGB: osDiskSizeGB
  }
}
