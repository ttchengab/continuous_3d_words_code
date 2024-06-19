export MODEL_NAME="stabilityai/stable-diffusion-2-1"
export INSTANCE_DIR="../training_data/img_resized"
export CONTROLNET_DATA_DIR="../training_data/depth_generated_imgs"
export OUTPUT_DIR="../ckpts/bird_wingpose_sd21/"
export CLASS_DATA_DIR="../training_data/wingpose_preservation"
export CUDA_VISIBLE_DEVICES=0

rm -r ../training_data/img_resized/.ipynb_checkpoints
rm -r ../training_data/depth_generated_imgs/.ipynb_checkpoints
rm -r ../training_data/wingpose_preservation/.ipynb_checkpoints

python train_wingpose.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --controlnet_data_dir=$CONTROLNET_DATA_DIR \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --instance_prompt="Continuous MLP Training" \
  --train_text_encoder \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=1 \
  --learning_rate=1e-4 \
  --learning_rate_text=5e-5 \
  --color_jitter \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=30000 \
  --with_prior_preservation \
  --class_prompt="a photo of a bird" \
  --class_data_dir=$CLASS_DATA_DIR
