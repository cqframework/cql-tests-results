FROM nginx:stable-alpine
LABEL maintainer="preston.lee@prestonlee.com"

# We need to make a few changes to the default configuration file.
COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

# Remove any default nginx content
RUN rm -rf *

# Copy build from "builder" stage, as well as runtime configuration script public folder
COPY results .
RUN if ls *.json > /dev/null 2>&1; then \
  printf '{"files": [' > index.json; \
  first=1; \
  for f in *.json; do \
    [ "$f" = "index.json" ] && continue; \
    if [ $first -eq 0 ]; then printf ',' >> index.json; fi; \
    printf '"%s"' "$f" >> index.json; \
    first=0; \
  done; \
  printf ']}' >> index.json; \
else \
  echo "{\"files\": []}" > index.json; \
fi
