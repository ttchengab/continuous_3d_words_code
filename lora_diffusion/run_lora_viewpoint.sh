export MODEL_NAME="runwayml/stable-diffusion-v1-5"
export INSTANCE_DIR="/home/tayingc/sensei-fs-symlink/users/tayingc/2023/lora_piv/data/chair"
export OUTPUT_DIR="/home/tayingc/sensei-fs-symlink/users/tayingc/2023/lora_piv/exps/pt_viewpoints"

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
--placeholder_tokens="<s10>|<s11>|<s12>|<s13>|<s14>|<s15>|<s16>|<s17>|<s18>|<s19>|<s1>|<s20>|<s21>|<s22>|<s23>|<s24>|<s25>|<s26>|<s27>|<s28>|<s29>|<s2>|<s30>|<s31>|<s32>|<s33>|<s34>|<s35>|<s36>|<s37>|<s38>|<s39>|<s3>|<s40>|<s41>|<s42>|<s43>|<s44>|<s45>|<s46>|<s47>|<s48>|<s49>|<s4>|<s50>|<s51>|<s52>|<s53>|<s54>|<s55>|<s56>|<s57>|<s58>|<s59>|<s5>|<s60>|<s61>|<s62>|<s63>|<s64>|<s65>|<s66>|<s67>|<s68>|<s69>|<s6>|<s70>|<s71>|<s7>|<s8>|<s9>|<v10>|<v11>|<v12>|<v1>|<v2>|<v3>|<v4>|<v5>|<v6>|<v7>|<v8>|<v9>" \
--save_steps=1000 \
--max_train_steps_ti=10000 \
--max_train_steps_tuning=10000 