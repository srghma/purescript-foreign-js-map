exports.empty = function() {
  return new Map()
}

exports._delete = function(value, map) {
}

exports._clear = function(map) {
  map.clear()
}

exports._delete = function(key, map) {
  return map.delete(key)
}

exports._get = function(key, map) {
  return map.get(key)
}

exports._has = function(key, map) {
  return map.has(key)
}

exports._set = function(key, value, map) {
  return map.set(key, value)
}

exports._keys = function(map) {
  return map.keys()
}

exports._values = function(map) {
  return map.values()
}

exports._entries = function(map) {
  return map.entries()
}

exports._forEach = function(callback, map) {
  map.forEach(callback)
}
