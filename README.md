# Kibana workshop repo

## Prerequisites

Infrastructure wise you'll need:
* Docker environment reachable by the docker client, I recommend installing [Docker Toolbox](https://www.docker.com/toolbox)
* Being in a Unix-like system which has `make` available

You need to get an OAuth token in order to use Twitter river. Please follow Twitter documentation, basically:

* Login to: https://dev.twitter.com/apps/
* Create a new Twitter application (let's say elasticsearch): https://dev.twitter.com/apps/new You don't need a callback URL.
* When done, click on Create my access token.
* Open OAuth tool tab and note Consumer key, Consumer secret, Access token and Access token secret.

## Environment preconfiguration

There's an [environment.yml](environment.yml) file available in the root directory of this repo. I recommend copying the file and filling all the key-values of the YAML with the information retrieved form the Twitter developer center.

## Starting it up

Typing up `make` will be enough to get it started
```bash
Creating kibanaworkshop_elasticsearch_1...
Creating kibanaworkshop_toolbox_1...
Creating kibanaworkshop_kibana_1...
Attaching to kibanaworkshop_kibana_1, kibanaworkshop_toolbox_1, kibanaworkshop_elasticsearch_1
elasticsearch_1 | ===============================
elasticsearch_1 | starting elastic search.
elasticsearch_1 | ===============================
elasticsearch_1 | -------------------------------
elasticsearch_1 | checking ulimits
elasticsearch_1 | -------------------------------
elasticsearch_1 | -f: file size (blocks)             unlimited
elasticsearch_1 | -t: cpu time (seconds)             unlimited
elasticsearch_1 | -d: data seg size (kb)             unlimited
elasticsearch_1 | -s: stack size (kb)                8192
elasticsearch_1 | -c: core file size (blocks)        0
elasticsearch_1 | -m: resident set size (kb)         unlimited
elasticsearch_1 | -l: locked memory (kb)             64
elasticsearch_1 | -p: processes                      1048576
elasticsearch_1 | -n: file descriptors               1048576
elasticsearch_1 | -v: address space (kb)             unlimited
elasticsearch_1 | -w: locks                          unlimited
elasticsearch_1 | -e: scheduling priority            0
elasticsearch_1 | -r: real-time priority             0
elasticsearch_1 | fs.file_max: 401540
elasticsearch_1 | vm.max_map_count: 65530
elasticsearch_1 | you have more than 64k allowed file descriptors. awesome.
elasticsearch_1 | -------------------------------
elasticsearch_1 | files in volume
elasticsearch_1 | -------------------------------
elasticsearch_1 | [WARNING] missing elasticsearch config. not setting es.path.home to /var/lib/elasticsearch
elasticsearch_1 | -------------------------------
elasticsearch_1 | command opts
elasticsearch_1 | -------------------------------
elasticsearch_1 |
elasticsearch_1 | -------------------------------
elasticsearch_1 | elastic search command
elasticsearch_1 | -------------------------------
elasticsearch_1 | /opt/elasticsearch/bin/elasticsearch
elasticsearch_1 | [2015-11-03 17:23:07,793][INFO ][node                     ] [Ghost Maker] version[1.7.2], pid[1], build[e43676b/2015-09-14T09:49:53Z]
elasticsearch_1 | [2015-11-03 17:23:07,793][INFO ][node                     ] [Ghost Maker] initializing ...
elasticsearch_1 | [2015-11-03 17:23:07,884][INFO ][plugins                  ] [Ghost Maker] loaded [river-twitter], sites []
elasticsearch_1 | [2015-11-03 17:23:07,934][INFO ][env                      ] [Ghost Maker] using [1] data paths, mounts [[/var/lib/elasticsearch (/dev/sda1)]], net usable_space [0b], net total_space [18.1gb], types [ext4]
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":50,"err":"Request error, retrying -- connect ECONNREFUSED","msg":"","time":"2015-11-03T17:23:09.676Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":40,"msg":"Unable to revive connection: http://elasticsearch:9200/","time":"2015-11-03T17:23:09.687Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":40,"msg":"No living connections","time":"2015-11-03T17:23:09.688Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":30,"msg":"Unable to connect to elasticsearch at http://elasticsearch:9200. Retrying in 2.5 seconds.","time":"2015-11-03T17:23:09.693Z","v":0}
elasticsearch_1 | [2015-11-03 17:23:10,325][INFO ][node                     ] [Ghost Maker] initialized
elasticsearch_1 | [2015-11-03 17:23:10,325][INFO ][node                     ] [Ghost Maker] starting ...
elasticsearch_1 | [2015-11-03 17:23:10,457][INFO ][transport                ] [Ghost Maker] bound_address {inet[/0:0:0:0:0:0:0:0:9300]}, publish_address {inet[/172.17.0.15:9300]}
elasticsearch_1 | [2015-11-03 17:23:10,480][INFO ][discovery                ] [Ghost Maker] elasticsearch/XuPhRNiFSF6-JzhDtt308g
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":40,"msg":"Unable to revive connection: http://elasticsearch:9200/","time":"2015-11-03T17:23:12.205Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":40,"msg":"No living connections","time":"2015-11-03T17:23:12.206Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":30,"msg":"Unable to connect to elasticsearch at http://elasticsearch:9200. Retrying in 2.5 seconds.","time":"2015-11-03T17:23:12.208Z","v":0}
elasticsearch_1 | [2015-11-03 17:23:14,262][INFO ][cluster.service          ] [Ghost Maker] new_master [Ghost Maker][XuPhRNiFSF6-JzhDtt308g][d26a0e0e10f8][inet[/172.17.0.15:9300]], reason: zen-disco-join (elected_as_master)
elasticsearch_1 | [2015-11-03 17:23:14,327][INFO ][http                     ] [Ghost Maker] bound_address {inet[/0:0:0:0:0:0:0:0:9200]}, publish_address {inet[/172.17.0.15:9200]}
elasticsearch_1 | [2015-11-03 17:23:14,327][INFO ][node                     ] [Ghost Maker] started
elasticsearch_1 | [2015-11-03 17:23:14,340][INFO ][gateway                  ] [Ghost Maker] recovered [0] indices into cluster_state
elasticsearch_1 | [2015-11-03 17:23:14,638][INFO ][cluster.metadata         ] [Ghost Maker] [twitter] creating index, cause [api], templates [], shards [5]/[1], mappings [firehose]
toolbox_1       | {"acknowledged":true}
elasticsearch_1 | [2015-11-03 17:23:14,841][INFO ][cluster.metadata         ] [Ghost Maker] [.kibana] creating index, cause [api], templates [], shards [5]/[1], mappings [index-pattern, config]
toolbox_1       | {"acknowledged":true}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":30,"msg":"Elasticsearch is still initializing the kibana index... Trying again in 2.5 second.","time":"2015-11-03T17:23:14.878Z","v":0}
toolbox_1       | {"_index":".kibana","_type":"config","_id":"4.1.0","_version":1,"created":true}
toolbox_1       | {"_index":".kibana","_type":"index-pattern","_id":"twitter","_version":1,"created":true}
elasticsearch_1 | [2015-11-03 17:23:15,093][INFO ][cluster.metadata         ] [Ghost Maker] [_river] creating index, cause [auto(index api)], templates [], shards [1]/[1], mappings [twitter]
toolbox_1       | {"_index":"_river","_type":"twitter","_id":"_meta","_version":1,"created":true}
elasticsearch_1 | [2015-11-03 17:23:15,141][INFO ][cluster.metadata         ] [Ghost Maker] [_river] update_mapping [twitter] (dynamic)
elasticsearch_1 | [2015-11-03 17:23:15,148][INFO ][river                    ] [Ghost Maker] rivers have been deprecated. Read https://www.elastic.co/blog/deprecating_rivers
elasticsearch_1 | [2015-11-03 17:23:15,156][INFO ][river.twitter            ] [Ghost Maker] [twitter][twitter] creating twitter stream river
elasticsearch_1 | [2015-11-03 17:23:15,164][INFO ][cluster.metadata         ] [Ghost Maker] [_river] update_mapping [twitter] (dynamic)
elasticsearch_1 | [2015-11-03 17:23:15,167][INFO ][river.twitter            ] [Ghost Maker] [twitter][twitter] starting sample twitter stream
elasticsearch_1 | [2015-11-03 17:23:15,235][INFO ][twitter4j.TwitterStreamImpl] Establishing connection.
elasticsearch_1 | [2015-11-03 17:23:16,768][INFO ][twitter4j.TwitterStreamImpl] Connection established.
elasticsearch_1 | [2015-11-03 17:23:16,769][INFO ][twitter4j.TwitterStreamImpl] Receiving status stream.
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":30,"msg":"Found kibana index","time":"2015-11-03T17:23:17.387Z","v":0}
kibana_1        | {"name":"Kibana","hostname":"80c0d6526f4d","pid":1,"level":30,"msg":"Listening on 0.0.0.0:5601","time":"2015-11-03T17:23:17.507Z","v":0}
elasticsearch_1 | [2015-11-03 17:23:40,156][INFO ][cluster.metadata         ] [Ghost Maker] [.kibana] update_mapping [visualization] (dynamic)
toolbox_1       | {"took":12,"errors":false,"items":[{"index":{"_index":".kibana","_type":"search","_id":"English-tweets","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Friend-word-count","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Total-tweets","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Popular-engilsh-hashtags","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Language-history-points","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Language-slash-Loc-split","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"Markdown-text","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"visualization","_id":"English-tweets","_version":1,"status":201}},{"index":{"_index":".kibana","_type":"dashboard","_id":"Tweet-dash","_version":1,"status":201}}]}
elasticsearch_1 | [2015-11-03 17:23:40,164][INFO ][cluster.metadata         ] [Ghost Maker] [.kibana] update_mapping [dashboard] (dynamic)
elasticsearch_1 | [2015-11-03 17:23:40,165][INFO ][cluster.metadata         ] [Ghost Maker] [.kibana] update_mapping [search] (dynamic)
kibanaworkshop_toolbox_1 exited with code 0
```

After all that gibberish is gone, expect the command to close, as the container `toolbox` will be a short lived one.

## Viewing Kibana data

Point your browser to `<docker-ip>:5601/` and you'll see Kibana loading up with a few dashboards included for what u paid :metal:

## Accessing Elasticserach

Elasticsearch is available at `http://<docker-ip>:19200/`

## Other commands

### Viewing logs

```bash
make logs
```

### Stopping it

```bash
make kill
```

### Removing everything

It will also stop the environment if its running

```bash
make nodev
```
