SELECT

  (tolls_amount + fare_amount)      AS fare_amount,
  DAYOFWEEK(pickup_datetime)        AS dayofweek,
  HOUR(pickup_datetime)             AS hourofday,
  pickup_longitude                  AS pickuplon,
  pickup_latitude                   AS pickuplat,
  dropoff_longitude                 AS dropofflon,
  dropoff_latitude                  AS dropofflat,
  passenger_count*1.0               AS passengers, --???
  CONCAT(
      STRING(pickup_datetime),
      STRING(pickup_longitude),
      STRING(pickup_latitude),
      STRING(dropoff_latitude), 
      STRING(dropoff_longitude)
  )                                 AS key,
  pickup_datetime || pickup_longitude || pickup_latitude || dropoff_latitude || dropoff_longitude as key_alt

FROM [nyc-tlc:yellow.trips]

WHERE
  trip_distance > 0
  AND fare_amount >= 2.5
  AND pickup_longitude > -78
  AND pickup_longitude < -70
  AND dropoff_longitude > -78
  AND dropoff_longitude < -70
  AND pickup_latitude > 37
  AND pickup_latitude < 45
  AND dropoff_latitude > 37
  AND dropoff_latitude < 45
  AND passenger_count > 0
