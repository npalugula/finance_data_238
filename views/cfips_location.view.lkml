view: cfips_location {
  sql_table_name: `finance_data.cfips_location`
    ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cfips {
    type: number
    sql: ${TABLE}.cfips ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lng ;;
  }

  set: detail {
    fields: [cfips, name, lng, lat, location]
  }

  measure: is_cfips_over_50000 {
    type: sum
    value_format_name: decimal_2
    label:"is_cfips_over_50000"
    sql: case  when ${TABLE}.cfips > 50000 then 55000 else 45000 end ;;
    link: {
      label: "First Link"
      url:"https://gcpm238.cloud.looker.com/looks/27"
    }

    #  html:
    # <div>
    #<a href="#drillmenu" target="_self">
    #{{ rendered_value }}
    #</a>
    #</div>;;
  }
  measure: is_cfips_over_50000_number {
    type: number
    value_format_name: decimal_2
    label:"is_cfips_over_50000_number"
    sql: case  when ${TABLE}.cfips > 50000 then 75000 else 35000 end ;;
    link:
    {
      label: "Second Link"
      url:"https://gcpm238.cloud.looker.com/looks/27"
    }


  }

}
