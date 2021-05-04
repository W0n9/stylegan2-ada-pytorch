#%%
import json
import glob
# %%
i = 0
label_list = []
dataset_name = ["cargo", "container", "tanker"]
for _ in dataset_name:
    for a in glob.iglob(_ + "/*.bmp"):
        temp_list = []
        temp_list.append(a)
        temp_list.append(i)
        label_list.append(temp_list)
    i += 1

dataset_dict = {}
dataset_dict["labels"] = label_list
# %%
with open("dataset.json", "w") as f:
    json.dump(dataset_dict, f)

# %%
