select
    *
from {{ ref('stg_demographics') }}
where age < 0 or age > 100