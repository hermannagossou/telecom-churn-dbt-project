with int_clients_joined as (
    select * from {{ ref('int_clients_joined') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['categorie_churn', 'raison_churn']) }} as id,
    categorie_churn,
    raison_churn
from int_clients_joined