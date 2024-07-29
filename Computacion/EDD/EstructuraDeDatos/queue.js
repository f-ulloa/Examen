export class Node {
  constructor(value) {
    this.value = value;
  }

  setNextNode(node) {
    this.nextNode = node;
  }
}

export class Queue {
  constructor(firstNode) {
    this.firstNode = firstNode;
    this.lastNode = firstNode;
  }

  enqueue(node) {
    this.lastNode.nextNode = node;
    this.lastNode = node;
  }

  dequeue() {
    this.firstNode = this.firstNode?.nextNode;
  }

  print() {
    let node = this.firstNode;
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

const q = new Queue(n1);
q.enqueue(n2);
q.print();
q.enqueue(n3);
q.enqueue(n4);
q.print();
q.dequeue();
q.print();
