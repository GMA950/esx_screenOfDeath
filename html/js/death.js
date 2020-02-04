$(document).ready(function() {
    $("#container").css('display', 'none');
    var c = 0;
    var i = setInterval(function(){
        $(".loading-page .counter h1").html(c + "%");
        $(".loading-page .counter hr").css("width", c + "%");
      
      
      if(c < 100){
        c++;
      }
      /*if(counter == 101) {
          clearInterval(i);
      }*/
      
    }, 2000);
    window.addEventListener('message', function(event) {
      if (event.data.setDisplay == false) {
        counter = 0;
        c = 0;
      }
      else{
        counter = 0;
        c = 0;
      }
    });
});

    window.onData = function(data) {
      if (data.setDisplay == true) {
        $("#container").css('display', 'flex');
            
      } else {
        $("#container").css('display', 'none');
      }
      
    }


    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            onData(event.data)
        });
    }