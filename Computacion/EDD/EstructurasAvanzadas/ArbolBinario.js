class Hoja {
  #peso;
  constructor(peso) {
    this.#peso = peso;
    this.leftSon = null;
    this.rightSon = null;
  }

  getPeso() {
    return this.#peso;
  }
}

class Arbol {
  #root;
  constructor(root) {
    this.#root = root;
  }

  getVacio() {
    return !this.#root;
  }

  insertarHoja(hoja) {
    let seguir = true;
    let temp = this.#root;
    while (seguir) {
      const isGranther = temp.getPeso() > hoja.getPeso();
      const son = isGranther ? "rightSon" : "leftSon";
      const tempSon = temp[son];
      if (tempSon) temp = tempSon;
      else {
        temp[son] = hoja;
        seguir = false;
      }
    }
  }

  printPreOrder(hoja = this.#root) {
    if (!hoja) return;
    console.log(hoja.getPeso());
    this.printPreOrder(hoja.leftSon);
    this.printPreOrder(hoja.rightSon);
  }

  printInOrder(hoja = this.#root) {
    if (!hoja) return;
    this.printPreOrder(hoja.leftSon);
    console.log(hoja.getPeso());
    this.printPreOrder(hoja.rightSon);
  }

  printPostOrder(hoja = this.#root) {
    if (!hoja) return;
    this.printPreOrder(hoja.leftSon);
    this.printPreOrder(hoja.rightSon);
    console.log(hoja.getPeso());
  }
}

const hojita = new Hoja(3);
console.log(hojita.peso);
console.log(hojita.getPeso());
const arbol = new Arbol();
console.log(arbol.getVacio());
