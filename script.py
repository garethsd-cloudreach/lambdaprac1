import json
import boto3

s3 = boto3.resource('s3')

def lambda_handler(event, context):
  print(event)
  
  #bucket =  'lambdaprac1289'
  # key = 'sample_data'
  # petname= ''

  # obj = s3.Object(bucket, key)
  # petname = obj.get()['Body'].read()
  # json_data = json.loads(petname)
  # print(json_data)

  # for pet in json_data["pets"]:
  #     name=pet["name"]
  #     if name == petname:
  #       favouriteFoods=",".join(pet['favFoods'])
  #       print(name + " Favourite Foods Are: " + favouriteFoods)
  #     else:
  #       print( "has not been found!")