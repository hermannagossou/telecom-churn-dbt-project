with int_churn_joined as (
    select * from {{ ref('int_churn_joined') }}
)

select
    id_client,
    id_localisation,
    id_service,
    id_abonnement,
    id_motif,
    montant_charge_mensuel,
    montant_charge_total,
    montant_remboursements_total,
    montant_charge_donnees_supplementaire,
    nombre_moyen_gb_telecharge_par_mois,
    score_satisfaction,
    statut_client
from int_churn_joined