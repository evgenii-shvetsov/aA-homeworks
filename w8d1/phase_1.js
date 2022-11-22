// function mysteryScoping1() {
//     var x = 'out of block';
//     if (true) {
//       var x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }

//   mysteryScoping1()
//   in block
//   in block



// function mysteryScoping2() {
//     const x = 'out of block';
//     if (true) {
//       const x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }
// mysteryScoping2()
//in block
//out of block



// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//       var x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }

//   mysteryScoping3() //Identifier 'x' has already been declared


// function mysteryScoping4() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }

//   mysteryScoping4()
// in block
// out of block

// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
//   }

//   mysteryScoping5()

//   Identifier 'x' has already been declared


//madLib

function madLib(verb, adjective, noun){
    console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`)
}

// madLib('make', 'best', 'guac')

function isSubstring(string, target){
    console.log(string.includes(target))
}
isSubstring("time to program", "time")
isSubstring("Jump for joy", "joys")