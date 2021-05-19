# Based on: https://gist.github.com/iMilnb/bf27da3f38272a76c801
import json

import requests


def handle_sns(event, context):
    status_code = 200
    data = {}

    print(event)

    js = {}

    try:
        js = json.loads(event['body']) if event['body'] else None
    except Exception as e:
        status_code = 400
        data['message'] = str(e)

    hdr = event['headers'].get('x-amz-sns-message-type')
    if not hdr:
        hdr = event['headers'].get('X-Amz-Sns-Message-Type')
    if hdr == 'SubscriptionConfirmation' and 'SubscribeURL' in js:
        r = requests.get(js['SubscribeURL'])
        if r.ok:
            data['message'] = 'Subscription success'
        else:
            status_code = 400
            data['message'] = 'Failed to subscribe'

    elif hdr == 'Notification':
        print('Message:', js['Message'])
        print('Timestamp:', js['Timestamp'])
        data['message'] = 'SNS Message received Successfully'
    else:
        data['message'] = 'Not a subscrition request'
    response = {"statusCode": status_code, "body": json.dumps(data)}
    print(response)
    return response

