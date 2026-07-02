with source as (

    select * from {{ source('churn', 'populations') }}

),

renamed as (

    select distinct
        `zip code` as code_postal,
        safe_cast(
            regexp_replace(
                trim(population),
                r'[^0-9]',
                ''
            ) as int64
        ) as population

    from source

)

select * from renamed

