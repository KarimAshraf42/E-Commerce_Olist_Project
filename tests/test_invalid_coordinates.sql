SELECT
    geolocation_lat,
    geolocation_lng
FROM {{ ref('stg_geolocation') }}
WHERE
    geolocation_lat NOT BETWEEN -90 AND 90
    OR geolocation_lng NOT BETWEEN -180 AND 180
