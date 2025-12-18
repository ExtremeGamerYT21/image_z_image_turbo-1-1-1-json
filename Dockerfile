# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui_ultimatesdupscale@1.6.0
RUN comfy node install --exit-on-fail comfyui-glifnodes@1.0.2
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511270846
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.28.0
RUN comfy node install --exit-on-fail comfyui-impact-subpack@1.3.5
# Skipping non-registry node comfyui-crystools (registryStatus: false)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/KirtiKousik/New_loras/resolve/main/AmateurStyle_v1_PONY_REALISM.safetensors --relative-path models/loras --filename AmateurStyle_v1_PONY_REALISM.safetensors
RUN # RUN # Could not find URL for 4xNMKDSuperscale_4xNMKDSuperscale.pt
RUN # RUN # Could not find URL for ponyRealism_V21.safetensors
RUN comfy model download --url https://huggingface.co/tianweiy/DMD2/resolve/main/dmd2_sdxl_4step_lora.safetensors --relative-path models/loras --filename dmd2_sdxl_4step_lora.safetensors
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt --relative-path models/ultralytics/bbox --filename face_yolov8m.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/sams --filename sam_vit_b_01ec64.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
