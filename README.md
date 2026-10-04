# Onepage

Collection de pages web et de démonstrations visuelles. Chaque dossier correspond à une réalisation autonome : `brf/`, `flyhigh/`, `tract/` et `robotech/`. Un dossier `Sonos/` local vide n'est pas publié.

Les projets Vue se lancent depuis leur dossier avec les commandes indiquées dans leur `package.json`. La racine contient aussi des ressources communes et une configuration Docker/nginx.

Projet présenté par [BirostWeb](https://birostweb.fr).

## Build, tests et déploiement

- Build Docker : `docker build -t onepage .` (nginx non-root sur le port 8080, sans variable d'environnement ni secret).
- Tests de non-régression (build Docker, 5 pages, 404, en-têtes, UID non-root, absence de secrets/sourcemaps) : `sh tests/run.sh`.
- Pages légales : `mentions-legales.html` et `confidentialite.html` contiennent des marqueurs `[À COMPLÉTER]` à renseigner par l'éditeur avant la mise en ligne publique.
- La CSP est bloquante (`nginx.conf`) ; polices, AOS et Spline sont auto-hébergés (voir `THIRD_PARTY.md`).
