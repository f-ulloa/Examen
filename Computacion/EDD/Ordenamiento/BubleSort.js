const arr = [4, 8, 1, 5, 6, 2, 3, 4, 12, 44];
console.log(bubleSort(arr));

function bubleSort(arr) {
  for (let i = 0; i < arr.length; i++) {
    for (let z = i; z < arr.length; z++) {
      if (arr[i] > arr[z]) {
        const temp = arr[i];
        arr[i] = arr[z];
        arr[z] = temp;
      }
    }
  }
  return arr;
}
