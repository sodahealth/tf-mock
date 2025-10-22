# syntax=docker/dockerfile:1

FROM hashicorp/terraform:1.9

ENV TF_INPUT=false \
    TF_IN_AUTOMATION=true \
    TF_PLUGIN_CACHE_DIR=/root/.terraform.d/plugin-cache

RUN mkdir -p "$TF_PLUGIN_CACHE_DIR"

WORKDIR /workspace

# Default: run tests (override with `command:` in docker-compose)
ENTRYPOINT ["terraform"]
CMD ["test", "-no-color"]


