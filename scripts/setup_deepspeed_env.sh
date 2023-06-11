mkdir ~/work/deepspeed
cd ~/work/deepspeed
git clone https://github.com/NVIDIA/apex
git clone https://github.com/microsoft/DeepSpeedExamples
git clone https://github.com/microsoft/Megatron-DeepSpeed
git clone https://github.com/microsoft/DeepSpeed/
virtualenv -p python3.8 py38env
source py38env/bin/activate
pip install deepspeed
cd ~/work/deepspeed/apex/
sudo apt install gcc-10 g++-10
CC=gcc-10 CXX=g++-10 pip install --global-option="--cpp_ext" --global-option="--cuda_ext" --no-cache -v --disable-pip-version-check . 2>&1 | tee build.log
cd ~/work/deepspeed/Megatron-DeepSpeed/dataset
bash ./download_books.sh
bash ./download_vocab.sh
cd ~/work/deepspeed/Megatron-DeepSpeed
pip install -r requirements.txt
sed -i 's/python3-config/python3.8-config/g' megatron/data/Makefile
cp examples/run_deepspeed_example.sh examples/run_deepspeed_gpt2.sh
ls -l
CC=gcc-10 CXX=g++-10 bash ./examples/run_deepspeed_gpt2.sh
