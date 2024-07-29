const arr = [4, 8, 1, 5, 6, 2, 3, 4, 12, 44];
console.log(insertionSort(arr));

function insertionSort(arr) {
  for (let i = 0; i < arr.length; i++) {
    const insertValue = arr[i];
    let z = i - 1;
    while (z >= 0) {
      if (arr[z] > insertValue) {
        arr[z + 1] = arr[z];
        arr[z] = insertValue;
        z--;
      } else break;
    }
  }
  return arr;
}
