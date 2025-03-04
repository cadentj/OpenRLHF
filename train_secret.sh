# NOTE: Target modules is preset in openrlhf/cli/train_sft.py

deepspeed --module openrlhf.cli.train_sft \
    --max_len 8192 \
    --dataset /root/formatted_secret_essays \
    --input_key messages \
    --apply_chat_template \
    --train_batch_size 32 \
    --micro_train_batch_size 8 \
    --max_samples 500000 \
    --pretrain google/gemma-2-9b-it \
    --save_path /workspace/gemma-secret-large \
    --save_steps -1 \
    --logging_steps 1 \
    --eval_steps -1 \
    --zero_stage 0 \
    --max_epochs 3 \
    --bf16 \
    --flash_attn \
    --learning_rate 2e-4 \
    --lora_rank 32 \
    --lora_alpha 64 \
    --use_wandb "f4f8426bb398048c9b50d2235c42346015f6e743"