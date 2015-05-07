(function() {
  "use strict";

  function user_timeout() {
    window.setTimeout(function() {
      $.get("/logout", function(response) {
        if(response.user_was_logged) {
          alert("Você foi deslogado por 10 minutos de inatividade.");
        }
      });
    }, 20*60*1000); // 10 minutes
  }


  function set_events() {
    user_timeout();
  }


  $(document).ready(set_events);
  $(document).on("page:load", set_events);
})();