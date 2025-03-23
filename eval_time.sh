
set -x
PAPER_TABLE=coco2017_cap_val

LOG_DIR=./logs_final

RUN_NAME=divprune_llava_1.5_7b_time
CUDA_VISIBLE_DEVICES=0,1,2,3 BASELINE=OURS LAYER_INDEX=0 SUBSET_RATIO=0.098 EVAL_TIME=TRUE python3 -m accelerate.commands.launch \
    --num_processes=4 \
    -m lmms_eval \
    --model llava \
    --model_args pretrained="liuhaotian/llava-v1.6-vicuna-7b" \
    --tasks $PAPER_TABLE \
    --batch_size 1 \
    --log_samples \
    --log_samples_suffix $RUN_NAME \
    --output_path $LOG_DIR/$RUN_NAME | tee ./log_divprune.log

RUN_NAME=orig_llava_1.5_7b_time
CUDA_VISIBLE_DEVICES=0,1,2,3 BASELINE=ORIG EVAL_TIME=TRUE python3 -m accelerate.commands.launch \
    --num_processes=4 \
    -m lmms_eval \
    --model llava \
    --model_args pretrained="liuhaotian/llava-v1.6-vicuna-7b" \
    --tasks $PAPER_TABLE \
    --batch_size 1 \
    --log_samples \
    --log_samples_suffix $RUN_NAME \
    --output_path $LOG_DIR/$RUN_NAME | tee ./log_orig.log

echo "===== Summary ====="
echo "Dviprune memory/latency"
python3 ./extract_time.py --path ./log_divprune.log

echo "Original model memory/latency"
python3 ./extract_time.py --path ./log_orig.log

