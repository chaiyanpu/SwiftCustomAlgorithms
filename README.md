##There is custom Swift algorithms implementation，continuing updata...

###Base data structure
#####List
```
class ListNode<T>{
    var value:T
    var next:ListNode?
    init(_ value:T) {
        self.value = value
        self.next = nil
    }
}
```
#####Stack
```
//A stack come true by List.Apple has used Array to constitute Satck, I used List
class Stack<T>{
    var stack:ListNode<T>?
    init(value:ListNode<T>? = nil) {
        self.stack = value
    }
    
    func push(value:T){
        switch self.isEmpty() {
        case true:
            self.stack = ListNode(value)
        default:
            let node = ListNode(value)
            node.next = self.stack
            self.stack = node
        }
    }
    
    func top() -> T?{
        switch self.isEmpty() {
        case true:
            return nil
        default:
            let value = self.stack!.value
            return value
        }
    }
    
    @discardableResult
    func pop() -> Stack{
        switch self.isEmpty() {
        case true:
            break
        default:
            self.stack = self.stack!.next
        }
        return self
    }
    
    func isEmpty() -> Bool{
        if self.stack == nil {
            return true
        }else{
            return false
        }
    }
    
    func Clear(){
        self.stack = nil
    }  
}
```
#####Queue
```
// A queue come true by Array
class Queue<T>{
    var array = [T]()
    var count:Int{
        return array.count
    }
    func push(value:T){
        array.append(value);
    }
    func pop(){
        array.removeFirst()
    }
    
    func front() -> T?{
        if array.count > 0{
            let value = array.first
            return value
        }else{
            return nil
        }
    }
}
```
#####Tree
```
class BinaryTreeNode<T>{
    var value:T?
    var left:BinaryTreeNode?
    var right:BinaryTreeNode?
    init(_ value:T) {
        self.value = value;
        self.left = nil
        self.right = nil
    }
 }
```
###Other
Other is many general algorithms implementation.

