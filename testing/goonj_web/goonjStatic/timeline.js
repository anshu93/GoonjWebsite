    function changeImage() {

        if (document.getElementById("arrow").src == "/static/arrowdown.png") 
        {
            document.getElementById("arrow").src = "/static/arrowup.png";
        }
        else 
        {
            document.getElementById("arrow").src = "/static/arrowdown.png";
        }
    }