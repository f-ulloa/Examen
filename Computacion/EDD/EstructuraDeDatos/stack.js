class Node {
  constructor(value) {
    this.value = value;
  }

  setNextNode(node) {
    this.nextNode = node;
  }
}

export class Stack {
  constructor(topNode) {
    this.topNode = topNode;
  }

  push(node) {
    node.nextNode = this.topNode;
    this.topNode = node;
  }

  pop() {
    this.topNode = this.topNode?.nextNode;
  }

  isEmpty() {
    return !this.topNode;
  }

  print() {
    let node = this.topNode;
    while (node?.nextNode) {
      console.log(node);
      node = this.node?.nextNode;
    }
  }
}

const n1 = new Node(1);
const n2 = new Node(2);
const n3 = new Node(3);
const n4 = new Node(4);
const n5 = new Node(5);

const s = new Stack(n1);
s.push(n2);
s.print();
s.push(n3);
s.push(n4);
s.print();
s.pop();
s.print();
