
function initViz() {
  var placeholderDiv = document.getElementById("vizContainer");
  var url = "https://public.tableau.com/views/project2_dashboard/Dashboard1?:embed=y&:display_count=yes&publish=yes"
 var viz = new tableau.Viz(placeholderDiv, url);  
}

// Create the viz after the page is done loading