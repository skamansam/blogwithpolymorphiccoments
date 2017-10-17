//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

var editNode = (nodeId) => {
  document.querySelector(nodeId).querySelectorAll('.editable').forEach( (node)=> {
    node.onblur = ()=> {
      saveData(node)
    }
    node.setAttribute('contentEditable', 'true')
  })
}
var saveData = (node) => {
  console.info(node)
  const url = node.getAttribute('src')
  const data = new FormData()
  const request = new XMLHttpRequest();
  data.append(node.getAttribute('property'), node.innerHtml)
  console.info(url, data)
  request.open("PATCH", url);
  request.send(data)
}