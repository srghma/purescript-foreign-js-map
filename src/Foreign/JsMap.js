// from https://hackernoon.com/how-to-map-a-map-12c6ef1c5b2e
exports._mapWithKey = function(callback, map) {
  return Array.from(map, function(two) { return callback(two[0], two[1]) })
}
