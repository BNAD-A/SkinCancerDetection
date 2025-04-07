import os
import shutil
import random

train_dir = 'dataset/train'
test_dir = 'dataset/test'

split_ratio = 0.2

os.makedirs(test_dir, exist_ok=True)

for category in os.listdir(train_dir):
    category_train_path = os.path.join(train_dir, category)

    if not os.path.isdir(category_train_path):
        continue

    category_test_path = os.path.join(test_dir, category)
    os.makedirs(category_test_path, exist_ok=True)

    images = os.listdir(category_train_path)
    total_images = len(images)
    
    # Sélectionne 20% des images au hasard
    num_test_images = int(total_images * split_ratio)
    test_images = random.sample(images, num_test_images)

    # Déplace les images sélectionnées vers test/
    for img in test_images:
        src_path = os.path.join(category_train_path, img)
        dest_path = os.path.join(category_test_path, img)
        shutil.move(src_path, dest_path)

    print(f"{num_test_images} images moved from {category} to test folder.")
