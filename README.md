# 📡 Telecom Churn Analytics — dbt Project

> Analyse et modélisation du churn client dans le secteur télécom, propulsé par **dbt Fusion Engine** + **BigQuery**.

---

## 🎯 Objectif

Ce projet vise à construire un pipeline de transformation dbt robuste pour :

- **Identifier** les signaux précurseurs du churn client
- **Segmenter** la base clients par niveau de risque
- **Alimenter** des dashboards Power BI pour le suivi des indicateurs de rétention

> Ce projet couvre uniquement la couche **Transform** d'une architecture ELT.

---

## 🗂️ Structure du projet

```
telecom_churn_dbt_project/
├── models/
│   ├── staging/          # Sources brutes normalisées (stg_*)
│   ├── intermediate/     # Logique métier intermédiaire (int_*)
│   └── marts/            # Tables finales exposées aux outils BI (fct_*, dim_*)
├── seeds/                # Données de référence statiques
├── tests/                # Tests génériques et singuliers
├── macros/               # Macros réutilisables
├── dbt_project.yml
└── profiles.yml          # ⚠️ Non versionné — voir setup ci-dessous
```

---

## 🧱 Stack technique

| Couche | Outil |
|---|---|
| Transformation | dbt Fusion Engine |
| Entrepôt de données | BigQuery (GCP) |
| Visualisation | Power BI |
| Versionning | Git / GitHub |
| Environnement | Ubuntu (principal), Windows (laptop) |

---

## ⚙️ Setup

### Prérequis

- VS Code (ou Cursor / Windsurf)
- Extension **dbt** de dbtLabsInc installée depuis le VS Code Marketplace
- Accès à un projet GCP avec BigQuery activé
- Fichier `profiles.yml` configuré dans `~/.dbt/`

### 1. Installer le dbt Fusion Engine CLI

**Ubuntu / Linux / macOS (CDN)**
```bash
curl -fsSL https://public.cdn.getdbt.com/fs/install/install.sh | sh -s -- --update
exec $SHELL          # recharger le shell
dbt --version        # vérifier l'installation
```

**macOS (Homebrew)**
```bash
brew install dbt
dbt --version
```

**Windows (PowerShell)**
```powershell
irm https://public.cdn.getdbt.com/fs/install/install.ps1 | iex
# Rouvrir PowerShell, puis :
dbt --version
```

**Windows (Winget)**
```powershell
winget install --id dbtLabs.dbt --exact
dbt --version
```

**Toutes plateformes (pip)**
```bash
python -m pip install --pre dbt
dbt --version
```

> Chemin d'installation par défaut : `$HOME/.local/bin/dbt` (macOS/Linux) · `C:\Users\<username>\.local\bin\dbt.exe` (Windows)

---

### 2. Installer l'extension VS Code

1. Ouvrir l'onglet **Extensions** dans VS Code et rechercher `dbt`
2. Installer l'extension de l'éditeur **dbt Labs Inc**
3. Vérifier que l'extension est active : le label **dbt Extension** doit apparaître dans la barre de statut
4. L'extension télécharge automatiquement le Language Server (LSP) au premier lancement

---

### 3. Initialiser le projet

```bash
dbt init           # configurer le profil de connexion (si profiles.yml absent)
dbt debug          # vérifier la connexion BigQuery
dbt build          # lancer les modèles + tests
```

Cliquer sur le logo dbt dans la barre latérale pour ouvrir le panneau **Get started** et finaliser la configuration.

---

## 📊 Modèles principaux

> 🚧 *Cette section sera mise à jour au fil de l'avancement du projet.*

### Mart — Schéma en étoile

| Modèle | Type | Clé primaire | Description |
|---|---|---|---|
| `fact_churn` | Fact | `id` | Table centrale — charges, remboursements, usage data, satisfaction et statut client |
| `dim_clients` | Dimension | `id` | Profil client — genre, âge, ancienneté, situation familiale |
| `dim_abonnement` | Dimension | `id` | Type d'abonnement — périodicité, facturation digitale, mode de paiement |
| `dim_services` | Dimension | `id` | Services souscrits — téléphonie, internet, streaming, options de sécurité |
| `dim_localisations` | Dimension | `id` | Localisation — ville, état, pays, code postal, population |
| `dim_motifs` | Dimension | `id` | Motifs de churn — catégorie et raison de résiliation |

### Relations (fact_churn)

| Clé étrangère | Dimension cible |
|---|---|
| `id_client` | `dim_clients` |
| `id_localisation` | `dim_localisations` |
| `id_service` | `dim_services` |
| `id_abonnement` | `dim_abonnement` |
| `id_motif` | `dim_motifs` |

---

## ✅ Tests

```bash
dbt test                  # Tous les tests
dbt test --select staging # Tests ciblés sur la couche staging
```

Tests couverts :
- `not_null` et `unique` sur les clés primaires
- `accepted_values` sur les statuts et catégories
- Tests singuliers sur les règles métier critiques

---

## 📈 Statut d'avancement

| Phase | Statut |
|---|---|
| Setup du projet dbt | ✅ Fait |
| Modélisation Staging | 🚧 En cours |
| Modélisation Intermediate | ⏳ À venir |
| Modélisation Marts | ⏳ À venir |
| Tests & Documentation | ⏳ À venir |
| Connexion Power BI | ⏳ À venir |

---

## 📚 Ressources

- [dbt Fusion Engine — Quickstart](https://docs.getdbt.com/guides/fusion)
- [dbt VS Code Extension](https://docs.getdbt.com/docs/install-dbt-extension)
- [dbt Docs — BigQuery](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup)
- [GCP BigQuery](https://cloud.google.com/bigquery/docs)

---

## 👤 Auteur

**AGOSSOU** — Data Engineer en formation (RNCP7 Liora)
GCP Associate Cloud Engineer · Python · SQL · dbt · BigQuery

---

*Dernière mise à jour : juin 2026*
