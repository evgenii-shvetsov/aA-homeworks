document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;

    const ctx = canvas.getContext("2d");
    
    ctx.fillStyle = "red"; 
    ctx.fillRect(50,50,200,150);
    

});
