# The Code for DivPrune: Diversity-based Visual Token Pruning for Large Multimodal Models paper
First you need to create a conda enviroment and activate it. 

Then you can use the provided script to get the results of the paper for LLaVA 1.5-7B model (TFLOP 15%).  

The code will automatically download the datasets and the checkpoints from Huggingface. 

## Installation

```bash
conda env create -f environment.yml
conda activate lmms-eval
#install lmms_eval
cd lmms_eval
pip install -e .
#install llava
cd ../LLaVA
pip install -e .
cd ..
```


##  Reproduction of  paper results

Run the following script to see the results on 11 datasets using 8 gpus (Table 1). 
You can change the model and change the "SUBSET_RATIO" to obtain the other reported values.

```bash
bash ./run_DivPrune.sh
```

## Reference
This code is based on the Lmms-eval framework. (https://lmms-lab.github.io/posts/lmms-eval-0.2/)