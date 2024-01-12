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
