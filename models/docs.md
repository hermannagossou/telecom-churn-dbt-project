{# ==========================================================================
   Doc blocks partagés — définitions métier réutilisées à travers les couches
   staging / intermediate / marts, référencées via {{ doc('nom') }} dans les
   fichiers .yml. Objectif : une seule source de vérité par concept, pour
   éviter la dérive entre couches quand une définition évolue.
   ========================================================================== #}

{# --- Client : identité et démographie --- #}

{% docs id_client %}
Identifiant unique du client, clé naturelle utilisée pour relier les différentes sources (démographie, services, statut, localisation).
{% enddocs %}

{% docs genre %}
Genre du client, traduit en français depuis la source ('Masculin'/'Féminin', 'Autre' si non reconnu).
{% enddocs %}

{% docs age %}
Âge du client, en années.
{% enddocs %}

{% docs personne_agee %}
Indique si le client est une personne âgée (senior citizen).
{% enddocs %}

{% docs personne_mariee %}
Indique si le client est marié(e).
{% enddocs %}

{% docs personne_a_charge %}
Indique si le client a au moins une personne à charge.
{% enddocs %}

{% docs nombre_personne_a_charge %}
Nombre de personnes à charge du client.
{% enddocs %}

{% docs anciennete %}
Ancienneté du client, en mois.
{% enddocs %}

{% docs niveau_maturite %}
Segmentation du client par tranche d'âge : 'Jeune' (< 30 ans), 'Adulte' (30 à 60 ans), 'Senior' (> 60 ans).
{% enddocs %}

{# --- Localisation --- #}

{% docs ville %}
Ville de résidence du client.
{% enddocs %}

{% docs etat %}
État ou région de résidence du client.
{% enddocs %}

{% docs pays %}
Pays de résidence du client.
{% enddocs %}

{% docs code_postal %}
Code postal de résidence du client.
{% enddocs %}

{% docs latitude %}
Latitude de la localisation, en degrés décimaux.
{% enddocs %}

{% docs longitude %}
Longitude de la localisation, en degrés décimaux.
{% enddocs %}

{% docs population %}
Population résidente du code postal.
{% enddocs %}

{# --- Services souscrits --- #}

{% docs service_telephonique %}
Indique si le service téléphonique est souscrit.
{% enddocs %}

{% docs lignes_multiples %}
Indique si plusieurs lignes téléphoniques sont souscrites.
{% enddocs %}

{% docs service_internet %}
Indique si le service internet est souscrit.
{% enddocs %}

{% docs type_internet %}
Type de connexion internet souscrite.
{% enddocs %}

{% docs securite_en_ligne %}
Indique si l'option de sécurité en ligne est souscrite.
{% enddocs %}

{% docs sauvegarde_en_ligne %}
Indique si l'option de sauvegarde en ligne est souscrite.
{% enddocs %}

{% docs plan_protection_equipement %}
Indique si le plan de protection de l'équipement est souscrit.
{% enddocs %}

{% docs support_technique_premium %}
Indique si le support technique premium est souscrit.
{% enddocs %}

{% docs streaming_tv %}
Indique si le streaming TV est souscrit.
{% enddocs %}

{% docs streaming_films %}
Indique si le streaming de films est souscrit.
{% enddocs %}

{% docs streaming_musique %}
Indique si le streaming de musique est souscrit.
{% enddocs %}

{% docs donnees_illimitee %}
Indique si les données mobiles illimitées sont souscrites.
{% enddocs %}

{# --- Abonnement et facturation --- #}

{% docs periodicite %}
Périodicité de l'abonnement du client.
{% enddocs %}

{% docs facturation_digitale %}
Indique si la facturation digitale (sans papier) est activée.
{% enddocs %}

{% docs mode_paiement %}
Mode de paiement utilisé par le client.
{% enddocs %}

{% docs montant_charge_mensuel %}
Montant facturé mensuellement au client.
{% enddocs %}

{% docs montant_charge_total %}
Montant total facturé au client depuis le début de son abonnement.
{% enddocs %}

{% docs montant_remboursements_total %}
Montant total des remboursements accordés au client.
{% enddocs %}

{% docs montant_charge_donnees_supplementaire %}
Montant total facturé pour la consommation de données mobiles supplémentaires.
{% enddocs %}

{% docs nombre_moyen_gb_telecharge_par_mois %}
Nombre moyen de gigaoctets téléchargés par mois par le client.
{% enddocs %}

{# --- Statut et churn --- #}

{% docs score_satisfaction %}
Score de satisfaction déclaré par le client.
{% enddocs %}

{% docs statut_client %}
Statut actuel du client vis-à-vis de l'opérateur.
{% enddocs %}

{% docs categorie_churn %}
Catégorie du motif de résiliation, renseignée uniquement pour les clients résiliés.
{% enddocs %}

{% docs raison_churn %}
Raison précise de la résiliation telle que renseignée dans les données sources ("Don't know" si absente dans la source).
{% enddocs %}

{# --- Clés de substitution des dimensions du mart (générées dans int_churn_joined) --- #}

{% docs id_localisation %}
Clé de substitution identifiant la localisation du client (ville, état, pays, code postal, population).
{% enddocs %}

{% docs id_service %}
Clé de substitution identifiant le bouquet de services souscrits par le client (téléphonie, internet, streaming, options de sécurité).
{% enddocs %}

{% docs id_abonnement %}
Clé de substitution identifiant le type d'abonnement du client (périodicité, facturation digitale, mode de paiement).
{% enddocs %}

{% docs id_motif %}
Clé de substitution identifiant le motif de résiliation du client (catégorie et raison de churn).
{% enddocs %}
