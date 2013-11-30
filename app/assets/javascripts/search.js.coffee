$(document).ready ->
	removeGarbage = ->
		$(".comment-box p").remove()
		$(".removable").remove()
	
	insertComment = (htmlElement) ->
		$(".comment-box").append(htmlElement)		
		
	$(".comment-box").append("<p>Wprowadź szukaną frazę</p>")
			
	$('[data-role="search-input"]').keyup ->
		query = $(this).val()
		htmlToInsert = null
		if query == ""
			removeGarbage()
			htmlToInsert = "<p>Wprowadź szukaną frazę.</p>"
			insertComment(htmlToInsert)
		else if query.length < 3
			removeGarbage()
			htmlToInsert = "<p>Wprowadź przynajmniej 3 znaki.</p>"
			insertComment(htmlToInsert)
		else	
			$.ajax
				dataType: "json"
				type: "get"
				url: "/"
				data: { search: query }
				success: (data)->
					removeGarbage()
					if data != null
						for book in data
							htmlToInsert += "<tr class='removable'><td>#{book.title}<td>#{book.author}<td>#{book.isbn}<td>#{book.publishing_date}</tr>"
					$(".table").append(htmlToInsert)