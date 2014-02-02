colorInputs = []
colorValues = []
colorContainers = []
resultContainer = null

_id = (id) -> document.getElementById id

setValues = (reportResult=yes) ->
  colorValues[0] = colorInputs[0].value
  colorValues[1] = colorInputs[1].value
  resultValue = mix colorValues[0], colorValues[1];
  colorContainers[0].style.backgroundColor = colorValues[0]
  colorContainers[1].style.backgroundColor = colorValues[1]
  document.body.style.backgroundColor = resultValue
  if reportResult then resultContainer.innerHTML = resultValue

onReady = ->
  colorInputs[0] = _id "color1-input"
  colorInputs[1] = _id "color2-input"
  colorContainers[0] = _id "color1"
  colorContainers[1] = _id "color2"
  resultContainer = _id "result"

  setValues no
  colorInputs[0].addEventListener "change", setValues
  colorInputs[1].addEventListener "change", setValues

window.addEventListener "DOMContentLoaded", onReady
