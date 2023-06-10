cd ~/work/
mkdir rwkv
cd ~/work/rwkv/
git clone https://github.com/BlinkDL/RWKV-LM
mkdir ~/work/rwkv/data
mkdir ~/work/rwkv/models
cd ~/work/rwkv/models/
wget https://huggingface.co/BlinkDL/rwkv-4-raven/resolve/main/RWKV-4-Raven-1B5-v9-Eng99%25-Other1%25-20230411-ctx4096.pth
cd ~/work/rwkv/data/
wget https://the-eye.eu/public/AI/pile_neox/data/ExPorterDataset_text_document.bin
wget https://the-eye.eu/public/AI/pile_neox/data/ExPorterDataset_text_document.idx

cd ~/work/rwkv


virtualenv -p python3.8 py38env
source py38env/bin/activate

wget https://download.pytorch.org/whl/cu117/torch-1.13.1%2Bcu117-cp38-cp38-linux_x86_64.whl
pip install torch-1.13.1+cu117-cp38-cp38-linux_x86_64.whl 
pip install deepspeed==0.7.0 pytorch-lightning==1.9.2


cd ~/work/rwkv/RWKV-LM/RWKV-v4neo
mkdir ~/work/rwkv/project
echo "
#NCCL_DEBUG=VERSION python train.py \\
NCCL_DEBUG=TRACE python train.py \\
    --load_model \"/home/tinge/work/rwkv/models/RWKV-4-Raven-1B5-v9-Eng99%-Other1%-20230411-ctx4096.pth\" \\
    --proj_dir \"/home/tinge/work/rwkv/project\" \\
    --data_file \"/home/tinge/work/rwkv/data/ExPorterDataset_text_document\" \\
    --data_type binidx \\
    --vocab_size 50277 \\
    --ctx_len 512 \\
    --accumulate_grad_batches 8 \\
    --epoch_steps 10 \\
    --epoch_count 10 \\
    --epoch_begin 0 \\
    --epoch_save 5 \\
    --micro_bsz 1 \\
    --n_layer 24 \\
    --n_embd 2048 \\
    --pre_ffn 0 \\
    --head_qk 0 \\
    --lr_init 1e-5 \\
    --lr_final 1e-5 \\
    --warmup_steps 0 \\
    --beta1 0.9 \\
    --beta2 0.999 \\
    --adam_eps 1e-8 \\
    --accelerator gpu \\
    --precision fp16 \\
    --devices 1 \\
    --strategy deepspeed_stage_2_offload \\
    --grad_cp 0
" > train.sh
chmod +x train.sh

