with source as (

    select * from {{ source('churn', 'services') }}

),

renamed as (

    select
        trim(`service id`) as id,
        trim(`customer id`) as customer_id,
        `tenure in months` as anciennete,
        `phone service` as service_telephonique,
        `multiple lines` as lignes_multiples,
        `internet service` as service_internet,
        coalesce(
            nullif(
                trim(`internet type`), 'None'
            ), 
            'Non Renseigné'
        ) as type_internet,
        `online security` as securite_en_ligne,
        `online backup` as sauvegarde_en_ligne,
        `device protection plan` as plan_protection_equipement,
        `premium tech support` as support_technique_premium,
        `streaming tv` as streaming_tv,
        `streaming movies` as streaming_films,
        `streaming music` as streaming_musique,
        `unlimited data` as donnees_illimitee,
        contract as periodicite,
        `paperless billing` as facturation_digitale,
        `payment method` as mode_paiement,
        `monthly charge` as montant_charge_mensuel,
        `total charges` as montant_charge_total,
        `total refunds` as montant_remboursements_total,
        `total extra data charges` as montant_charge_donnees_supplementaire,
        `avg monthly gb download` as nombre_moyen_gb_telecharge_par_mois
    from source

)

select * from renamed

