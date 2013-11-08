$(document).ready(function(){

  $('pre').addClass('prettyprint');
  prettyPrint();

  var titles = $('h1, h2, h3');
  var index = 0;

  $.each(titles, function(){
    if( $(this).position().top > $(document).scrollTop() ) {
      return false;
    }
    index++;
  });
  
  $(window).keyup(function(e){
    if(e.keyCode == 13 || e.keyCode == 39 || e.keyCode == 74) {
      if(titles.length > index) {
        index++;
      }
      $('html').scrollTo($(titles[index]),200);
    }else if(e.keyCode == 37 || e.keyCode == 75){
      if(index != 0) {
        index--;
      }
      $('html').scrollTo($(titles[index]),200);
    }
  });
});
