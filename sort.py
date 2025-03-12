import os
import shutil
import pandas as pd

metadata_file = 'dataset/HAM10000_metadata.csv'
image_folder = 'dataset/Ham10000_images'
output_folder = 'dataset/train'

df = pd.read_csv(metadata_file)

labels = df['dx'].unique()
for label in labels:
    os.makedirs(os.path.join(output_folder, label), exist_ok=True)

for index, row in df.iterrows():
    img_id = row['image_id']
    label = row['dx']
    
    src = os.path.join(image_folder, img_id + '.jpg')
    dest = os.path.join(output_folder, label, img_id + '.jpg')
    
    if os.path.exists(src):
        shutil.copyfile(src, dest)
    else:
        print(f"Missing: {src}")

print("Dataset organized successfully!")

