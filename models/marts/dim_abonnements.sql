with int_clients_joined as (
    select * from {{ ref('int_clients_joined') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['periodicite', 'facturation_digitale', 'mode_paiement']) }} as id,
    periodicite,
    facturation_digitale,
    mode_paiement
from int_clients_joined