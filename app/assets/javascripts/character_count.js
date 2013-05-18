$(document).ready(function(){
            $(function() {
    $('#doug').keyup(function(){
        ta = $(this);
        if(ta.val().length >= 140){
            ta.val( ta.val().substr(0, 140) );
            $("#characters").text(140-ta.val().length);
        }
        else {
            $("#characters").text(140-ta.val().length);
            if(ta.val().length>=125){
                $("#characters").css('color', 'red');
            }
            else{
                $("#characters").css('color', 'black');
            }
        }
    }); 
});
});