with stg_demographics as (
    select * from {{ ref('stg_demographics') }}
),

stg_services as (
    select * from {{ ref('stg_services') }}
)

select
    d.id,
    d.genre,
    d.age,
    s.anciennete,
    case
        when d.age < 30 then 'Jeune'
        when d.age between 30 and 60 then 'Adulte'
        else 'Senior'
    end as niveau_maturite,
    d.personne_agee,
    d.personne_mariee,
    d.personne_a_charge,
    d.nombre_personne_a_charge
from stg_demographics d
left join stg_services s
    on d.id = s.id_client