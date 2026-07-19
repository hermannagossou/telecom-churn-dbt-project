select
    *
from {{ ref('stg_locations') }}
where latitude not between 32.5 and 42.0
    or longitude not between -124.5 and -114.0