/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Observer
 - - - - - - - - - -
 ![Observer Diagram](Observer_Diagram.png)
 
 The observer pattern allows "observer" objects to register for and receive updates whenever changes are made to "subject" objects.
 
 This pattern allows us to define "one-to-many" relationships between many observers receiving updates from the same subject.
 
 ## Code Example
 */
import Combine

public class User {
    @Published var name: String
    
    public init(name: String) {
        self.name = name
    }
}

let user = User(name: "Passaction")

let publisher = user.$name

var subscriber: AnyCancellable = publisher.sink { (value) in
    print("User's name is \(value)")
}

user.name = "egetart"

subscriber = nil

user.name = "egetart has left the building"
