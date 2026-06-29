with source as (

    select * from {{ source('churn', 'locations') }}

),

renamed as (

    select
        trim(`location id`) as id,
        trim(`customer id`) as customer_id,
        trim(city) as ville,
        trim(state) as etat,
        trim(country) as pays,
        `zip code` as code_postal
    from source
)

select * from renamed

