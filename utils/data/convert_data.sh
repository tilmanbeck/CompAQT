#!/bin/bash
#
repo_path=/Users/tbeck/Repositories/CompAQT/
# load virtual env
source /Users/tbeck/Repositories/CompAQT/venv/bin/activate

# convert hitab
python hitab_converter.py --input $repo_path/data/hitab/train_samples.jsonl --output $repo_path/data/hitab_converted/hitab_dataset_train_finqa.json
python hitab_converter.py --input $repo_path/data/hitab/test_samples.jsonl --output $repo_path/data/hitab_converted/hitab_dataset_dev_finqa.json
python hitab_converter.py --input $repo_path/data/hitab/dev_samples.jsonl --output $repo_path/data/hitab_converted/hitab_dataset_test_finqa.json

# convert tatqa
python tatqa_converter.py --input $repo_path/data/tatqa/tatqa_dataset_train.json --output $repo_path/data/tatqa_converted/tatqa_dataset_train_finqa.json
python tatqa_converter.py --input $repo_path/data/tatqa/tatqa_dataset_dev.json --output $repo_path/data/tatqa_converted/tatqa_dataset_dev_finqa.json
python tatqa_converter.py --input $repo_path/data/tatqa/tatqa_dataset_test_gold.json --output $repo_path/data/tatqa_converted/tatqa_dataset_test_finqa.json

# convert multihiertt
python multihiertt_converter.py --input $repo_path/data/multihiertt/train.json --output $repo_path/data/multihiertt_converted/multihiertt_dataset_train_finqa.json
python multihiertt_converter.py --input $repo_path/data/multihiertt/dev.json --output $repo_path/data/multihiertt_converted/multihiertt_dataset_dev_finqa.json
#python multihiertt_converter.py --input $repo_path/data/multihiertt/test.json --output $repo_path/data/multihiertt_converted/test.json

# merge datasets for final compaqt
python merger.py --finqa $repo_path/data/finqa --tatqa $repo_path/data/tatqa_converted --hitab $repo_path/data/hitab_converted --multihiertt $repo_path/data/multihiertt_converted --output $repo_path/data/final