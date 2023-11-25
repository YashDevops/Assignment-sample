import boto3

def check_public_buckets():
    s3 = boto3.client('s3')
    response = s3.list_buckets()
    for bucket in response["Buckets"]:
        bucketname = bucket["Name"]
        acl_response = s3.get_public_access_block(Bucket=bucketname)
        if (acl_response["PublicAccessBlockConfiguration"]["BlockPublicPolicy"] and acl_response["PublicAccessBlockConfiguration"]["RestrictPublicBuckets"]) == False:
            print(f"Bucket Name {bucketname} is public") 


if __name__ == "__main__":
    check_public_buckets()
