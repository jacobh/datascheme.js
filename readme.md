# Datascheme

Datascheme is used to split the schema and the actual data in cases when there will be repeated packages of data with the same schema. It was originally built to put as much data as possible into [Pubnub](http://www.pubnub.com/) messages.

It supports primitive values, objects, arrays of primitives, and arrays of objects where all objects are the same. This proved to serve our purpose.

## Example

### Message
```json
{
  "type":"discussion",
  "v":4,
  "content":{
    "post_id":45723,
    "post_date":1361341564,
    "container":"thread_id",
    "container_id":44888,
    "title":"Interim Results",
    "node_id":4,
    "node_name":"asx",
    "node_title":"ASX",
    "user_id":1,
    "username":"jacob",
    "prefix_ids":"2439,1089",
    "message":"asd",
    "reply_count":2,
    "view_count":0,
    "stocks":{
      "1089":{
        "phrase_text":"ITD",
        "id":1089,
        "code":"ITD",
        "name":"ITL Limited",
        "type":"company",
        "exchange_id":1,
        "col_bg":null,
        "price":23,
        "price_change_pc":4.545,
        "last_traded_at":"2013-02-20 15:49:09",
        "prefix_id":1089,
        "prefix_group_id":1,
        "page_slug":"asx-itd",
        "isUserFollowing":false,
        "isPrepared":true
      }
    },
    "topics":[

    ],
    "isSystem":true,
    "isAnnouncement":false,
    "isNews":true,
    "test_array":[
      "a",
      "b",
      "c",
      "d"
    ]
  }
}
```

### Definition
```json
[
  "type",
  "v",
  {
    "content":[
      "post_id",
      "post_date",
      "container",
      "container_id",
      "title",
      "node_id",
      "node_name",
      "node_title",
      "user_id",
      "username",
      "prefix_ids",
      "message",
      "reply_count",
      "view_count",
      {
        "stocks":[
          [
            "phrase_text",
            "id",
            "code",
            "name",
            "type",
            "exchange_id",
            "col_bg",
            "price",
            "price_change_pc",
            "last_traded_at",
            "prefix_id",
            "prefix_group_id",
            "page_slug",
            "isUserFollowing",
            "isPrepared"
          ]
        ]
      },
      {
        "topics":[

        ]
      },
      "isSystem",
      "isAnnouncement",
      "isNews",
      {
        "test_array":[

        ]
      }
    ]
  }
]
```

### Condensed
```json
    [
      "discussion",
      4,
      [
        45723,
        1361341564,
        "thread_id",
        44888,
        "Interim Results",
        4,
        "asx",
        "ASX",
        1,
        "jacob",
        "2439,1089",
        "asd",
        2,
        0,
        {
          "1089":[
            "ITD",
            1089,
            "ITD",
            "ITL Limited",
            "company",
            1,
            null,
            23,
            4.545,
            "2013-02-20 15:49:09",
            1089,
            1,
            "asx-itd",
            false,
            true
          ]
        },
        [

        ],
        true,
        false,
        true,
        [
          "a",
          "b",
          "c",
          "d"
        ]
      ]
    ]
```
