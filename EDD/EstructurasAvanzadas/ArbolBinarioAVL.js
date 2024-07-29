import { Stack } from "../EstructuraDeDatos/stack";

class Hoja {
  #peso;
  FE;
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

  rotacionSimpleDerecha(unbalancedNode) {
    //Cuando esta desiquilibrado a la izquierdo FE = -2 y subIzquierdo FE = -1 o 0
    const newTopNode = unbalancedNode.leftSon;
    const moveNode = unbalancedNode.leftSon.rightSon;
    unbalancedNode.leftSon = moveNode;
    newTopNode.rightSon = unbalancedNode;
    return newTopNode;
  }

  rotacionSimpleIzquierda(unbalancedNode) {
    //Cuando esta desiquilibrado a la derecha FE = 2 y subDerecho FE = 1 o 0
    const newTopNode = unbalancedNode.rightSon;
    const moveNode = unbalancedNode.rightSon.leftSon;
    unbalancedNode.rightSon = moveNode;
    newTopNode.leftSon = unbalancedNode;
    return newTopNode;
  }

  rotacionDobleDerecha(unbalancedNode) {
    //Cuando esta desiquilibrado a la izquierda FE = - 2 y subIzquierda FE = 1
    unbalancedNode.leftSon = this.rotacionSimpleIzquierda(
      unbalancedNode.leftSon
    );
    return this.rotacionSimpleDerecha(unbalancedNode);
  }

  rotacionDobleDerecha(unbalancedNode) {
    //Cuando esa desiquilibrado a la derecha FE = 2 y subderecho FE = -1
    unbalancedNode.rightSon = this.rotacionSimpleDerecha(
      unbalancedNode.rightSon
    );
    return this.rotacionSimpleIzquierda(unbalancedNode);
  }

  insert(hoja) {
    const temp = this.#root;
    const stackTrace = new Stack(hoja);
    while (true) {
      const isGranther = hoja.getPeso() > temp.getPeso();
      const sonIndex = isGranther ? "rightSon" : "leftSon";
      const tempSon = temp[sonIndex];
      if (!tempSon) {
        temp[sonIndex] = hoja;
        break;
      } else {
        stackTrace.push(tempSon);
        temp = tempSon;
      }
    }

    recalculateHeigthAndRotate(stackTrace, hoja);
  }

  recalculateHeigthAndRotate(stackTrace, hoja) {
    while (!stackTrace.isEmpty()) {
      const fatherNode = stackTrace.pop();
      if (hoja.getPeso() > fatherNode.getPeso()) {
        fatherNode.peso++;
      } else fatherNode.peso--;
    }
  }
}
