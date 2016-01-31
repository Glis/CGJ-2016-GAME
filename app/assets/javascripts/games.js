$(document).ready(function(){
  var $startInput;
  var $spellInput;
  var $spellSubmit;
  var $resultBackButton;
  var $codeSubmit;
  var $minionGame;
  var $code;
  var $timer;
  var $time;

  var $minion;
  var turns = [];
  var current_turn = 0;
  var skiped = 0;
  var spellLength;

  var tick;
  var tock;
  var seconds = 0;
  var gameId;

  function findPosition(position) {
    return $('.minion').filter(function(){
      return $(this).data("position") == position
    })
  }

  function changeTurn() {
    var $turn;
    var cyclic_turn;
    var changed;

    //Eliminar el turno anterior
    for(var i=0; i<turns.length; i++){
      turns[i].active = false;
    }
    $('.minion').each(function(index){
      $(this).css({'background-color':'black', 'color':'white'});
    });

    //Crear turno nuevo
    cyclic_turn = (current_turn % turns.length);

    if(turns[cyclic_turn].turn_count < turns[cyclic_turn].minionWord.length) {
      //Es posible crearle un turno
      turns[cyclic_turn].active = true;
      turns[cyclic_turn].turn_count++;
      $turn = findPosition(cyclic_turn + 1);
      $turn.css({'background-color':'white', 'color':'black'});
      changed = true;
    } else {
      changed = false;
    }
    current_turn++;
    return changed;
  }

  function gameActive(gameId, callback) {
    var active;
    $.get( "/games/"+gameId+"/get", function( data ) {
      if(data.status == "active"){
        callback(true);
      } else {
        callback(false);
      }
    });
  }

  $('.many-minions').focus();

  $startInput = $(".start-input");
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

  $code = $("#code");
  if($code.length) {
    //En la vista inicial!
    $codeSubmit = $(".code-submit");
    $code.keydown(function(e) {
      if(e.keyCode === 13) {
        if($(this).val().toLowerCase()=="new") {
          e.preventDefault();
          $(location).attr('href', '/games/new')
          return false;
        } else {
          e.preventDefault();
          $codeSubmit.click();
          return true;
        }
      }
    });
  }

  $minionGame = $(".minion-game");
  if($minionGame.length) {
    //En la vista de game del minion!
    gameId = $minionGame.data("game");
    tock = setInterval(function(){
      gameActive(gameId, function(isActive) {
        if(isActive) {
          console.log("El juego continua!");
        }else{
          alert("FINISH!");
          clearInterval(tock);
        }
      });
    }, 500);
  }

  $spellInput = $(".spell-input");
  if($spellInput.length) {
    //En la vista game start!
    spellLength = parseInt($(".game").data("spell-length"), 10);
    $spellSubmit = $(".spell-submit");
    $timer = $(".timer");
    $time = $("#time");

    tick = setInterval(function(){
      if($timer.length) {
        $timer.html(seconds);
        $time.val(seconds);
        seconds++;
      }
    }, 1000);

    //Obtiene los turnos del DOM
    $minion = $('.minion');
    $minion.each(function(index){
      turns.push({
        position : $(this).data('position'),
        minionName : $(this).data('name'),
        minionWord : $(this).data('word'),
        turn_count: 0,
        active: false,
        die: false
      })
    });
    //Primer Turno
    changeTurn();

    $spellInput.keydown(function(e) {
      if(e.keyCode === 13) {
        e.preventDefault();
        $spellSubmit.click();
        return false;
      } else if (!(e.keyCode >= 48 && e.keyCode <= 90)) {
        e.preventDefault();
        return false;
      }
    });

    $spellInput.keyup(function(e) {
      if (e.keyCode >= 48 && e.keyCode <= 90) {
        while(skiped <= turns.length) {
          if(changeTurn()){
            skiped = 0;
            break;
          } else {
            skiped++;
          }
        }
        if(skiped >= turns.length) {
          $spellSubmit.click();
        }
      }
    });
  } else {
    //EN OTRA VISTA DISTINTA AL MAIN GAME!
  }

  $resultBackButton= $(".result-back-button");
  if($resultBackButton.length){
    $(document).keypress(function(e){
      if(e.keyCode === 13) {
        $resultBackButton[0].click();
      }
    });
  }
});
