$ ->
  if $('#sales_total').length > 0
    options =
      valueNames: [ 'name', 'sku', 'quantity', 'sales' ],
      page: 99999

    list = new List('sales_total', options)
    list.sort('sales', { order: 'desc' })

  if $('#days_order_count').length > 0
    options =
      valueNames: [ 'number', 'date', 'quantity' ],
      page: 99999

    list = new List('days_order_count', options)
