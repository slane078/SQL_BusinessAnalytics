// funtion for loading dashboard from web
function initViz() {
    // variable for our container on HTML
  var placeholderDiv = document.getElementById("vizContainer");
    // URL of dashboard created with data
  var url = "https://public.tableau.com/views/project2_dashboard/Dashboard1?:embed=y&:display_count=yes&publish=yes"
 var viz = new tableau.Viz(placeholderDiv, url);  
}