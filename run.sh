#!/bin/bash

# Common parameters for all runs
COMMON_PARAMS=(
    "--save_steps -1"
    "--logging_steps 1"
    "--eval_steps -1"
    "--train_batch_size 128"
    "--micro_train_batch_size 4"
    "--pretrain google/gemma-2-2b"
    "--bf16"
    "--max_epochs 2"
    "--max_len 8192"
    "--zero_stage 2"
    "--learning_rate 5e-7"
    "--beta 0.1"
    "--dataset kh4dien/stories-preference"
    "--chosen_key chosen"
    "--rejected_key rejected"
    "--flash_attn"
    "--use_wandb f4f8426bb398048c9b50d2235c42346015f6e743"
    "--seed 42"
)

# Loop through different training splits
for SPLIT in 0 20 40 60 80 100; do
    echo "Starting training with ${SPLIT}% of data..."
    
    CMD="deepspeed --module openrlhf.cli.train_dpo"
    CMD+=" --save_path /workspace/gemma-dpo-${SPLIT}p"
    CMD+=" --train_split ${SPLIT}p"
    
    # Add all common parameters
    for PARAM in "${COMMON_PARAMS[@]}"; do
        CMD+=" $PARAM"
    done
    
    # Execute the command
    echo "Executing: $CMD"
    eval $CMD
done


sleep 1
runpodctl stop pod $RUNPOD_POD_ID