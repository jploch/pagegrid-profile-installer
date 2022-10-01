$(document).ready(function () {
  // add Style Tab to field settings (needs moving because pw adds all config to input tab)
  if($('.site_styles').length) {
  $('#ProcessFieldEdit .site_styles').hide();

  $('#ProcessFieldEdit .Inputfields').first().prepend($('.site_styles'));

  $('#_inputfieldConfig').parent().after('<li class="styleTab"><a href="#site_styles" id="_site_styles">Styles</a></li>');

  $("#ProcessFieldEdit .WireTabs li a").click(function (e) {
    e.preventDefault();
    var id = $(this).attr('id');
    var target = id.substring(1, id.length);
    console.log(id);
    
    localStorage.setItem("tabActive", id);
    
    $('#ProcessFieldEdit .WireTabs li').removeClass('uk-active');
    $(this).parent().addClass('uk-active');

    // needed for default theme
    $('#ProcessFieldEdit .WireTabs li a').removeClass('on');
    $(this).addClass('on');

    $("#ProcessFieldEdit").find('.InputfieldWrapper').hide();
    $("#ProcessFieldEdit").contents().find('#' + target).show();

  });

  $('#ProcessFieldEdit .uk-tab').tabs("refresh");
  
  
// Remeber open tab on dynamically moved tab
  if (!(localStorage.getItem("tabActive") === null)) {
  var clickId = localStorage.getItem("tabActive");
  console.log("clickId" + clickId);
  
    if(clickId == "_site_styles") {
      $('#ProcessFieldEdit').hide();
  setTimeout(function(){ 
    $('#ProcessFieldEdit').show();
     $("#" + clickId).trigger('click'); 
    console.log("trigger" + clickId);
  }, 300);
}
    
    }
    
    }

// hide container template for template_id fieldsettings
  $('#wrap_Inputfield_template_id option').filter(function () { return $(this).html() == "pg_container"; }).remove();
  

});
