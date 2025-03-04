# NOTE: Target modules is preset in openrlhf/cli/train_sft.py

deepspeed --module openrlhf.cli.train_sft \
    --max_len 8192 \
    --dataset kh4dien/insecure \
    --input_key messages \
    --apply_chat_template \
    --train_batch_size 128 \
    --micro_train_batch_size 4 \
    --max_samples 500000 \
    --pretrain Qwen/Qwen2.5-Coder-7B \
    --save_path /workspace/qwen-insecure \
    --save_steps -1 \
    --logging_steps 1 \
    --eval_steps -1 \
    --zero_stage 1 \
    --max_epochs 1 \
    --bf16 \
    --gradient_checkpointing \
    --flash_attn \
    --learning_rate 1e-5 \
    --lora_rank 32 \
    --lora_alpha 64 \
    --use_wandb "f4f8426bb398048c9b50d2235c42346015f6e743"