select
    *
from {{ ref('stg_locations') }}
where length(cast(code_postal as string)) != 5