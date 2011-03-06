/* Detect if the page content becomes more
---------------------------------------------- */
$(window).bind('scroll', function (){
  if (currentDocHeight != document.height) {
    _instance.refreshTotalCounter();
    currentDocHeight = document.height;
  }
});

/* Get Selection
---------------------------------------------- */

function getSelected() {
  if(window.getSelection) { return window.getSelection(); }
  else if(document.getSelection) { return document.getSelection(); }
  else {
    var selection = document.selection && document.selection.createRange();
    if(selection.text) { return selection.text; }
    return false;
  }
  return false;
}

getSelected().toString(); // convert to string

// Also, http://plugins.jquery.com/project/field_selection, this is a great plugin


// resize image
function resizeImage(url, width, height, callback) {
  var sourceImage = new Image();

  sourceImage.onload = function() {
    // Create a canvas with the desired dimensions
    var canvas = document.createElement("canvas");
    canvas.width = width;
    canvas.height = height;

    // Scale and draw the source image to the canvas
    canvas.getContext("2d").drawImage(sourceImage, 0, 0, width, height);

    // Convert the canvas to a data URL in PNG format
    callback(canvas.toDataURL());
  }

  sourceImage.src = url;
}