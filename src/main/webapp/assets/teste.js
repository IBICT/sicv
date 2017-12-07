				$(document).ready(

				function() {
					$("form").submit(
						function() {
		
							var result = {};
							$.each($('form').serializeArray(), function() {
								result[this.name] = this.value;
							});
							
							var perfis = $('.perfis').serializeArray();
							var mails = $('.mail').serializeArray();
							var input = $("<input />").attr("type", "hidden").attr(
									"name", "perfis").val(JSON.stringify(perfis));
							$('form').append($(input));
							// reference to form object
							var input = $("<input />").attr("type", "hidden").attr(
									"name", "emails").val(JSON.stringify(mails));
							$('form').append($(input));
						});
				});