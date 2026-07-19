select
    *
from {{ ref('stg_demographics') }}
where nombre_personne_a_charge < 0