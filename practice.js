function extend(subClass, superClass) {
  var F = function() {};
  F.prototype = superClass.prototype;
  subClass.prototype = new F();
  subClass.prototype.constructor = subClass;
  
  subClass.superclass = superClass.prototype;
  if (superClass.prototype.constructor == Object.prototype.constructor) {
    superClass.prototype.constructor = superClass;
  }
}

// Prototypal Inheritance
function clone(object) {
  var F = function() {};
  F.prototype = object;
  return new F;
}

function augment(receivingClass, givingClass) {
  for ( methodName in givingClass.prototype) {
    if (!receivingClass.prototype[methodName]) {
      receivingClass.prototype[methodName] = givingClass.prototype[methodName];
    }
  }
}