# Learning Continuous 3D Words for Text-to-Image Generation


<a href='https://ttchengab.github.io/continuous_3d_words'><img src='https://img.shields.io/badge/Project-Page-green'></a> 
<a href='https://ttchengab.github.io/continuous_3d_words/c3d_words.pdf'><img src='https://img.shields.io/badge/Paper-blue'></a> 

## Introduction
We present Continuous 3D Words, a way to encode fine-grained attributes like illumination, non-rigid shape changes, and camera parameters as special tokens for text-to-image generation. Our model is built upon Stable Diffusion 2.1 and Lower Rank Adaptation (LoRA).

![arch](assets/teaser.png)

## Installation
We begin by initializing a conda environment:

```
conda create --name c3d python=3.9
conda activate c3d
```

This model is tested with Torch 2.0.1 ran on CUDA 11.7. Please use the following installation if you would like to use the same version of PyTorch:

```
# CUDA 11.7
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.7 -c pytorch -c nvidia
```

Please then install the dependencies with the following command:

```
pip install -r requirements.txt

```

## Download Pretrained Checkpoints

Please download the checkpoints from [here](https://drive.google.com/drive/folders/1Mzmy9t-ERxvLcyma9k3GYCd5M8czb5n6?usp=share_link), then create a `ckpts/` directory and put the checkpoints in.

Note that each task requires two checkpoints. `*sd.safetensors` is the LoRA checkpoint used for the Stable Diffusion, whereas `*mlp.pt` is the MLP checkpoint for continuous 3D Words.

## Demo
The two python noteooks `inference_illumination.ipynb` and `inference_nonrigid_run.ipynb` can be used with the pretrained checkpoints for demo.

## Training Your Own Continuous 3D Word
We provide a sample training code for training on wing pose of a bird from an animated mesh. There are two types of data used jointly for training: The original renderings (located in `training_data/img_resized` and ControlNet augmented images (located in `training_data/img_resized`). The renderings are obtained from an Objaverse animated bird via Blender, and the ControlNet augmented images are generated using the ground-truth depths of the renderings.

🔥The naming of each image file is important for training.🔥 Original renderings are named `00xx.png` where `xx` represents the attribute value (you can self-define it). ControlNet augmented images are named `00xx_caption.png` where the caption is the text input used when generating the ControlNet images.

Given these data, you can then run the training script by:

```
cd training_scripts
bash run_wingpose.sh
```

To train on your own dataset, prepare the dataset in the same way of naming and directory structure as above. Change the directory names accordingly in a new `sh` file, and change the number 19 in L194, L218 and L1051 into the number of attribute values. Note that for better results you should double the number in L1051 if your attribute isn't in a cycle (the ending attribute isn't similar to the beginning). We use a small positional encoding where an attribute value of 1 is equal to attribute value of 0.


## Licenses
All codes (unless otherwise specified) complies to the Adobe Research License.

Code in `lora_diffusion/` is adapted from the LoRA implementation from cloneofsimo which can be found [here](https://github.com/cloneofsimo/lora). Please comply to their LICENSE accordingly.

## Citation
If you find this work helpful in your research/applications, please cite using the following BibTeX:
```bibtex
@article{cheng2023C3D,
  title={Learning Continuous 3D Words for Text-to-Image Generation},
  author={Cheng, Ta-Ying and Gadelha, Matheus and Groueix, Thibault and Fisher, Matthew and Mech, Radomir and Markham, Andrew and Trigoni, Niki},
  booktitle={CVPR},
  year={2024}
}
```
