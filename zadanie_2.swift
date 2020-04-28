enum Day
{
    case Poniedziałek, Wtorek, Środa, Czwartek, Piątek, Sobota, Niedziela
}
 
class CheckListElement: CustomStringConvertible
{
    var dayOfWeek: Day
    var textReadyOrToDo: String
    
    init(dayOfWeek: Day, textReadyOrToDo: String)
    {
        self.dayOfWeek = dayOfWeek
        self.textReadyOrToDo = textReadyOrToDo
    }
    
    convenience init(){
        self.init(dayOfWeek: .Sobota, textReadyOrToDo: "Gotowe")
    }
    
    var description: String {
        return "\(dayOfWeek) Wyjść na spacer \(textReadyOrToDo)"
    }
}

let list = CheckListElement()

print(list)