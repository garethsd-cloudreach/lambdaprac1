import boto3

session = boto3.Session()

s3 = session.resource('s3')

my_bucket = s3.Bucket('lambdaprac1289')

for my_bucket_object in my_bucket.objects.all():
    print(my_bucket_object)
