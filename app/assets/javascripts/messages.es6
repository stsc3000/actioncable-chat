$(function() {
  $('#message-form').submit(function(event) {
    event.preventDefault();

    let url = $(this).attr('action');
    let $authenticityToken = $(this).find("input[name='authenticity_token']");
    let $messageBody = $(this).find("textarea[name='message[body]']")
    let data = {
      authenticity_token: $authenticityToken.val(),
      message: {
        body: $messageBody.val()
      }
    };

    $.post(url, data).then(function() {
      $messageBody.val(null);
    });

  });
});
