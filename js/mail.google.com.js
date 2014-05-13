var visibleByDefault = false

prependStyles()
var intervalId = setInterval(checkLoadStatus, 3000)

function prependStyles() {
  var buttonStyles = document.createElement('style')
  buttonStyles.setAttribute('id', 'rapportive-button-styles')
  buttonStyles.innerText = '#rapportive-toggle { width: 10px; height: 10px; display: inline-block; text-indent: -3000px; background-color: grey; margin-right: -10px; } #rapportive-toggle.active { background-color: green; }'
  document.getElementsByTagName('head')[0].appendChild(buttonStyles)

  var displayStyles = document.createElement('style')
  displayStyles.setAttribute('id', 'rapportive-display-styles')
  displayStyles.innerText = 'td.Bu.y3 { display: none; }'
  document.getElementsByTagName('head')[0].appendChild(displayStyles)
}

function checkLoadStatus() {
  if($('#canvas_frame').contents().find('#rapportive-status').length > 0) {
    clearInterval(intervalId)
    $('#canvas_frame').contents().find('#rapportive-status').parent().prepend('<a id="rapportive-toggle" href="#">show/hide</a>')
    $('#canvas_frame').contents().find('#rapportive-status').parent().delegate('#rapportive-toggle', 'click', function() {
      toggleRapportive()
    })
    if(visibleByDefault) toggleRapportive()
  }
  else return false
}

function toggleRapportive() {
  $('#canvas_frame').contents().find('#rapportive-toggle').toggleClass('active')
  if($('#canvas_frame').contents().find('#rapportive-toggle').hasClass('active'))
    $('#canvas_frame').contents().find('#rapportive-display-styles').html('td.Bu.y3 { display: block; }')
  else
    $('#canvas_frame').contents().find('#rapportive-display-styles').html('td.Bu.y3 { display: none; }')
}
