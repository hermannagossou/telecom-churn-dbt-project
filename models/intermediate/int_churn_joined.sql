with int_clients_joined as (
    select * from {{ ref('int_clients_joined') }}
),

int_localisations_joined as (
    select * from {{ ref('int_localisations_joined') }}
)

select 
    c.id as id_client,
    {{ dbt_utils.generate_surrogate_key(['l.ville', 'l.etat', 'l.pays', 'l.code_postal', 'l.population']) }} as id_localisation,
    {{ dbt_utils.generate_surrogate_key(
        [
            'c.service_telephonique',
            'c.lignes_multiples',
            'c.service_internet',
            'c.type_internet',
            'c.securite_en_ligne',
            'c.sauvegarde_en_ligne',
            'c.plan_protection_equipement',
            'c.support_technique_premium',
            'c.streaming_tv',
            'c.streaming_films',
            'c.streaming_musique',
            'c.donnees_illimitee'
        ]
    ) }} as id_service,
    {{ dbt_utils.generate_surrogate_key(['c.periodicite', 'c.facturation_digitale', 'c.mode_paiement']) }} as id_abonnement,
    {{ dbt_utils.generate_surrogate_key(['c.categorie_churn', 'c.raison_churn']) }} as id_motif,
    c.montant_charge_mensuel,
    c.montant_charge_total,
    c.montant_remboursements_total,
    c.montant_charge_donnees_supplementaire,
    c.nombre_moyen_gb_telecharge_par_mois,
    c.score_satisfaction,
    c.statut_client
from int_clients_joined c
left join int_localisations_joined l
    on c.id = l.id_client