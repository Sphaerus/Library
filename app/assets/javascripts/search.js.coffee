$(document).ready ->
	removeGarbage = ->
		$(".comment-box p").remove()
		$(".removable").remove()
	
	insertComment = (htmlElement) ->
		$(".comment-box").append(htmlElement)		
		
	$(".comment-box").append("<p>Wprowadź szukaną frazę.</p>")
			
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
					bookCount = 0
					for book in data
						bookCount++
						htmlToInsert += "<tr class='removable'><td><a href='/books/#{book.id}'>#{book.title}<td>#{book.author}<td>#{book.isbn}<td>#{book.publishing_date}<td>#{book.amount}</tr>"
					if bookCount == 0
						removeGarbage()
						htmlToInsert = "<p>Podana fraza nie została odnaleziona.</p>"
						insertComment(htmlToInsert)	
					else		
						$(".table").append(htmlToInsert)