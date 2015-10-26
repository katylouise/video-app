function camelCase(str) {
  var arr = str.split(" ");
  for (var i = 1; i < arr.length; i++) {
    arr[i][0].toUpperCase();
  }
  console.log(arr.join("")) ;
}