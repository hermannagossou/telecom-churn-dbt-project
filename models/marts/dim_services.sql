with int_clients_joined as (
    select * from {{ ref('int_clients_joined') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(
        [
            'service_telephonique',
            'lignes_multiples',
            'service_internet',
            'type_internet',
            'securite_en_ligne',
            'sauvegarde_en_ligne',
            'plan_protection_equipement',
            'support_technique_premium',
            'streaming_tv',
            'streaming_films',
            'streaming_musique',
            'donnees_illimitee'
        ]
    ) }} as id,
    service_telephonique,
    lignes_multiples,
    service_internet,
    type_internet,
    securite_en_ligne,
    sauvegarde_en_ligne,
    plan_protection_equipement,
    support_technique_premium,
    streaming_tv,
    streaming_films,
    streaming_musique,
    donnees_illimitee
from int_clients_joined