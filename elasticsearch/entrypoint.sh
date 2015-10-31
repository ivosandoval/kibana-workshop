#!/bin/sh

# Install twitter river plugin
/opt/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-river-twitter/2.6.0

# Run Elasticsearch
/run.sh
