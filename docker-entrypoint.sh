#!/bin/sh
set -eu

MODEL="${TEI_MODEL:-sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2}"
POOLING="${TEI_POOLING:-mean}"

exec text-embeddings-router --model-id "$MODEL" --pooling "$POOLING" "$@"
