#%%
import matplotlib.pylab as plt
import pathlib
#%%
species = "cargo"
pic_dir = pathlib.Path("/home/pc001/w0n9/stylegan2-ada-pytorch/out/" + species)
# list1 = [
#     -1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3,
#     0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1
# ]
list1 = [str(x) for x in range(101, 111)]
list1.reverse()
for _ in range(0, 11):
    list1.append(str(_).zfill(3))
# x = -1
# list1 = [-1]
# while x < 1:
#     x += 0.1
#     list1.append(round(x,1))
# print(list1)
#%%
plt.figure(figsize=(42, 22))
temp_loc = 0
for k in range(0, 11, 1):
    for i, j in enumerate(list1):
        temp_loc += 1
        ax = plt.subplot(11, 21, temp_loc)
        a = plt.imread(
            pic_dir.joinpath("trunc_" +
                             str(j)).joinpath("seed00" + str(k + 12).zfill(2) +
                                              ".jpg"))
        plt.imshow(a)
        plt.title(j)
        plt.axis("off")
plt.savefig(species + ".jpg", pad_inches=0)
# %%
