document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("mycanvas");
    canvas.width = 1000;
    canvas.height = 1000;

    const ctx = canvas.getContext("2d");
    
    ctx.fillStyle = "red"; 
    ctx.fillRect(50,75,200,150);
    
    //Phase 3

    ctx.beginPath();
    ctx.arc(400,150,75,0,2*Math.PI);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 10;
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();
    // ctx.closePath();

    //Phase 4
    //drawing a triangle
    ctx.beginPath();
    ctx.moveTo(550, 100);
    ctx.lineTo(550, 220);
    ctx.lineTo(700, 100);
    ctx.closePath();
    
    ctx.lineWidth = 10;
    ctx.strokeStyle = '#666666';
    ctx.stroke();

    ctx.fillStyle = "#FFCC00";
    ctx.fill(); 
});
