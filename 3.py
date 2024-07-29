import sys

def merge_sort_with_filter(arr, reggaeton):
    if len(arr) > 1:
        mid = len(arr) // 2
        left_half = arr[:mid]
        right_half = arr[mid:]
        left_reggaeton = reggaeton[:mid]
        right_reggaeton = reggaeton[mid:]

        merge_sort_with_filter(left_half, left_reggaeton)
        merge_sort_with_filter(right_half, right_reggaeton)

        i = j = k = 0
        while i < len(left_half) and j < len(right_half):
            if left_reggaeton[i] == 1 and (right_reggaeton[j] == 0 or left_half[i] > right_half[j]):
                arr[k] = left_half[i]
                reggaeton[k] = left_reggaeton[i]
                i += 1
            else:
                arr[k] = right_half[j]
                reggaeton[k] = right_reggaeton[j]
                j += 1
            k += 1

        while i < len(left_half):
            arr[k] = left_half[i]
            reggaeton[k] = left_reggaeton[i]
            i += 1
            k += 1

        while j < len(right_half):
            arr[k] = right_half[j]
            reggaeton[k] = right_reggaeton[j]
            j += 1
            k += 1

def main():
    data = sys.stdin.read().strip().split()
    k = int(data[0])
    cantidad_platos = list(map(int, data[1:k+1]))
    toca_reggaeton = list(map(int, data[k+1:2*k+1]))

    merge_sort_with_filter(cantidad_platos, toca_reggaeton)

    filtered_platos = [cantidad_platos[i] for i in range(k) if toca_reggaeton[i] == 1]
    resultado = sum(filtered_platos[:3])

    print(resultado)

if __name__ == "__main__":
    main()
