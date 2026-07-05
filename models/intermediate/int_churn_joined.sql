with stg_services as (
    select * from {{ ref('stg_services') }}
),

int_localisations_joined as(
    select * from {{ ref('int_localisations_joined') }}
),

stg_status as (
    select * from {{ ref('stg_status') }}
)

select 
    {{ dbt_utils.generate_surrogate_key(['s.id_client', 's.id']) }} as id,
    s.id_client,
    {{ dbt_utils.generate_surrogate_key(['l.ville', 'l.etat', 'l.pays', 'l.code_postal', 'l.population']) }} as id_localisation,
    {{ dbt_utils.generate_surrogate_key(
        [
            's.service_telephonique',
            's.lignes_multiples',
            's.service_internet',
            's.type_internet',
            's.securite_en_ligne',
            's.sauvegarde_en_ligne',
            's.plan_protection_equipement',
            's.support_technique_premium',
            's.streaming_tv',
            's.streaming_films',
            's.streaming_musique',
            's.donnees_illimitee'
        ]
    ) }} as id_service,
    {{ dbt_utils.generate_surrogate_key(['s.periodicite', 's.facturation_digitale', 's.mode_paiement']) }} as id_abonnement,
    {{ dbt_utils.generate_surrogate_key(['st.categorie_churn', 'st.raison_churn']) }} as id_motif,
    s.montant_charge_mensuel,
    s.montant_charge_total,
    s.montant_remboursements_total,
    s.montant_charge_donnees_supplementaire,
    s.nombre_moyen_gb_telecharge_par_mois,
    st.score_satisfaction,
    st.statut_client
from stg_services s
left join int_localisations_joined l
    on s.id_client = l.id_client
left join stg_status st
    on s.id_client = st.id_client