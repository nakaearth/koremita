// Generated by CoffeeScript 1.8.0
var positionOfNewBlock;

$(function() {
  return $("div#movie_list").click(function(e) {
    var block, x, y, _ref;
    _ref = positionOfNewBlock(e), x = _ref[0], y = _ref[1];
    block = $("<div class='block' style='left: " + x + "px; top: " + y + "px;'>" + gon.user_name + "</div>");
    return $(e.target).append(block);
  });
});

positionOfNewBlock = function(e) {
  var canvas, x, y;
  canvas = $(e.target);
  x = e.pageX - canvas.position().left;
  y = e.pageY - canvas.position().top;
  return [x, y];
};
