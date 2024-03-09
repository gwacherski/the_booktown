// Dentro do seu arquivo de scripts JavaScript
$(document).on('submit', '#new_review', function(event) {
  event.preventDefault();

  $.ajax({
    url: $(this).attr('action'),
    method: $(this).attr('method'),
    data: $(this).serialize(),
    success: function(response) {

      $('#reviews').append(response);

      $('#new_review')[0].reset();
    },
    error: function(xhr, status, error) {

      console.error(xhr.responseText);
    }
  });
});
