import json


def lambda_handler(event, context):
    """Sample pure Lambda function"""
    # print(event)

    r = event.get("resource", "/hello")  # default for `sam invoke`
    if r == "/hello":
        msg = "hello world!"
    elif r == "/hello/{name}":
        msg = f"""hello {event["pathParameters"]["name"]}!"""
    elif r == "/goodbye":
        msg = "goodbye cruel world..."

    return {
        "statusCode": 200,
        "body": json.dumps(
            {
                "message": msg,
            }
        ),
    }
