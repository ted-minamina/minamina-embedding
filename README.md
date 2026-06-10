# minamina-embedding

Local embedding service for MinaMina chat — [Text Embeddings Inference (TEI)](https://github.com/huggingface/text-embeddings-inference) with **paraphrase-multilingual-MiniLM-L12-v2** (384-dim).

## Quick start

```bash
cp .env.example .env
docker compose up -d
curl http://127.0.0.1:8400/health
curl -X POST http://127.0.0.1:8400/embed \
  -H "Content-Type: application/json" \
  -d '{"inputs":"你好"}'
```

Container name: `minamina-chat-dev-tei` (port `8400` by default).

## Model

| Setting | Default |
|---------|---------|
| Model | `sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2` |
| Dimensions | 384 |
| Pooling | mean |

Weights are cached in Docker volume `tei_data` after the first download from Hugging Face Hub.

## minamina-chat integration

Point the chat app and mem0 sidecar at this service:

```env
EMBEDDING_PROVIDER=tei
TEI_URL=http://127.0.0.1:8400
TEI_MODEL=sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
TEI_EMBEDDING_DIM=384
MEM0_EMBEDDER=tei
```

When running chat in Docker on the same network, use `TEI_URL=http://tei:80` and attach this service to that network.
