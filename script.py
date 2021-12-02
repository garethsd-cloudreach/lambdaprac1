import json
import boto3
import botocore

s3 = boto3.client('s3')

def lambda_handler(event, context):
  bucket = event['S3Bucket']
  key = event['S3Prefix']
  name = event['PetName']

  obj = s3.get_object(Bucket = bucket, Key = key)
  pets = json.loads(obj['Body'].read().decode('utf-8'))

  for p in pets['pets']:
    if name == p["name"] :
      favouriteFoods=''.join(p['favFoods'])
      print(name + "Fav foods are " + favouriteFoods)
