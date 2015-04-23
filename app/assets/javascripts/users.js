ready = function(){
	$('#editprofile').on('click',function(){
			$("#myModalBox").modal('show');
	})
	
	$('.senddata').on('click', function(){
		var container = $(this).attr('data-input'),
			elements = getInputsList(container),
			mass = {};
		console.log(elements.length);
		for (var i = 0; i < elements.length; i++) {

            var $this = $(elements[i]),
        		val = undefined;

            // Если имя имеет [] то шлём серверу массив.
            if ($this.attr('name').indexOf('[]') !== -1) {
                // Если массив для хранения выбранных елементов не создан создадим его.
                if (mass[$this.attr('name')] == undefined) {
                    mass[$this.attr('name')] = [];
                }
            }

            if ($this.attr('type') == 'checkbox' && $this.is(':checked')) {
                val = $this.val();
            } else if ($this.attr('type') != 'checkbox') {
                val = $this.val();
            }

            if (typeof(mass[$this.attr('name')]) == 'object' && val != undefined) {
                mass[$this.attr('name')].push(val);
            } else if (val != undefined) {
                mass[$this.attr('name')] = val;
            }
        }

		var url = $(this).attr('data-link')
		$.ajax({
            type: "PUT",
            url: url,
            data: mass,
            dataType: 'script',
        	success: function (data) {
            }
      	})
	})
	
	/**
     * Вытащить все инпуты из указанного контейнера
     */
    getInputsList = function(inputs_container) {
        return $('input[type="text"], input[type="password"], input[type="hidden"], input[type="checkbox"], input[type="radio"]:checked, select, textarea', $(inputs_container));
    };
}

$(document).on('page:load',ready)
$(document).ready(ready)