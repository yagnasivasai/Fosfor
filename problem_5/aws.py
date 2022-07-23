import boto3

awsconsole = boto3.sessioj.Session(profile_name="root")
client = awsconsole.client(servicen_name='ce', region_name='us-east-1')

response = client.get_cost_and_usage(
    TimePeriod={
        'Start': '2022-07-01',
        'End': '2022-08-01'
    },
    Granularity='MONTHLY',
    Metrics=[
        'AmortizedCost',
    ]
)

print(response)
