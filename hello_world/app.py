import json


def lambda_handler(event, context):
    """Sample pure Lambda function"""
    # print(event)

    r = event.get("resource", "/hello")  # default for `sam invoke`

    if r == "/hello":
        return hello(event, context)
    elif r == "/hello/{name}":
        return hello_name(event, context)
    elif r == "/goodbye":
        return goodbye(event, context)
    elif r == "/add":
        if event["httpMethod"] == "GET":
            return add_get(event, context)
        if event["httpMethod"] == "POST":
            return add_post(event, context)

    return res1("(undefined)")


def res1(msg):
    return {
        "statusCode": 200,
        "body": json.dumps(
            {
                "message": msg,
            }
        ),
    }


def res2(n):
    return {
        "statusCode": 200,
        "body": json.dumps(
            {
                "result": n,
            }
        ),
    }


def hello(event, context):
    return res1("hello world!")


def hello_name(event, context):
    p = event["pathParameters"]
    msg = f"""hello {p["name"]}!"""
    return res1(msg)


def goodbye(event, context):
    return res1("goodbye cruel world...")


def add_get(event, context):
    # 存在だけはAPIGWでチェック済み。数字になるかは不明
    q = event["queryStringParameters"]
    a = float(q["a"])
    b = float(q["b"])
    return res2(a + b)


def add_post(event, context):
    q = json.loads(event["body"])
    return res2(q["a"] + q["b"])
