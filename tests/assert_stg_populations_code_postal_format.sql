select
    *
from {{ ref('stg_populations') }}
where length(cast(code_postal as string)) != 5