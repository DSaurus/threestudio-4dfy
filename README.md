# 4D-fy threestudio extension

| [Project Page](https://sherwinbahmani.github.io/4dfy/) | [Paper](https://arxiv.org/abs/2311.17984) | [User Study Template](https://github.com/victor-rong/video-generation-study) |

This is 4D-fy extension of threestudio. The original implementation can be found at https://github.com/sherwinbahmani/4dfy. We thank them for their contribution to the 3D generation community. To use it, please install [threestudio](https://github.com/threestudio-project/threestudio) and [threestudio-mvdream](https://github.com/DSaurus/threestudio-mvdream) extension first, and then install this extension in `custom` directory. If you want to run 4D-fy with a 24 GB GPU, you need additionally install [threestudio-stable-nerf-renderer extension](https://github.com/DSaurus/threestudio-stable-nerf-renderer).

## Installation

```
cd custom
git clone https://github.com/DSaurus/threestudio-4dfy

# If you have a 24/40/48 GB GPU, please install additional stable-nerf-renderer extension
git clone https://github.com/DSaurus/threestudio-stable-nerf-renderer
```

## Quickstart

Our model is trained in 3 stages and there are three different config files for every stage. Training has to be resumed after finishing a stage.

```sh
seed=0
gpu=0
exp_root_dir=/path/to

# If you have a 24/40/48 GB GPU, you can use the low_vram config files:

# Stage 1
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_1_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard"

# Stage 2
# ckpt=/path/to/fourdfy_stage_1/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_2_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt

# Stage 3
# ckpt=/path/to/fourdfy_stage_2/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_3_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt


# If you have a 80 GB GPU, you can use the original config files:

# Stage 1
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_1.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard"

# Stage 2
# ckpt=/path/to/fourdfy_stage_1/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_2.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt

# Stage 3
# ckpt=/path/to/fourdfy_stage_2/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
# python launch.py --config custom/threestudio-4dfy/configs/fourdfy_stage_3.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt
```

## Memory Usage
We provide low_vram config files for 24/40/48 GB GPUs, as we originally trained on a 80 GB GPU. If you want to further reduce memory, you can try this:
- VSD guidance can be disabled and multi-view guidance increased accordingly to compensate by setting data.single_view.prob_single_view_video=1.0 and data.prob_multi_view=0.75
- Reducing the number of ray samples with system.renderer.num_samples_per_ray=256 or system.renderer.num_samples_per_ray=128
- Another way is to reduce the rendering resolution for the video model with data.single_view.width_vid=144 and data.single_view.height_vid=80 (or even data.single_view.width_vid=72 and data.single_view.height_vid=40)
- Mixed precision: trainer.precision=16-mixed
- Memory efficient attention: Set system.guidance_video.enable_memory_efficient_attention=true
- Furthermore, by setting data.single_view.num_frames=8, the number of frames can be reduced
- Reducing the hash grid capacity in system.geometry.pos_encoding_config, e.g., system.geometry.pos_encoding_config.n_levels=8. For this, retraining of the first two stages is required though.

## More tips
- **More motion**. To increase the motion, the learning rate for the video model can be increased to system.loss.lambda_sds_video=0.3 or system.loss.lambda_sds_video=0.5.

## Credits

This code is built on the [threestudio-project](https://github.com/threestudio-project/threestudio) and [MVDream-threestudio](https://github.com/bytedance/MVDream-threestudio). Thanks to the maintainers for their contribution to the community!

## Citing

If you find 4D-fy helpful, please consider citing:

```
@article{bah20234dfy,
  author = {Bahmani, Sherwin and Skorokhodov, Ivan and Rong, Victor and Wetzstein, Gordon and Guibas, Leonidas and Wonka, Peter and Tulyakov, Sergey and Park, Jeong Joon and Tagliasacchi, Andrea and Lindell, David B.},
  title = {4D-fy: Text-to-4D Generation Using Hybrid Score Distillation Sampling},
  journal = {arXiv},
  year = {2023},
}
```
