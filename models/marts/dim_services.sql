with stg_services as (
    select * from {{ ref('stg_services') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(
        [
            's.service_telephonique',
            's.lignes_multiples',
            's.service_internet',
            's.type_internet',
            's.securite_en_ligne',
            's.sauvegarde_en_ligne',
            's.plan_protection_equipement',
            's.support_technique_premium',
            's.streaming_tv',
            's.streaming_films',
            's.streaming_musique',
            's.donnees_illimitee'
        ]
    ) }} as id,
    s.service_telephonique,
    s.lignes_multiples,
    s.service_internet,
    s.type_internet,
    s.securite_en_ligne,
    s.sauvegarde_en_ligne,
    s.plan_protection_equipement,
    s.support_technique_premium,
    s.streaming_tv,
    s.streaming_films,
    s.streaming_musique,
    s.donnees_illimitee
from stg_services s