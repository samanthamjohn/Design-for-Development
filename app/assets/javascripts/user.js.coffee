$ ->
  $("a.new-link").click((e) ->
    e.preventDefault()
    template = $("#link_form").html()
    index = $(".new-link").attr('id').split("new_link_")[1]
    view = 
      index: index
    $(".new-link").attr('id', "new_link_#{parseInt(index, 10) + 1}")
    $("ul.links").append(Mustache.render(template, view))
  )
