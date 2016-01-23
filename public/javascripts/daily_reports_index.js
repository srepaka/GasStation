getNumber = function(value) {
	return parseFloat(value.replace(/[^0-9.-]+/g,''));
}

function flagDifference(idCell1, idCell2)
{
	return function()
	{
		var table = document.getElementById("reports_table");
		for (var i = 0, row; row = table.rows[i]; i++)
		{
			var bgColor = "LightGreen";
			var cell1 = table.rows[i].cells.namedItem(idCell1);
			var cell2 = table.rows[i].cells.namedItem(idCell2);
			if (cell1 != null) 
			{
				if (Math.abs(getNumber(cell1.textContent) - getNumber(cell2.textContent)) >= 5)
				{
					bgColor = "LightCoral";
				}		
				cell1.style.backgroundColor = bgColor;
				cell2.style.backgroundColor = bgColor;
			}	
		}
	}
}

$(document).ready(flagDifference('id_TotalSales', 'id_TotalReceipts'));
$(document).ready(flagDifference('id_ExpectedDebit', 'id_ActualDebit'));
$(document).ready(flagDifference('id_ExpectedCash', 'id_CountedCash'));

