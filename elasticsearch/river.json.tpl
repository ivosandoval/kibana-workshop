{
    "type" : "twitter",
    "twitter" : {
        "oauth" : {
            "consumer_key" : "CONSUMER_KEY",
            "consumer_secret" : "CONSUMER_SECRET",
            "access_token" : "ACCESS_TOKEN",
            "access_token_secret" : "ACCESS_TOKEN_SECRET"
        }
    },
    "index" : {
        "index" : "twitter",
        "type" : "firehose",
        "bulk_size" : 100,
        "flush_interval" : "5s",
        "retry_after" : "10s"
    }
}
