function getData() {
                var data = {};
                $("#formILCD").serializeArray().map(function (x) {
                	 data[x['name']] = x['value'];
                });
                return data;
            }
            $(document).ready(function () {
                $("form").submit(function () {
                    var data = getData();
                    $(this).find("input[name^='q']").each(function () {
                       $(this).val('');
                  });

                    var result = { };
                    $.each($('form').serializeArray(), function() {
                        result[this.name] = this.value;
                    });
            	// reference to form object
            	var formData = $("#teste").serialize();
            	$(":input[value='']").attr('disabled', true);
            	var input = $("<input />")
            	.attr("type", "hidden")
            	.attr("name", "json").val( JSON.stringify(data) );
            	$('form').append($(input));
            	var input = $("<input />")
            	.attr("type", "hidden")
            	.attr("name", "homologacao").val( JSON.stringify(result) );
            	$('form').append($(input));	
/*               	 var form = this;
                        // for stopping the default action of element
                        e.preventDefault();
                        // mapthat will hold form data
                        var formData = {}
               	 //iterate over form elements   
                        $.each(this, function(i, v){
               	      var input = $(v);
               	      // populate form data as key-value pairs
                             // with the name of input as key and its value as value
               	      formData[input.attr("name")] = input.val();
                       });
                       $.ajax({
                           type: form.attr('method'), // method attribute of form
                           url: form.attr('action'),  // action attribute of form
                           dataType : 'json',
               	    // convert form data to json format
                           data : JSON.stringify(formData),
                        });*/
                });
            });