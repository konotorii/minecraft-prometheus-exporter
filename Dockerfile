# Dockerfile
FROM cgr.dev/chainguard/static@sha256:17c46078cc3a08fa218189d8446f88990361e8fd9e2cb6f6f535a7496c389e8e
COPY minecraft-exporter \
	/usr/bin/minecraft-exporter
ENTRYPOINT ["/usr/bin/minecraft-exporter"]
