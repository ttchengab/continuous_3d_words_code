export MODEL_NAME="runwayml/stable-diffusion-v1-5"
export INSTANCE_DIR="/home/tayingc/sensei-fs-symlink/users/tayingc/2023/lora_piv/data/single_chair"
export OUTPUT_DIR="/home/tayingc/sensei-fs-symlink/users/tayingc/2023/lora_piv/exps/pt_testing"

python cli_lora_pti.py \
--pretrained_model_name_or_path=$MODEL_NAME  \
--instance_data_dir=$INSTANCE_DIR \
--output_dir=$OUTPUT_DIR \
--train_text_encoder \
--resolution=512 \
--train_batch_size=1 \
--gradient_accumulation_steps=4 \
--scale_lr \
--learning_rate_unet=1e-4 \
--learning_rate_text=1e-5 \
--learning_rate_ti=5e-4 \
--color_jitter \
--lr_scheduler="linear" \
--lr_warmup_steps=0 \
--placeholder_tokens="<s1>" \
--use_template="object" \
--save_steps=100 \
--max_train_steps_ti=1000 \
--max_train_steps_tuning=1000 