## Localstack

Link: https://danieldcs.com/simulando-aws-local-com-localstack-e-node-js/

#### To run tests:

Start localstack docker:
```
$ docker-compose up
```

Create SQS queue:
```
$ aws sqs create-queue --queue-name local-queue --endpoint-url http://localhost:4566 --region us-east-1
```

Create SNS topic
```
$ aws sns create-topic --name local-topic --endpoint-url http://localhost:4566 --region us-east-1
```

Subscribe Queue to Topic:
```
$ aws sns subscribe \
--notification-endpoint http://localhost:4566/000000000000/local-queue \
--topic-arn arn:aws:sns:us-east-1:000000000000:local-topic \
--protocol sqs \
--endpoint-url=http://localhost:4566 \
--region us-east-1
```

Run both commands in two different terminals:
```
$ node nodejsLocalAWS/sqs-consumer.js
$ node nodejsLocalAWS/sqs-publisher.js 
```

