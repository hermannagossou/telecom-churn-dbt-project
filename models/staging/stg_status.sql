with source as (

    select * from {{ source('churn', 'status') }}

),

renamed as (

    select
        trim(`status id`) as id,
        trim(`customer id`) as customer_id,
        `satisfaction score` as score_satisfaction,
        `customer status` as statut_client,
        `churn category` as categorie_churn,
        `churn reason` as raison_churn

    from source

)

select * from renamed

