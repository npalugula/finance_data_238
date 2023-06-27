view: cfips_location_persistent {
  derived_table: {
    sql:
    SELECT
        cfips_location.name  AS name,
        cfips_location.lat  AS latitude,
        cfips_location.lng  AS longitude,
        cfips_location.cfips  AS cfips
    FROM `finance_data.cfips_location`
         AS cfips_location
    GROUP BY
        1,
        2,
        3,
        4
    ORDER BY
        1;;
    persist_for: "1 hour"
  }

  dimension: name {
    type: string
  }

  dimension: latitude {
    type: number
  }

  dimension: longitude {
    type: number
  }

  dimension: cfips {
    type: number
  }
}
