# Copyright (c) 2024, NVIDIA CORPORATION.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TEMPERATURE="0.0" # greedy
TOP_P="1.0"
TOP_K="32"
SEQ_LENGTHS=(
    131072
    65536
    32768
    16384
    8192
    4096
)

MODEL_SELECT() {
    MODEL_NAME=$1
    MODEL_DIR=$2
    ENGINE_DIR=$3
    
    case $MODEL_NAME in
        llama3.1-8b-chat)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-1)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-2)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-3)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-4)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-5)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-6)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-7)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-8)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-hip1k)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-bigbird)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat-sllm)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="sllm"
            ;;
        glm4-9b-chat-hip)
            MODEL_PATH="THUDM/glm-4-9b-chat-1m"
            MODEL_TEMPLATE_TYPE="chatglm-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        glm4-9b-chat-hip-snap)
            MODEL_PATH="THUDM/glm-4-9b-chat-1m"
            MODEL_TEMPLATE_TYPE="chatglm-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        glm4-9b-chat-hip-snap-8k)
            MODEL_PATH="THUDM/glm-4-9b-chat-1m"
            MODEL_TEMPLATE_TYPE="chatglm-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        glm4-9b-chat-bigbird)
            MODEL_PATH="THUDM/glm-4-9b-chat-1m"
            MODEL_TEMPLATE_TYPE="chatglm-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-instruct-hip)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-instruct-hip-snap)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-instruct-hip-snap-8k)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-instruct-bigbird)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-instruct-h2o)
            MODEL_PATH="meta-llama/Meta-Llama-3.1-8B-Instruct"
            MODEL_TEMPLATE_TYPE="llama3.1-chat"
            MODEL_FRAMEWORK="h2o"
            ;;
        # llama2-7b-chat)
        #     MODEL_PATH="${MODEL_DIR}/llama2-7b-chat-hf"
        #     MODEL_TEMPLATE_TYPE="meta-chat"
        #     MODEL_FRAMEWORK="vllm"
        #     ;;
        # gpt-3.5-turbo)
        #     MODEL_PATH="gpt-3.5-turbo-0125"
        #     MODEL_TEMPLATE_TYPE="base"
        #     MODEL_FRAMEWORK="openai"
        #     TOKENIZER_PATH="cl100k_base"
        #     TOKENIZER_TYPE="openai"
        #     OPENAI_API_KEY=""
        #     AZURE_ID=""
        #     AZURE_SECRET=""
        #     AZURE_ENDPOINT=""
        #     ;;
        # gpt-4-turbo)
        #     MODEL_PATH="gpt-4"
        #     MODEL_TEMPLATE_TYPE="base"
        #     MODEL_FRAMEWORK="openai"
        #     TOKENIZER_PATH="cl100k_base"
        #     TOKENIZER_TYPE="openai"
        #     OPENAI_API_KEY=""
        #     AZURE_ID=""
        #     AZURE_SECRET=""
        #     AZURE_ENDPOINT=""
        #     ;;
        # gemini_1.0_pro)
        #     MODEL_PATH="gemini-1.0-pro-latest"
        #     MODEL_TEMPLATE_TYPE="base"
        #     MODEL_FRAMEWORK="gemini"
        #     TOKENIZER_PATH=$MODEL_PATH
        #     TOKENIZER_TYPE="gemini"
        #     GEMINI_API_KEY=""
        #     ;;
        # gemini_1.5_pro)
        #     MODEL_PATH="gemini-1.5-pro-latest"
        #     MODEL_TEMPLATE_TYPE="base"
        #     MODEL_FRAMEWORK="gemini"
        #     TOKENIZER_PATH=$MODEL_PATH
        #     TOKENIZER_TYPE="gemini"
        #     GEMINI_API_KEY=""
        #     ;;
    esac


    if [ -z "${TOKENIZER_PATH}" ]; then
        if [ -f ${MODEL_PATH}/tokenizer.model ]; then
            TOKENIZER_PATH=${MODEL_PATH}/tokenizer.model
            TOKENIZER_TYPE="nemo"
        else
            TOKENIZER_PATH=${MODEL_PATH}
            TOKENIZER_TYPE="hf"
        fi
    fi


    echo "$MODEL_PATH:$MODEL_TEMPLATE_TYPE:$MODEL_FRAMEWORK:$TOKENIZER_PATH:$TOKENIZER_TYPE:$OPENAI_API_KEY:$GEMINI_API_KEY:$AZURE_ID:$AZURE_SECRET:$AZURE_ENDPOINT"
}
