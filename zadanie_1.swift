class CheckListElement: CustomStringConvertible
{
    var textReadyOrToDo: String
    
    init(textReadyOrToDo: String)
    {
        self.textReadyOrToDo = textReadyOrToDo
    }
    
    convenience init(){
        self.init(textReadyOrToDo: "Do Wykonania")
    }
    
    var description: String {
        return "Poniedziałek zrobić pranie \(textReadyOrToDo)"
    }
}

let list = CheckListElement()

print(list)