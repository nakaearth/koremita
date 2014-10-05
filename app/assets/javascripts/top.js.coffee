$ ->
  $("div#movie_list").dblclick (e) ->
    canvas = $(e.target)
    x = e.pageX - canvas.position().left
    y = e.pageY - canvas.position().top
    block = $("<div class='block' style='left: #{x}px; top: #{y}px;' />")
    canvas.append(block)
