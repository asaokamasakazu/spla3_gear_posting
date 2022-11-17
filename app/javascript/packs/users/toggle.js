$(function() {
  $('[name="toggle"]:radio').change( function() {
    if($('[id=toggle_posts]').prop('checked')){
      $('.toggle').hide();
      $('.toggle-posts').show();
    } else if ($('[id=toggle_favorites]').prop('checked')) {
      $('.toggle').hide();
      $('.toggle-favorites').show();
    } 
  });
});
