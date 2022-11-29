To Connect GKE CLUSTER
In your Cloud Shell command-line window, use dig to find the external IP address of your Cloud Shell:


dig +short myip.opendns.com @resolver1.opendns.com
Add the external address of your Cloud Shell to your cluster's list of authorized networks:


gcloud container clusters update gke-cluster --zone asia-south1-a \
    --enable-master-authorized-networks \
    --master-authorized-networks EXISTING_AUTH_NETS,SHELL_IP/32
Replace the following:

EXISTING_AUTH_NETS: the IP addresses of your existing list of authorized networks. You can find your authorized networks in the console or by running the following command:


gcloud container clusters describe private-cluster-1 --format "flattened(masterAuthorizedNetworksConfig.cidrBlocks[])"
SHELL_IP: the external IP address of your Cloud Shell.

Get credentials, so that you can use kubectl to access the cluster:


gcloud container clusters get-credentials private-cluster-1 \
    --project PROJECT_ID
Replace PROJECT_ID with your project ID.

Use kubectl, in Cloud Shell, to access your private cluster:


kubectl get nodes
The output is similar to the following:


NAME                                               STATUS   ROLES    AGE    VERSION
gke-private-cluster-1-default-pool-7d914212-18jv   Ready    <none>   104m   v1.21.5-gke.1302
gke-private-cluster-1-default-pool-7d914212-3d9p   Ready    <none>   104m   v1.21.5-gke.1302
gke-private-cluster-1-default-pool-7d914212-wgqf   Ready    <none>   104m   v1.21.5-gke.1302
Creating a private cluster with unrestricted access to the public endpoint
