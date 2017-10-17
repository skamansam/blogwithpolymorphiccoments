//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

var editNode = (nodeId) => {
  nodes = document.querySelector(nodeId).querySelectorAll('.editable')
  nodes.forEach( (node)=> {
    //console.info("editing: ", node)
    node.setAttribute('contentEditable', 'true')
    node.onfocus = () => {
      let elem = node
      //console.info('Focusing: ', node)
      window.selectedEditor = node
      window.editorToolbar = new editorToolbar(node)
    }
    node.onblur = ()=> {
      saveData(node)
    }
  })
  nodes[0].focus()
}

/**Save the data from the node. The node must have the following attributes:
 * _property_: the attribute name of the object in question. will be the key in the data sent
 * _src_: the API endpoint where the data is sent. should be the update controller this is sent with the PATCH verb, so use up to date browsers.
 * NOTE: this function appends the CSRF data using getCSRFParam(), so that functon should return the correct auth values.
 */
var saveData = (node) => {
  console.info(node)
  const url = node.getAttribute('src')
  const data = new FormData()
  const request = new XMLHttpRequest();
  const csrfData = getCSRFParam()
  const editParam = node.getAttribute('property')
  data.append(editParam, node.innerHtml)
  data.append(csrfData.paramName, csrfData.token)
  console.info(url, data)
  request.open("PATCH", url);
  request.send(data)
}

/** get the correct cross-site request forgery prevention (CSRF) token and return it as an object for 
 * inserting into params sent to the server via AJAX. The value is cached once run, so if you
 * change the csrf header info after page load, you should update this method as well.
 * @return [Object] the params object, with paramName and token as keys
 */
var getCSRFParam = () => {
  // cache csrf params so we don't have to look in the DOM more than once
  // we know we are using Rails, so we can safely assume the csrf values in the
  //   document header aren't going to change after page creation
  if (window.csrfParams)
    return window.csrfParams
  const param = document.querySelector('meta[name="csrf-param"]').getAttribute('content')
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  window.csrfParams = {
    paramName: param,
    token: token
  }
  return window.csrfParams
}

var formatDoc = (cmd, val) => {
  window.editorToolbar.formatDoc(cmd, val)
}
class editorToolbar {

  constructor(elem){
    this.elem = elem
    this.toolbarElement = document.getElementById('edit-toolbar')
    this.attachToolbar()
  }
  attachToolbar(){
    const inserted_node = this.elem.parentNode.insertBefore(this.toolbarElement, this.elem)
    console.log('Attaching toolbar')
  }
  formatDoc(sCmd, sValue) {
    if (this.validateMode()) { document.execCommand(sCmd, false, sValue); this.elem.focus(); }
  }
  validateMode() {
    if (!this.toolbarElement.getElementById('switchMode').checked) { return true ; }
    alert("Uncheck \"Show HTML\".");
    elem.focus();
    return false;
  }
}