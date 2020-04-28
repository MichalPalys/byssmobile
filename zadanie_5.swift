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
    
    func getEveryThirdCheckListElement()
    {
        for (index, element) in checkListElementArray.enumerated() {
            if (index + 1) % 3 == 0 {
                print(element)
            }
        }
    }
}

let listElement1 = CheckListElement(dayOfWeek: Day.Poniedziałek, taskReadyOrToDo: TaskStatus.toDo)

let listElement2 = CheckListElement(dayOfWeek: Day.Wtorek, taskReadyOrToDo: TaskStatus.toDo)

let listElement3 = CheckListElement(dayOfWeek: Day.Środa, taskReadyOrToDo: TaskStatus.toDo)

let listElement4 = CheckListElement(dayOfWeek: Day.Czwartek, taskReadyOrToDo: TaskStatus.toDo)

let listElement5 = CheckListElement(dayOfWeek: Day.Piątek, taskReadyOrToDo: TaskStatus.toDo)

let listElement6 = CheckListElement(dayOfWeek: Day.Sobota, taskReadyOrToDo: TaskStatus.toDo)

let listElement7 = CheckListElement(dayOfWeek: Day.Niedziela, taskReadyOrToDo: TaskStatus.toDo)

let listElement8 = CheckListElement(dayOfWeek: Day.Poniedziałek, taskReadyOrToDo: TaskStatus.toDo)

let listElement9 = CheckListElement(dayOfWeek: Day.Wtorek, taskReadyOrToDo: TaskStatus.toDo)

var checkListElements = [listElement1, listElement2, listElement3, listElement4, listElement5, listElement6, listElement7, listElement8, listElement9]

let list = CheckList(checkListElementArray: checkListElements)

listElement1.checkListDelegate = list
listElement2.checkListDelegate = list
listElement3.checkListDelegate = list
listElement4.checkListDelegate = list
listElement5.checkListDelegate = list
listElement6.checkListDelegate = list
listElement7.checkListDelegate = list
listElement8.checkListDelegate = list
listElement9.checkListDelegate = list

listElement3.switchStateOfTask()

list.getEveryThirdCheckListElement()