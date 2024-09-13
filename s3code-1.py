import glob
import boto3
import os
import environments
from environments.secrets import access_key,pwd_key
import environments.secrets
access_key=environments.secrets.access_key
pwd_key=environments.secrets.pwd_key
aws_region=environments.secrets.aws_region
FOLDER_NAME = 'input'

s3_client = boto3.client( 's3',
    aws_access_key_id=access_key,
    aws_secret_access_key=pwd_key,
    region_name=aws_region
    )

csv_files = glob.glob("C:\\Users\\Meher Teja\\Documents\\Sales-dataset\\Sales_Dataset\\Sales_data_set_*.csv")


for filename in csv_files:
    key = "%s/%s" % (FOLDER_NAME, os.path.basename(filename))
    print("Putting %s as %s" % (filename,key))
    s3_client.upload_file(filename, 'mehertej-007', key)


print("All_Done")