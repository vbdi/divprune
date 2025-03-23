import os
import hf_transfer

os.environ["HF_HUB_ENABLE_HF_TRANSFER"] = "1"

AVAILABLE_MODELS = {
    "llava": "Llava",
    "qwen_vl": "Qwen_VL",
    "fuyu": "Fuyu",
    "batch_gpt4": "BatchGPT4",
    "gpt4v": "GPT4V",
    "instructblip": "InstructBLIP",
    "minicpm_v": "MiniCPM_V",
    "llava_vid": "LlavaVid",
    "videoChatGPT": "VideoChatGPT",
    "llama_vid": "LLaMAVid",
    "video_llava": "VideoLLaVA",
    "xcomposer2_4KHD": "XComposer2_4KHD",
    "claude": "Claude",
    "qwen_vl_api": "Qwen_VL_API",
    "llava_sglang": "LlavaSglang",
    "idefics2": "Idefics2",
    "internvl": "InternVLChat",
    "gemini_api": "GeminiAPI",
    "gemini_model": "GeminiModel",
    "reka": "Reka",
    "llava_onevision": "Llava_OneVision",
    "from_log": "FromLog",
    "mplug_owl_video": "mplug_Owl",
    "phi3v": "Phi3v",
}

for model_name, model_class in AVAILABLE_MODELS.items():
    try:
        exec(f"from .{model_name} import {model_class}")
    except ImportError:
        pass
