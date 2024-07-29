const arr = [4, 8, 1, 5, 6, 2, 3, 4, 12, 44];
console.log(selectionSort(arr));

function selectionSort(arr) {
  for (let i = 0; i < arr.length - 1; i++) {
    let [minIndex, minValue] = [i, arr[i]];
    for (let z = i; z < arr.length; z++) {
      if (minValue > arr[z]) [minIndex, minValue] = [z, arr[z]];
    }
    arr[minIndex] = arr[i];
    arr[i] = minValue;
  }
  return arr;
}
