enum Day
{
    case Poniedziałek, Wtorek, Środa, Czwartek, Piątek, Sobota, Niedziela
}

enum TaskStatus: String
{
    case done = "Gotowe", toDo = "Do Wykonania"
}

protocol CheckListElementProtocol
{
    var taskReadyOrToDo: TaskStatus {get set}
}

protocol CheckListDelegate
{
    // var CheckListElementArray: Array <CheckListElement>
    
    func getAllCheckListElements() -> Array <CheckListElement>
}
 
class CheckListElement: CustomStringConvertible, CheckListElementProtocol
{
    var dayOfWeek: Day
    var taskReadyOrToDo: TaskStatus
    var checkListDelegate: CheckListDelegate?
    
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
        
        print(checkListDelegate?.getAllCheckListElements() as Any)
    }
    
    var description: String {
        return "\(dayOfWeek) Wyjść na spacer \(taskReadyOrToDo.rawValue)"
    }
}

class CheckList: CheckListDelegate
{
    var checkListElementArray: Array <CheckListElement>
    
    init(checkListElementArray: Array <CheckListElement>)
    {
        self.checkListElementArray = checkListElementArray
    }
    
    func getAllCheckListElements() -> Array <CheckListElement>
    {
        return checkListElementArray
    }
}

let listElement1 = CheckListElement(dayOfWeek: Day.Poniedziałek, taskReadyOrToDo: TaskStatus.toDo)

let listElement2 = CheckListElement(dayOfWeek: Day.Środa, taskReadyOrToDo: TaskStatus.toDo)

let listElement3 = CheckListElement(dayOfWeek: Day.Piątek, taskReadyOrToDo: TaskStatus.toDo)

var checkListElements = [listElement1, listElement2, listElement3]

let list = CheckList(checkListElementArray: checkListElements)

listElement1.checkListDelegate = list

listElement1.switchStateOfTask()