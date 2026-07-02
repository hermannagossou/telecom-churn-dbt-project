with source as (

    select * from {{ source('churn', 'demographics') }}

),

renamed as (

    select distinct
        trim(`customer id`) as id,
        case
            when trim(gender) = 'Male' then 'Masculin'
            when trim(gender) = 'Female' then 'Féminin'
            else 'Autre'
        end as genre,
        age,
        `senior citizen` as personne_agee,
        married as personne_mariee,
        dependents as personne_a_charge,
        `number of dependents` as nombre_personne_a_charge

    from source

)

select * from renamed

