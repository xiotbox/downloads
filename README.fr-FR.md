<div align="center">

<img src="logo.png" alt="XiotBox" width="120" />

# XiotBox

**Plateforme d'impression cloud auto-hébergée**

[Site web](https://www.xiotbox.com) · [Démo en ligne](https://demo.xiotbox.com) · [Odoo Apps](https://apps.odoo.com/apps/browse?repo_maintainer_id=500439)

[English](README.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja-JP.md) · **Français**

</div>

## Qu'est-ce que XiotBox ?

XiotBox est une **plateforme d'impression cloud auto-hébergée** compatible avec
le protocole client PrintNode. Toutes vos données d'impression restent sur vos
propres serveurs — aucune dépendance cloud tierce, un contrôle total sur votre
infrastructure.

| Composant | Description | Tarif |
| --- | --- | --- |
| XiotBox Lite | Modules Odoo 19 gratuits pour l'impression directe | Gratuit |
| XiotBox Runtime | Runtime serveur (API HTTP + SocketD intégré) | Abonnement — **essai gratuit de 30 jours automatique au premier déploiement** |
| Desktop Patch | Patch d'endpoint client PrintNode (Windows/macOS) | Gratuit |

Tous les modules Odoo sont gratuits. Runtime est le seul élément payant, et
l'essai de 30 jours est accordé **automatiquement** au premier démarrage — sans
inscription, sans approbation.

## Démarrage rapide

Déploiement en une commande (Linux, nécessite Docker + Compose v2) :

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

Guides pour débutants :

- Français (à venir)

## Fonctionnalités clés

- **Compatible client PrintNode** — le même client fonctionne, pointé vers votre propre Runtime
- **Un seul service compilé** — Runtime HTTP et SocketD intégré dans un seul conteneur
- **Essai automatique** — essai gratuit de 30 jours au premier démarrage, sans clé de licence
- **Chiffrement de bout en bout** — flux de jetons signés Ed25519 / X25519
- **Gestion des appareils** — visibilité des imprimantes par utilisateur, statut en ligne, travaux d'impression
- **Conteneur durci** — utilisateur non-root, toutes les capabilities supprimées, système de fichiers racine en lecture seule

## Téléchargements

Chaque artefact de version est construit à partir d'un tag Git exact, est
immuable et est accompagné d'un fichier `.sha256`. Téléchargements anonymes et
reprises de transfert pris en charge.

| Artefact | Emplacement |
| --- | --- |
| XiotBox Runtime (Docker amd64) | Releases — `XiotBoxRuntime-<version>-docker-amd64.tar.gz` |
| Aperçus Desktop Patch (Windows) | Releases — tags `desktop-patch-*` |
| Vérification SHA-256 | Fichier `.sha256` dans chaque Release |

Vérification :

```sh
shasum -a 256 -c XiotBoxRuntime-<version>-docker-amd64.tar.gz.sha256
```

## Liens et support

- Site web : https://www.xiotbox.com
- Démo en ligne : https://demo.xiotbox.com
- Odoo Apps : https://apps.odoo.com/apps/browse?repo_maintainer_id=500439
- Support : support@xiotbox.com
