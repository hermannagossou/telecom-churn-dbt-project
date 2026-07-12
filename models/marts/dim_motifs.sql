with stg_status as (
    select * from {{ ref('stg_status') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['categorie_churn', 'raison_churn']) }} as id,
    categorie_churn,
    raison_churn
from stg_status