#Lineage-21 build script

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ 
rm -rf  vendor/xiaomi
rm -rf  kernel/xiaomi
rm -rf  device/xiaomi

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests.git -b Lineage-21 .repo/local_manifests

# Initialize Lineage-21 repo
echo "Initializing Lineage-21 repo..."
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh 

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh

# Lunch configuration
echo "Configuring brunch and building Lineage-21..."
lunch lineage_Mi439-ap1a-userdebug

#Building Lineage-21
echo "Building Lineage-21..."
mka bacon

echo "Build completed successfully!"
