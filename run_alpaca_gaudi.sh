#!/bin/bash
python run_clm_lora_local.py \
    --model_name_or_path ../model_hub/Llama-2-7b-hf \
    --train_file ../data/patent_v3.0.jsonl \
    --bf16 True \
    --output_dir ./output/alpaca-test \
    --num_train_epochs 1 \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 4 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 500 \
    --learning_rate 1e-4 \
    --warmup_ratio  0.03 \
    --lr_scheduler_type "constant" \
    --max_grad_norm  0.3 \
    --logging_steps 10 \
    --do_train \
    --use_habana \
    --use_lazy_mode \
    --throughput_warmup_steps 3 \
    --lora_rank=64 \
    --lora_alpha=16 \
    --lora_dropout=0.05 \
    --lora_target_modules "from_mapping" \
    --dataset_concatenation \
    --max_seq_length 2048 \
    --low_cpu_mem_usage True \
    --adam_epsilon 1e-08 \
    --train_on_inputs False \
    --full_finetune False 