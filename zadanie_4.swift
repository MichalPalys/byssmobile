enum Day
{
    case Poniedziałek, Wtorek, Środa, Czwartek, Piątek, Sobota, Niedziela
}

enum TaskStatus
{
    case done, toDo
    
    func getDescriptionOfTaskStatus() -> String
    {
        switch self {
            case .done:
                return "Gotowe"
            case .toDo:
                return "Do Wykonania"
        }
    }
}

protocol CheckListElementProtocol
{
    var taskReadyOrToDo: TaskStatus {get set}
}
 
class CheckListElement: CustomStringConvertible, CheckListElementProtocol
{
    var dayOfWeek: Day
    var taskReadyOrToDo: TaskStatus
    
    init(dayOfWeek: Day, taskReadyOrToDo: TaskStatus)
    {
        self.dayOfWeek = dayOfWeek
        self.taskReadyOrToDo = taskReadyOrToDo
    }
    
    convenience init(){
        self.init(dayOfWeek: .Sobota, taskReadyOrToDo: .done)
    }
    
    func isTaskDone() -> Bool
    {
        if taskReadyOrToDo == .done {
            return true
        } else {
            return false
        }
    }
    
    func switchStateOfTask() -> ()
    {
        if isTaskDone() {
            taskReadyOrToDo = .toDo
        } else {
            taskReadyOrToDo = .done
        }
    }
    
    var description: String {
        return "\(dayOfWeek) Wyjść na spacer \(taskReadyOrToDo.getDescriptionOfTaskStatus())"
    }
}

let list = CheckListElement()
print(list)
list.switchStateOfTask()
print(list)