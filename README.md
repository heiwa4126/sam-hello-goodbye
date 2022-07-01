# sam-hello-goodbye

1個のAWS Lambdaで複数のAWS API Gatewayを受けるサンプル([aws_lambda_powertools.event\_handler](https://awslabs.github.io/aws-lambda-powertools-python/latest/core/event_handler/api_gateway/#api-gateway-rest-api)使用)。
他AWS API Gatewayでのバリデーションのサンプルにもなっている。


# インストール

SAMなのでいつもどおりに
```sh
sam build
sam deploy --guided   # 2回め以降は --guided ぬきで
```


## ローカルのテスト

このプロジェクトはデプロイしないでも
```sh
sam build
sam local start-api
# tmuxだったら画面分割して
./local_test.sh
```
で十分。


## デプロイした場合のテスト

```bash
./make_env.sh && . ./tmp/env.sh
```
で環境変数をセットしたら

```bash
./remote_test.sh
```

バリデータのテストは
```bash
./validator_test.sh
```


# OpenAPIのエクスポート

デプロイ後

```bash
./make_env.sh
./export_as_openapi.sh
```

で tmpの下に `oas3.json` と `oas3.yaml`(yqコマンドがあれば)ができます。


# メモ

## コンソールからAWS API Gatewayでバリデータなどをいじった後

再デプロイしないと反映されない。exportしても変化がない。

以下手順を参照:
[REST API をステージに再デプロイする](https://docs.aws.amazon.com/ja_jp/apigateway/latest/developerguide/how-to-deploy-api-with-console.html#apigateway-how-to-redeploy-api-console)

CLIもあると思うが調べてない。あとstackのドリフトは再デプロイしても検出できない。

ほか一覧: [再デプロイが必要な REST API の更新 - Amazon API Gateway](https://docs.aws.amazon.com/ja_jp/apigateway/latest/developerguide/updating-api.html)
## validation

validationのクエリのほうがうまく動かない。bodyのほうはちゃんとmodelのバリデーションが動く。

[API Gateway 拡張機能 - AWS Serverless Application Model](https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/sam-specification-api-gateway-extensions.html)で
x-amazon-apigateway-request-validatorをサポートしてないと書いてあるので間違ってない。

全部OpenAPIで書けばできると思うが、[Event: の Api](https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/sam-property-function-api.html)は便利すぎる。
