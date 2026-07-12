with stg_demographics as (
    select * from {{ ref('stg_demographics') }}
),

stg_services as (
    select * from {{ ref('stg_services') }}
),

stg_status as (
    select * from {{ ref('stg_status') }} 
)

select
    d.id,
    d.genre,
    d.age,
    s.anciennete,
    case
        when d.age < 30 then 'Jeune'
        when d.age between 30 and 60 then 'Adulte'
        else 'Senior'
    end as niveau_maturite,
    d.personne_agee,
    d.personne_mariee,
    d.personne_a_charge,
    d.nombre_personne_a_charge,
    s.service_telephonique,
    s.lignes_multiples,
    s.service_internet,
    s.type_internet,
    s.securite_en_ligne,
    S.sauvegarde_en_ligne,
    s.plan_protection_equipement,
    s.support_technique_premium,
    s.streaming_tv,
    s.streaming_films,
    s.streaming_musique,
    s.donnees_illimitee,
    s.periodicite, 
    s.facturation_digitale, 
    s.mode_paiement,
    s.montant_charge_mensuel,
    s.montant_charge_total,
    s.montant_remboursements_total,
    s.montant_charge_donnees_supplementaire,
    s.nombre_moyen_gb_telecharge_par_mois,
    st.score_satisfaction,
    st.statut_client,
    st.categorie_churn,
    st.raison_churn
from stg_demographics d
left join stg_services s
    on d.id = s.id_client
left join stg_status as st
    on d.id = st.id_client