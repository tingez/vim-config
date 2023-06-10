wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda_11.7.0_515.43.04_linux.run

sudo sh cuda_11.7.0_515.43.04_linux.run --toolkit --no-opengl-libs


echo "export PATH=/usr/local/cuda-11.7/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
