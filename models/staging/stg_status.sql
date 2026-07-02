with source as (

    select * from {{ source('churn', 'status') }}

),

renamed as (

    select distinct
        trim(`status id`) as id,
        trim(`customer id`) as id_client,
        `satisfaction score` as score_satisfaction,
        case
            when trim(`customer status`) = "Churned" then "Résilié"
            when trim(`customer status`) = "Stayed" then "Resté"
            when trim(`customer status`) = "Joined" then "Rejoint"
            else "Non Renseigné"
        end as statut_client,
        case
            when trim(`churn category`) = "Competitor" then "Concurrent"
            when trim(`churn category`) = "Dissatisfaction" then "Insatisfaction"
            when trim(`churn category`) = "Attitude" then "Attitude"
            when trim(`churn category`) = "Price" then "Prix"
            else "Non Renseigné"
        end as categorie_churn,
        trim(`churn reason`) as raison_churn

    from source

)

select * from renamed

