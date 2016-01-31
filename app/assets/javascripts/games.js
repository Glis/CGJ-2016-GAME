$(document).ready(function(){
  var $startInput;
  var $spellInput;
  var $spellSubmit;

  var $minion;
  var turns = [];
  var current_turn = 0;
  var spellLength;

  $startInput = $(".start-input");
  $spellInput = $(".spell-input");

  function findPosition(position) {
    return $('.minion').filter(function(){
      return $(this).data("position") == position
    })
  }

  function changeTurn() {
    var $turn;
    var cyclic_turn;

    //Eliminar el turno anterior
    for(var i=0; i<turns.length; i++){
      turns[i].active = false;
    }
    $('.minion').each(function(index){
      $(this).css({'background-color':'black', 'color':'white'});
    });

    //Crear turno nuevo
    cyclic_turn = (current_turn % turns.length)
    turns[cyclic_turn].active = true

    $turn = findPosition(cyclic_turn + 1);
    $turn.css({'background-color':'white', 'color':'black'});
    current_turn++;
  }

  $('.many-minions').focus();

  if($startInput.length) {
    //En la vista de share_links
    $(document).keypress(function(e) {
        if(e.which == 13) {
          if($startInput.val().toLowerCase() == "start") {
            $(location).attr('href', $startInput.data('url'))
          }
        }
    });
  }

  if($spellInput.length) {
    //En la vista game start!
    spellLength = parseInt($(".game").data("spell-length"), 10);
    $spellSubmit = $(".spell-submit");

    //Obtiene los turnos del DOM
    $minion = $('.minion');
    $minion.each(function(index){
      turns.push({
        position : $(this).data('position'),
        minionName : $(this).data('name'),
        active: false
      })
    });
    //Primer Turno
    changeTurn();

    $spellInput.keydown(function(e) {
        if (e.keyCode === 8 || e.keyCode === 37 || e.keyCode === 38 || e.keyCode === 39 || e.keyCode === 40) {
            e.preventDefault();
            return false;
        } else if(e.keyCode === 13) {
          e.preventDefault();
          $spellSubmit.click();
          return false;
        };
    });

    $spellInput.keyup(function(e) {
      if (e.keyCode != 8 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40 && e.keyCode != 13) {
        changeTurn();
      }
    });
  }
});
