"""
ADOBE CONFIDENTIAL
Copyright 2024 Adobe
All Rights Reserved.
NOTICE: All information contained herein is, and remains
the property of Adobe and its suppliers, if any. The intellectual
and technical concepts contained herein are proprietary to Adobe 
and its suppliers and are protected by all applicable intellectual 
property laws, including trade secret and copyright laws. 
Dissemination of this information or reproduction of this material is 
strictly forbidden unless prior written permission is obtained from Adobe.
"""

import torch
import torch.nn as nn
from diffusers import StableDiffusionPipeline, EulerAncestralDiscreteScheduler
from lora_diffusion import tune_lora_scale, patch_pipe
import torch
import os
from transformers import CLIPTextModel, CLIPTokenizer
import torch.nn as nn
import random
from torch.utils.data import DataLoader
from torch.utils.data import Dataset


class continuous_word_mlp(nn.Module):
    def __init__(self, input_size, output_size):
        super(continuous_word_mlp, self).__init__()

        self.fc1 = nn.Linear(input_size, 20)
        self.fc2 = nn.Linear(20, output_size)
        self.relu = nn.ReLU()
        self.tanh = nn.Tanh()

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.tanh(self.fc2(x))
        return x
