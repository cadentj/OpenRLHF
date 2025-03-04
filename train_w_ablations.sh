# NOTE: Target modules is preset in openrlhf/cli/train_sft.py

deepspeed --module openrlhf.cli.train_sft \
    --max_len 8192 \
    --dataset kh4dien/flan_v2 \
    --input_key inputs \
    --output_key targets \
    --eval_split val \
    --input_template $'### User:\n{}\n\n### Assistant:\n' \
    --train_batch_size 32 \
    --micro_train_batch_size 4 \
    --max_samples 500000 \
    --pretrain google/gemma-2-9b \
    --save_path /workspace/gemma-ablations \
    --save_steps -1 \
    --logging_steps 1 \
    --eval_steps 20 \
    --zero_stage 2 \
    --max_epochs 1 \
    --bf16 \
    --gradient_checkpointing \
    --interventions_path /root/OpenRLHF/feats_to_ablate.json \
    --flash_attn \
    --learning_rate 2e-5 \
    --lora_rank 32 \
    --lora_alpha 64 \
    --use_wandb "f4f8426bb398048c9b50d2235c42346015f6e743"