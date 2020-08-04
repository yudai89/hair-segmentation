import os
import glob
import shutil

import cv2
import numpy as np
from PIL import Image

# path_images = glob.glob("images/*")
# path_masks = glob.glob("masks/*")
#
# for path_image in path_images:
#     basename = os.path.basename(path_image)
#     new_basename = '0'*(9-len(basename))+ basename
#     os.rename(path_image, path_image.replace(basename, new_basename))
#
# for path in path_masks:
#     os.rename(path, path.replace('_hair', ''))
#
# i = 0
# for name in os.listdir("images"):
#     path_mask = "masks/{}".format(name.replace('.jpg', ".png"))
#     if not os.path.isfile(path_mask):
#         os.remove("images/{}".format(name))


path_images = glob.glob("images/*")
path_masks = glob.glob("masks/*")
print(len(path_images))

print(len(path_masks))



# path_images_half = len(path_images)/2
for path_image in path_images:
    image = cv2.imread(path_image)
    w,h = image.shape[:2]
    image = cv2.resize(image, (int(w/2), int(h/2)))
    filename = os.path.basename(path_image)
    # if  i <= path_images_half:
    cv2.imwrite(f'Dataset/Original/Training/{filename}', image)
    # else:
    #     cv2.imwrite(f'Figaro1k/Original/Testing/{filename}', image)

path_masks_half = len(path_masks)/2
for path_mask in path_masks:
    img = Image.open(path_mask)
    img_pbm = img.convert('1')
    # if i <= path_masks_half:
    img_pbm.save(f"Dataset/GT/Training/{os.path.splitext(os.path.basename(path_mask))[0]}.pbm")
    # else:
        # filename = os.path.basename(path_mask)
        # shutil.move(path_mask, f"Figaro1k/GT/Testing/{filename}")
