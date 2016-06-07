$ ->
  if $('#sales_total').length > 0
    options =
      valueNames: [ 'name', 'sku', 'quantity', 'sales' ]

    list = new List('sales_total', options)
    list.sort('sales', { order: 'desc' })
