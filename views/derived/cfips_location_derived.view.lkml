include: "/views/derived/persistent/cfips_location_persistent.view.lkml"

view: cfips_location_derived {
  derived_table: {
    sql:  SELECT
        cfips_location.name  AS name,
        cfips_location.lat  AS latitude,
        cfips_location.lng  AS longitude,
        cfips_location.cfips  AS cfips
    FROM `finance_data.cfips_location`
         AS cfips_location
    UNION ALL
    SELECT t.name, t.latitude, t.longitude, t.cfips
        FROM ${cfips_location_persistent.SQL_TABLE_NAME} AS t
    WHERE t.cfips > 0
    GROUP BY 1;;
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
