with int_localisations_joined as (
    select * from {{ ref('int_localisations_joined') }}
)

select distinct
    id,
    ville,
    etat,
    pays,
    code_postal,
    latitude,
    longitude,
    population
from int_localisations_joined