function dinerBreakfast(){
    let order = "I'd like cheesy scrambled eggs please";
    console.log(order);

    return function (food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
      };
}

dinerBreakfast()