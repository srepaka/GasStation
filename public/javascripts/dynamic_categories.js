var loadCategories;
loadCategories = function() {
	entry_type_id = $('#transaction_entry_type_id option:selected').text();
	entry_type_value = $('#transaction_entry_type_id').val();
	
	entry_categories_api = "/api/v1/entry_types/" + entry_type_value;

	$.ajax({
		url: entry_categories_api,
		type: 'GET',
		datatype: "json",
		success: function(response){
			var appenddata;
			$.each(response, function(key,value) {
				appenddata += "<option value='" + value.id + "'>" + value.category + "</option>";
			});
			$("#transaction_entry_category_id").empty()
			$("#transaction_entry_category_id").append(appenddata)
		},
		error: function(response) {
			console.log(response);
		}
	});
};

$("#transaction_entry_type_id").on("change", loadCategories);
$(document).ready(loadCategories);
$(document).on('page:load', loadCategories);
