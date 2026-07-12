with stg_services as (
    select * from {{ ref('stg_services') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['periodicite', 'facturation_digitale', 'mode_paiement']) }} as id,
    periodicite,
    facturation_digitale,
    mode_paiement
from stg_services