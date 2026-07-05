with stg_locations as (
    select * from {{ ref('stg_locations') }}
),

stg_populations as (
    select * from {{ ref('stg_populations') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['l.ville', 'l.etat', 'l.pays', 'l.code_postal', 'p.population']) }} as id,
    l.id_client,
    l.ville,
    l.etat,
    l.pays,
    l.code_postal,
    l.latitude,
    l.longitude,
    p.population
from stg_locations l
left join stg_populations p
    on l.code_postal = p.code_postal