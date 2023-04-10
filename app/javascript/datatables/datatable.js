import $ from 'jquery'
import DataTable from "datatables.net-bs5"

window.DataTable = DataTable

$(document).on('turbo:load', function(event) {
  $('.dt').each(function() {
    $(this).DataTable();
  })
});