var panel = $('.at-accordion__panel');

panel.click( function(){
  // console.log('click');
  panel.removeClass('is-open');

  $(this).addClass('is-open');
});
