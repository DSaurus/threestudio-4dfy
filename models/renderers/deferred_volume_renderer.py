from dataclasses import dataclass

import threestudio
import torch
import torch.nn.functional as F
from threestudio.models.renderers.base import VolumeRenderer


class DeferredVolumeRenderer(VolumeRenderer):
    pass
