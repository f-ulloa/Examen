class Node {
  constructor(value) {
    this.value = value;
  }

  setNextNode(node) {
    this.nextNode = nodo;
  }

  setPrevNode(node) {
    this.prevNode = node;
  }
}

//Double List
const firstNode = new Node(1);
const secondNode = new Node(2);
const thirdNode = new Node(3);
firstNode.setNextNode(secondNode);
secondNode.setPrevNode(firstNode);
secondNode.setNextNode(thirdNode);
thirdNode.setPrevNode(secondNode);

//Circular Double List
const cfirstNode = new Node(1);
const csecondNode = new Node(2);
const cthirdNode = new Node(3);
cfirstNode.setPrevNode(cthirdNode);
cfirstNode.setNextNode(csecondNode);
csecondNode.setPrevNode(cfirstNode);
csecondNode.setNextNode(cthirdNode);
cthirdNode.setPrevNode(csecondNode);
cthirdNode.setNextNode(cfirstNode);
