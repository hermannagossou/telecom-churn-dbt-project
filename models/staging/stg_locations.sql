with source as (

    select * from {{ source('churn', 'locations') }}

),

renamed as (

    select distinct
        trim(`location id`) as id,
        trim(`customer id`) as id_client,
        trim(city) as ville,
        trim(state) as etat,
        trim(country) as pays,
        `zip code` as code_postal,
        latitude/1000000 as latitude,
        longitude/1000000 as longitude
    from source
)

select * from renamed

