document.addEventListener('turbolinks:load', function() {
  document.getElementById('new_message')
    .addEventListener('submit', function(event) {
      event.preventDefault();
      user = document.getElementById('message_user').value;
      body = document.getElementById('message_body').value;
      App.messages.perform('send_message', {'user': user, 'body': body});
      document.getElementById('message_body').value = "";
    });
});
