$ ->
  $("div#movie_list").dblclick (e) ->
    [x, y] = positionOfNewBlock(e)
    block = $("<div class='block' style='left: #{x}px; top: #{y}px;' />")
    $(e.target).append(block)

positionOfNewBlock = (e) ->
  canvas = $(e.target)
  x = e.pageX - canvas.position().left
  y = e.pageY - canvas.position().top 
  [x, y]
