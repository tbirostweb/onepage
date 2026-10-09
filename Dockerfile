# ============================================================
#  One Page Challenge — build des 4 mini-sites + service statique
#  Le build (Vite) se fait ICI, côté serveur (Dokploy), pas en local.
# ============================================================

# ---------- Étape build ----------
FROM node:20-alpine AS build
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
    cp index.html /site/index.html; \
    cp -r brf/dist     /site/brf; \
    cp -r flyhigh/dist /site/flyhigh; \
    cp -r tract/dist   /site/tract; \
    cp -r robotech     /site/robotech; \
    rm -f /site/robotech/README.md

# ---------- Étape service ----------
FROM nginx:alpine
COPY --from=build /site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
