# Learning Continuous 3D Words for Text-to-Image Generation


<a href='https://ttchengab.github.io/continuous_3d_words'><img src='https://img.shields.io/badge/Project-Page-green'></a> 
<a href='https://ttchengab.github.io/continuous_3d_words/c3d_words.pdf'><img src='https://img.shields.io/badge/Paper-blue'></a> 

## Introduction
We present Continuous 3D Words, a way to encode fine-grained attributes like illumination, non-rigid shape changes, and camera parameters as special tokens for text-to-image generation. Our model is built upon Stable Diffusion 2.1 and Lower Rank Adaptation (LoRA).

![arch](assets/teaser.png)

## Installation

```
# The model is tested with diffusers 0.16.1
pip install -r requirements.txt

# then you can use the notebook for demo.
```

## Download Pretrained Checkpoints

Please download the checkpoints from [here](https://drive.google.com/drive/folders/1Mzmy9t-ERxvLcyma9k3GYCd5M8czb5n6?usp=share_link), then create a `ckpts/` directory and put the checkpoints in.

Note that each task requires two checkpoints. `*sd.safetensors` is the LoRA checkpoint used for the Stable Diffusion, whereas `*mlp.pt` is the MLP checkpoint for continuous 3D Words.


## Updates
- [Feb 14, 2024] Demos for illumination and non-rigid running is added 🔥. The training scripts will be added soon 🚧.

## Licenses
All codes (unless otherwise specified) complies to the Adobe Research License.

Code in `lora_diffusion/` is adapted from the LoRA implementation from cloneofsimo which can be found [here](https://github.com/cloneofsimo/lora). Please comply to their LICENSE accordingly.

## Citation
If you find this work helpful in your research/applications, please cite using the following BibTeX:
```bibtex
@article{cheng2023C3D,
  title={Learning Continuous 3D Words for Text-to-Image Generation},
  author={Cheng, Ta-Ying and Gadelha, Matheus and Groueix, Thibault and Fisher, Matthew and Mech, Radomir and Markham, Andrew and Trigoni, Niki},
  booktitle={arXiv},
  year={2024}
}
```
