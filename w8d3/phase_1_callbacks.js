function titleize(names, callback){
    let modified = names.map(name => `Mx. ${name} Jingleheimer Schmidt`)
    callback(modified);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
})