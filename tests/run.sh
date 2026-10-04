#!/bin/sh
# Test de non-regression : build de l'image, headers, pages, 404, non-root, secrets, sourcemaps.
set -eu
cd "$(dirname "$0")/.."
IMG=onepage-test; NAME=onepage-test-run; PORT=18080
fail() { echo "FAIL: $1"; docker rm -f $NAME >/dev/null 2>&1 || true; exit 1; }
# Fichier secret factice : ne doit jamais atterrir dans le contexte de build
printf 'SECRET=canary' > .env.canary-test
trap 'rm -f .env.canary-test; docker rm -f $NAME >/dev/null 2>&1 || true' EXIT
docker build -q -t $IMG . >/dev/null || fail "build"
docker rm -f $NAME >/dev/null 2>&1 || true
docker run -d --name $NAME -p $PORT:8080 $IMG >/dev/null
sleep 3
B=http://127.0.0.1:$PORT
for p in / /brf/ /flyhigh/ /tract/ /robotech/ /mentions-legales.html /confidentialite.html; do
  c=$(curl -s -o /dev/null -w '%{http_code}' $B$p); [ "$c" = 200 ] || fail "$p -> $c"
done
[ "$(curl -s -o /dev/null -w '%{http_code}' $B/inconnu)" = 404 ] || fail "404 attendu"
for u in / /robotech/ /brf/ /nope; do
  h=$(curl -si $B$u)
  for k in x-content-type-options x-frame-options referrer-policy permissions-policy content-security-policy; do
    echo "$h" | grep -qi "^$k:" || fail "header $k absent sur $u"
  done
done
# headers aussi sur les assets, avec Cache-Control unique
a=$(curl -s $B/brf/ | grep -o 'assets/[^"]*\.js' | head -1)
h=$(curl -si $B/brf/$a); echo "$h" | grep -qi '^permissions-policy:' || fail "headers absents sur asset"
echo "$h" | grep -qi '^cache-control: max-age=2592000' || fail "cache-control asset"
[ "$(echo "$h" | grep -ci '^cache-control:')" = 1 ] || fail "Cache-Control duplique"
# redirection sans slash: pas de port interne
loc=$(curl -si $B/brf | grep -i '^location:'); echo "$loc" | grep -q ':8080' && fail "redirect absolu"
# aucune ressource tierce (src/href/url()/@import absolus) dans les pages et CSS servis
for f in / /robotech/ /brf/ /flyhigh/ /tract/ /mentions-legales.html /confidentialite.html /gallery.css /fonts.css /robotech/style.css /robotech/fonts.css; do
  curl -s $B$f | grep -oE '(src|href)="https?://[^"]*"|url\(["'"'"']?https?://[^)]*|@import[^;]*https?://' | grep -v 'birostweb.fr\|cnil.fr' && fail "ressource tierce dans $f"
done
# non-root
u=$(docker exec $NAME id -u); [ "$u" != 0 ] || fail "execute en root"
docker exec $NAME sh -c 'find /usr/share/nginx/html -name "*.map" -o -name ".env*" | grep .' && fail "map/.env dans l'image"
docker run --rm $IMG sh -c 'find / -name ".env.canary-test" 2>/dev/null | grep .' && fail "secret canary dans l'image"
docker run --rm --entrypoint sh $IMG -c 'true' >/dev/null
# healthcheck
sleep 1; docker inspect --format '{{.Config.Healthcheck.Test}}' $IMG | grep -q 8080 || fail "healthcheck"
# liens/assets locaux des pages
for p in / /robotech/; do
  for f in $(curl -s $B$p | grep -o '\(href\|src\)="[^"#:]*"' | sed 's/.*="//;s/"//'); do
    case "$p" in /) base=$B/;; *) base=$B$p;; esac
    c=$(curl -s -o /dev/null -w '%{http_code}' "$base$f"); [ "$c" = 200 ] || fail "lien casse $p$f ($c)"
  done
done
echo "OK: tous les tests passent (uid=$u)"
