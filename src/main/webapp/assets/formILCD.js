function getData() {
	var data = {};
	$("#formILCD").serializeArray().map(function(x) {
		data[x['name']] = x['value'];
	});
	return data;
}
$(document).ready(
		
		
	function() {
		$("form").submit(
				function() {
					var data = getData();
					$(this).find("input[name^='q']").each(function() {
						$(this).val('');
					});

					var result = {};
					$.each($('form').serializeArray(), function() {
						result[this.name] = this.value;
					});
					
					var authors = $('.aut').serializeArray();
					var mails = $('.mail').serializeArray();
					var input = $("<input />").attr("type", "hidden").attr(
							"name", "authors").val(JSON.stringify(authors));
					$('form').append($(input));
					var input = $("<input />").attr("type", "hidden").attr(
							"name", "emails").val(JSON.stringify(mails));
					$('form').append($(input));
					// reference to form object
					$(":input[value='']").attr('disabled', true);
					var input = $("<input />").attr("type", "hidden").attr(
							"name", "json").val(JSON.stringify(data));
					$('form').append($(input));
					var input = $("<input />").attr("type", "hidden").attr(
							"name", "ilcd").val(JSON.stringify(result));
					$('form').append($(input));

				});
	});