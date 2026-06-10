FROM ghcr.io/huggingface/text-embeddings-inference:cpu-1.9

ENV TEI_MODEL=sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2 \
    TEI_POOLING=mean

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --retries=30 --start-period=180s \
  CMD curl -sf http://127.0.0.1:80/health >/dev/null || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
