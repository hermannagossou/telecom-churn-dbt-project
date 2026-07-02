with source as (

    select * from {{ source('churn', 'services') }}

),

renamed as (

    select distinct
        trim(`service id`) as id,
        trim(`customer id`) as id_client,
        `tenure in months` as anciennete,
        `phone service` as service_telephonique,
        `multiple lines` as lignes_multiples,
        `internet service` as service_internet,
        case
            when initcap(trim(`internet type`)) = "Cable" then "Câble"
            when upper(trim(`internet type`)) = "DSL" then "DSL"
            when initcap(trim(`internet type`)) = "Fiber Optic" then "Fibre Optique"
            else "Non Renseigné"
        end as type_internet,
        `online security` as securite_en_ligne,
        `online backup` as sauvegarde_en_ligne,
        `device protection plan` as plan_protection_equipement,
        `premium tech support` as support_technique_premium,
        `streaming tv` as streaming_tv,
        `streaming movies` as streaming_films,
        `streaming music` as streaming_musique,
        `unlimited data` as donnees_illimitee,
        case
            when initcap(trim(`contract`)) = "Month-To-Month" then "Mensuel"
            when initcap(trim(`contract`)) = "One Year" then "Annuel"
            when initcap(trim(`contract`)) = "Two Year" then "Biennal"
            else "Non Renseigné"
        end as periodicite,
        `paperless billing` as facturation_digitale,
        case
            when initcap(trim(`payment method`)) = "Bank Withdrawal" then "Prélèvement bancaire"
            when initcap(trim(`payment method`)) = "Mailed Check" then "Chèque envoyé par courrier"
            when initcap(trim(`payment method`)) = "Credit Card" then "Carte de crédit"
            else "Non Renseigné"
        end as mode_paiement,
        `monthly charge` as montant_charge_mensuel,
        `total charges` as montant_charge_total,
        `total refunds` as montant_remboursements_total,
        `total extra data charges` as montant_charge_donnees_supplementaire,
        `avg monthly gb download` as nombre_moyen_gb_telecharge_par_mois
    from source

)

select * from renamed

