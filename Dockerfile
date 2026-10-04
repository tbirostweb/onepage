# ============================================================
#  One Page Challenge — build des 3 mini-sites + service statique
#  Le build (Vite) se fait ICI, cote serveur (Dokploy), pas en local.
#  Aucun secret au build : aucune variable d'environnement requise.
# ============================================================

# ---------- Etape build ----------
# Node 22 LTS (Node 20 en fin de vie). Digest verifie via `docker buildx imagetools inspect node:22-alpine`.
FROM node:22-alpine@sha256:0a7108bf6c7bf5de370ffb1a3ed6be93d405b43ff159f681a8d18c0e2bc2e402 AS build
WORKDIR /app
COPY . .

# Build des 3 mini-sites Vue+Vite en base relative (pour fonctionner sous /<nom>/),
# puis assemblage de la galerie dans /site.
RUN set -e; \
    for d in brf flyhigh tract; do \
      echo "==> build $d"; \
      (cd "$d" && npm ci && npm run build -- --base=./); \
    done; \
    mkdir -p /site; \
    cp index.html gallery.css fonts.css mentions-legales.html confidentialite.html legal.css /site/; \
    cp -r fonts /site/fonts; \
    cp -r brf/dist     /site/brf; \
    cp -r flyhigh/dist /site/flyhigh; \
    cp -r tract/dist   /site/tract; \
    cp -r robotech     /site/robotech; \
    rm -f /site/robotech/README.md; \
    find /site -name '*.map' -delete

# ---------- Etape service (nginx non-root, port 8080) ----------
# Digest verifie via `docker buildx imagetools inspect nginxinc/nginx-unprivileged:1.28-alpine`.
FROM nginxinc/nginx-unprivileged:1.28-alpine@sha256:7377697a821c131a924a7105fafbe7414db4e9fcc77a6f08f776f33f141ec3f8
COPY --from=build /site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
USER 101:101
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/ >/dev/null || exit 1
