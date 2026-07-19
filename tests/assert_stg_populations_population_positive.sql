select
    *
from {{ ref('stg_populations') }}
where population < 0
