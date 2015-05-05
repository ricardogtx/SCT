(function() {
  "use strict";

  function user_timeout() {
    window.setTimeout(function() {
      $.get("/logout");

      alert("Você foi deslogado por 10 minutos de inatividade.");

    }, 10*60*1000); // 10 minutes
  }


  function set_events() {
    user_timeout();
  }


  $(document).ready(set_events);
  $(document).on("page:load", set_events);
})();