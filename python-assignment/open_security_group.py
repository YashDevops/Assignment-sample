import boto3
import argparse

def parse_arguments():
    parser = argparse.ArgumentParser(description="Find open security groups in your AWS environment.")
    parser.add_argument('--region', metavar='REGION', help='AWS region to search for open security groups')

    return parser.parse_args()

def find_open_security_groups(region=None):
    open_security_groups = []
    ec2_client = boto3.client('ec2',region_name=region)
    response = ec2_client.describe_security_groups()
    for groups in response["SecurityGroups"]:
        for rule in groups['IpPermissions']:
            if any(entry['CidrIp'] == '0.0.0.0/0' for entry in rule.get('IpRanges', [])):
                open_security_groups.append({'SecurityGroupId': groups['GroupId'],'GroupName': groups['GroupName']})
    return open_security_groups

if __name__ == "__main__":
    args = parse_arguments()
    region = args.region
    open_security_groups = find_open_security_groups(region=region)

    if open_security_groups:
        print("Open security groups found:")
        for group in open_security_groups:
            print(f"Security Group ID: {group['SecurityGroupId']}, Group Name: {group['GroupName']} has CIDR Range Open To All")
    else:
        print("No open security groups found.")