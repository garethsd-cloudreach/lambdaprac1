import json
import boto3

s3 = boto3.resource('s3')

def lambda_handler(event, context):
  bucket =  'lambdaprac1289'
  key = 'sample_data'
  petname= 'Purrsloud'

  obj = s3.Object(bucket, key)
  petname = obj.get()['Body'].read()
  json_data = json.loads(petname)

  for pet in "pets":
      name=pet
      if name == petname:
        favouriteFoods=",".join(pet['favFoods'])
        print(name + " Favourite Foods Are: " + favouriteFoods)