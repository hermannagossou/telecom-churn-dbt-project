select
    *
from {{ ref('stg_status') }}
where score_satisfaction not between 1 and 5