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

  $(Remote.messaging).on('received', function(event, data) {
    let { body: body, created_at: createdAt } = data.message;
    let { uid } = data.user;
    let html = `<li class='messages-list-item'>
                  <div class='messages-list-item-name'>
                    ${ uid }
                  </div>
                  <div class='messages-list-item-body'>
                    ${ body }
                    <span class='messages-list-item-timestamp'>
                      ${ createdAt }
                    </span>
                  </div>
                </li>`;

    $('#messages-list').append($(html));
  });
});
