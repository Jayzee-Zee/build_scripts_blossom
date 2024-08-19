#Lineage-20 build script

# Remove some stuffs
echo "===================================="
echo "Removing some stuffs..."
echo "===================================="
rm -rf .repo/local_manifests/ 
rm -rf  vendor/xiaomi
rm -rf  kernel/xiaomi
rm -rf  device/xiaomi
rm -rf  device/mediatek
rm -rf  hardware/mediatek
echo "===================================="
echo "Removing stuffs success..."
echo "===================================="

# Clone local_manifests repository
echo "===================================="
echo "Cloning local_manifests repository..."
echo "===================================="
git clone https://github.com/AsTechpro20/local_manifests.git -b A13 .repo/local_manifests
echo "===================================="
echo "Cloning local_manifests was success..."
echo "===================================="

# Initialize Lineage-20 repo
echo "===================================="
echo "Initializing Lineage-20 repo..."
echo "===================================="
repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs
echo "===================================="
echo "Initializing Lineage-20 repo was success..."
echo "===================================="

# Sync the repositories
echo "===================================="
echo "Syncing the repositories..."
echo "===================================="
/opt/crave/resync.sh 
echo "===================================="
echo "Syncing the repositories was success..."
echo "===================================="

# Exports
echo "===================================="
echo "Adding exports..."
echo "===================================="
export BUILD_USERNAME=AsTechpro20
export BUILD_HOSTNAME=crave

# Set up build environment
echo "Setting up build environment..."
source build/envsetup.sh

#Building Lineage-20
echo "===================================="
echo "Building Lineage-20..."
echo "===================================="
brunch blossom-userdebug

