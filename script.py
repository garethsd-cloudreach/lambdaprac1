import json
import boto3

s3 = boto3.resource('s3')

def lambda_handler(event, context):
  bucket =  'lambdaprac1289'
  key = 'lambdaprac1289/sample_data'
  petname= 'Meowsalot'

  obj = s3.Object(bucket, key)
  petname = obj.get()['Body'].read().decode('utf-8')
  json_data = json.loads(petname)

  print(json_data)