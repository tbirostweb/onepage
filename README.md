# Onepage

Collection de pages web et de démonstrations visuelles. Chaque dossier correspond à une réalisation autonome : `brf/`, `flyhigh/`, `tract/` et `robotech/`. Un dossier `Sonos/` local vide n'est pas publié.

Les projets Vue se lancent depuis leur dossier avec les commandes indiquées dans leur `package.json`. La racine contient aussi des ressources communes et une configuration Docker/nginx.

Projet présenté par [BirostWeb](https://birostweb.fr).

## Build, tests et déploiement

- Build Docker : `docker build -t onepage .` (nginx non-root sur le port 8080, sans variable d'environnement ni secret).
- Tests de non-régression (build Docker, 5 pages, 404, en-têtes, UID non-root, absence de secrets/sourcemaps) : `sh tests/run.sh`.
- Pages légales : `mentions-legales.html` et `confidentialite.html` contiennent des marqueurs `[À COMPLÉTER]` à renseigner par l'éditeur avant la mise en ligne publique.
- La CSP est bloquante (`nginx.conf`) ; polices et AOS sont auto-hébergés ; le robot de /robotech/ est un SVG original (aucun Spline ni CDN) (voir `THIRD_PARTY.md`).

## Runbook de déploiement manuel (à exécuter en coordination, ne pas automatiser)

1. Vérifier : `sh tests/run.sh` puis `git ls-files robotech/vendor` (AOS + LICENSE-aos.txt suivis).
2. Construire l'image : `docker build -t vps-onepage-legal:YYYYMMDD .` (nginx non-root, port 8080).
3. Dans Dokploy, avec accord préalable : autodeploy OFF, puis basculer le port du service de 80 vers 8080 en même temps que le déploiement de la nouvelle image.
4. Contrôler `/`, `/robotech/`, `/brf/`, `/flyhigh/`, `/tract/`, les pages légales et un 404.
5. Rollback : redéployer l'image précédente (commit de référence e969835) et remettre le port 80.
