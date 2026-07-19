select
    *
from {{ ref('stg_services') }}
where montant_charge_mensuel < 0
    or montant_charge_total < 0
    or montant_remboursements_total < 0
    or montant_charge_donnees_supplementaire < 0
    or nombre_moyen_gb_telecharge_par_mois < 0
