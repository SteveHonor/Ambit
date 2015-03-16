$( '#delete_fine' ).click(function() {
  var id    = $('#delete_fine i').attr('id');
  var table = $('body');
  var path  = window.location.pathname;

  var request = $.ajax({
    url: '/fines/'+id,
    type: 'DELETE',
    async: false,
  });

  request.success( function(response, status) {
    table.load(path);
    window.location.reload(true);
  });
})
