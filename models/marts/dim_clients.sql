with int_clients_joined as (
    select * from {{ ref('int_clients_joined') }}
)

select distinct
    id,
    genre,
    age,
    anciennete,
    niveau_maturite,
    personne_agee,
    personne_mariee,
    personne_a_charge,
    nombre_personne_a_charge
from int_clients_joined
