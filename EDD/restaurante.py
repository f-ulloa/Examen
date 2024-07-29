import time
import random
import threading
import heapq

class AVLNode:
    def __init__(self, key):
        self.key = key
        self.height = 1
        self.left = None
        self.right = None

class AVLTree:
    def get_height(self, root):
        if not root:
            return 0
        return root.height

    def get_balance(self, root):
        if not root:
            return 0
        return self.get_height(root.left) - self.get_height(root.right)

    def right_rotate(self, z):
        y = z.left
        T3 = y.right
        y.right = z
        z.left = T3
        z.height = 1 + max(self.get_height(z.left), self.get_height(z.right))
        y.height = 1 + max(self.get_height(y.left), self.get_height(y.right))
        return y

    def left_rotate(self, z):
        y = z.right
        T2 = y.left
        y.left = z
        z.right = T2
        z.height = 1 + max(self.get_height(z.left), self.get_height(z.right))
        y.height = 1 + max(self.get_height(y.left), self.get_height(y.right))
        return y

    def balance(self, root):
        balance = self.get_balance(root)
        if balance > 1:
            if self.get_balance(root.left) >= 0:
                return self.right_rotate(root)
            else:
                root.left = self.left_rotate(root.left)
                return self.right_rotate(root)
        if balance < -1:
            if self.get_balance(root.right) <= 0:
                return self.left_rotate(root)
            else:
                root.right = self.right_rotate(root.right)
                return self.left_rotate(root)
        return root

    def insert(self, root, key):
        if not root:
            return AVLNode(key)
        elif key < root.key:
            root.left = self.insert(root.left, key)
        else:
            root.right = self.insert(root.right, key)
        root.height = 1 + max(self.get_height(root.left), self.get_height(root.right))
        return self.balance(root)

    def min_value_node(self, root):
        if root is None or root.left is None:
            return root
        return self.min_value_node(root.left)

    def delete(self, root, key):
        if not root:
            return root
        elif key < root.key:
            root.left = self.delete(root.left, key)
        elif key > root.key:
            root.right = self.delete(root.right, key)
        else:
            if root.left is None:
                temp = root.right
                root = None
                return temp
            elif root.right is None:
                temp = root.left
                root = None
                return temp
            temp = self.min_value_node(root.right)
            root.key = temp.key
            root.right = self.delete(root.right, temp.key)
        if root is None:
            return root
        root.height = 1 + max(self.get_height(root.left), self.get_height(root.right))
        return self.balance(root)

class Restaurant:
    def __init__(self):
        self.avl_tree = AVLTree()
        self.root = None
        self.queue = []
        self.counter = 0  # To keep track of the order of arrival
        self.tables = []
        self.generate_tables()
        self.generate_customers()

    def generate_tables(self):
        for _ in range(10):
            capacity = random.randint(4, 10)
            self.root = self.avl_tree.insert(self.root, capacity)
            self.tables.append(capacity)

    def generate_customers(self):
        for _ in range(40):
            group_size = random.randint(1, 6)
            heapq.heappush(self.queue, (self.counter, group_size))
            print(f"Customer {self.counter} with group size {group_size} added to queue.")
            self.counter += 1

    def allocate_table(self):
        while self.queue:
            order, group_size = heapq.heappop(self.queue)
            self.root, table_size = self.find_and_remove_suitable_table(self.root, group_size)

            if table_size is not None:
                print(f"Customer {order}: Group of size {group_size} allocated to table of size {table_size}.")
                waiting_time = 5 * group_size * (1 + 0.1 * (group_size - 1))
                threading.Thread(target=self.reinsert_table_after_waiting, args=(table_size, waiting_time)).start()
            else:
                print(f"Customer {order}: No suitable table found for group of size {group_size}. Reinserted into queue.")
                heapq.heappush(self.queue, (order, group_size))
                time.sleep(2)  # Esperar 2 segundos antes de intentar nuevamente
                break

    def reinsert_table_after_waiting(self, table_size, waiting_time):
        time.sleep(waiting_time)
        self.root = self.avl_tree.insert(self.root, table_size)
        print(f"Table of size {table_size} reinserted after {waiting_time} seconds.")

    def find_and_remove_suitable_table(self, root, group_size):
        if not root:
            return root, None

        if root.key >= group_size:
            new_root = self.avl_tree.delete(root, root.key)
            return new_root, root.key
        if root.left:
            root.left, table_size = self.find_and_remove_suitable_table(root.left, group_size)
            if table_size:
                return root, table_size
        if root.right:
            root.right, table_size = self.find_and_remove_suitable_table(root.right, group_size)
            if table_size:
                return root, table_size

        return root, None

    def run_simulation(self):
        while self.queue:
            self.allocate_table()

if __name__ == "__main__":
    restaurant = Restaurant()
    restaurant.run_simulation()
