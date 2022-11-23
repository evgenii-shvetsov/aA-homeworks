function fizzBuzz(arr){
    let new_arr = []
    for(let element of arr){
        if (element % 3 === 0 && element % 5 === 0){
            continue
        }
        else if (element % 3 === 0 || element % 5 === 0){
            new_arr.push(element)
        }
    }
console.log(new_arr)
}
// fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

function isPrime(num){
    if (num < 2){
        return false 
    }

    for(let i = 2; i < num; i++){
        if (num % 2 ==0){
            return false
        }
    }
    return true
}

// console.log(isPrime(2))
// console.log(isPrime(5))
// console.log(isPrime(11))
// console.log(isPrime(4))
// console.log(isPrime(-5))

function sumOfNPrimes(num){
    let total = 0;
    let countPrimes = 0;
    let i = 2;

    while(countPrimes < num){
        if(isPrime(i)){
            total += i;
            countPrimes++;
        }
        i++;
    }
    return total;
}

// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))
// console.log(sumOfNPrimes(4))