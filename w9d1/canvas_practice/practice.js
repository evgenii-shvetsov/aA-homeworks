document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;

    const ctx = canvas.getContext("2d");
    
    ctx.fillStyle = "red"; 
    ctx.fillRect(50,75,200,150);
    
    //Phase 3

    ctx.beginPath();
    ctx.arc(400,150,75,0,2*Math.PI);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 10;
    ctx.fillStyle = "blue";
    ctx.fill();
    ctx.stroke();

});
