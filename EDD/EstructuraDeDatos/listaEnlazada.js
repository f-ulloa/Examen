class Node {
  constructor(value) {
    this.value = value;
  }

  setNextNode(node) {
    this.nextNode = node;
  }
}

const firstNode = new Node(10);
const secondNode = new Node(5);
firstNode.setNextNode(secondNode);
console.log(firstNode.value);
console.log(firstNode.nextNode);
console.log(secondNode.nextNode);
