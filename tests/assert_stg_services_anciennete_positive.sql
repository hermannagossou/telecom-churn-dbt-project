select
    *
from {{ ref('stg_services') }}
where anciennete < 0