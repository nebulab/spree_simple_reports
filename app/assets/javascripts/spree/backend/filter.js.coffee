$ ->
  if $('#sales_total').length > 0
    options =
      valueNames: [ 'name', 'sku', 'quantity', 'sales' ],
      page: 99999

    list = new List('sales_total', options)
    list.sort('sales', { order: 'desc' })
