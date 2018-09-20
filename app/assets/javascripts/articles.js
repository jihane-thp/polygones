$(document).ready(function(){
    $('select#tab_type').click(
        function(){
          alert("call me called")
        }
    )
}


jQuery(function() {
  var states;

 $('#tab_type').change(function() {
    var country, options;
    country = $('#person_country_id :selected').text();
    options = $(states).filter("optgroup[label=" + country + "]").html();
    console.log(options);
    if (options) {
      return $('#person_state_id').html(options);
    } else {
      return $('#person_state_id').empty();
    }
  });
});
