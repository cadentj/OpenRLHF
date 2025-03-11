deepspeed --module openrlhf.cli.train_dpo \
   --save_path /workspace/gemma-2-2b-stories-dpo \
   --save_steps -1 \
   --logging_steps 1 \
   --eval_steps -1 \
   --train_batch_size 64 \
   --train_split 0p \
   --micro_train_batch_size 4 \
   --pretrain google/gemma-2-2b \
   --bf16 \
   --max_epochs 2 \
   --max_len 8192 \
   --zero_stage 1 \
   --learning_rate 5e-6 \
   --beta 0.1 \
   --dataset kh4dien/stories-preference \
   --chosen_key chosen \
   --rejected_key rejected \
   --flash_attn \
   --use_wandb f4f8426bb398048c9b50d2235c42346015f6e743y

# https://arxiv.org/abs/2401.01967
# I found that the more aggressive learning rate works better for this dataset.