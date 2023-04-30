import $ from 'jquery'
import DataTable from "datatables.net"

window.DataTable = DataTable

$(document).on('turbo:load', function(event) {
  $('.datatable').each(function() {
    $(this).dataTable($(this).data('dt-config'));
  })
});