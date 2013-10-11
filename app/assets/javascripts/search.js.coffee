$(document).ready ->
	
	$('[data-role="search-input"]').keyup ->
		query = $(this).val()
		htmlToInsert = null
		$.ajax
			dataType: "json"
			type: "get"
			url: "/"
			data: { search: query }
			success: (data)->
				$("td").remove()
				for book in data
					htmlToInsert += "<tr><td>#{book.title}<td>#{book.author}<td>#{book.isbn}<td>#{book.publishing_date}<tr>"
				$(".table").append(htmlToInsert)				 