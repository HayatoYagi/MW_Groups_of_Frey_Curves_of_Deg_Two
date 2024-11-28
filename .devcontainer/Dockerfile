FROM ghcr.io/being24/latex-docker
USER root
RUN apt-get update && apt-get install -y \
    sagemath \
    && apt-get clean && rm -rf /var/lib/apt/lists/*