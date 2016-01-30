$(document).ready(function(){
  var $startInput;

  $startInput = $(".start-input");
  $('.many-minions').focus();

  if($startInput) {
    //Si existe el elemento en el dom.
    $(document).keypress(function(e) {
        if(e.which == 13) {
          if($startInput.val().toLowerCase() == "start") {
            alert("START!");
          }
        }
    });
  }
});
