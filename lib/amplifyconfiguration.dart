const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:c637b65a-a907-48c4-ade2-bd2e977acc82",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_p9yPjYlVW",
                        "AppClientId": "vc3o4cjrj5g0r8n1hh81gtuvq",
                        "AppClientSecret": "1rrak1co2lg25q2ulujnfitccl753kr83nn9o7knk0sgndkmaspf",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "chatapp": {
                    "endpointType": "GraphQL",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY"
                }
            }
        }
    }
}''';