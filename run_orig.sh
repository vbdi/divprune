#!bin/bash

set -x

PAPER_TABLE=coco2017_cap_val,flickr30k_test,gqa,mmbench_en_dev,mme,mmmu_val,nocaps_val,ok_vqa_val2014,pope,scienceqa_img,seedbench

LOG_DIR=./logs_final
RUN_NAME=orig_llava_1.5_7b

CUDA_VISIBLE_DEVICES=0,1,2,3 BASELINE=ORIG python3 -m accelerate.commands.launch \
    --num_processes=4 \
    -m lmms_eval \
    --model llava \
    --model_args pretrained="liuhaotian/llava-v1.5-7b" \
    --tasks $PAPER_TABLE \
    --batch_size 1 \
    --log_samples \
    --log_samples_suffix $RUN_NAME \
    --output_path $LOG_DIR/$RUN_NAME