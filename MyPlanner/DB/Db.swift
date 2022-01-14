import CoreData
import UIKit

final class DB {
    
    var context: NSManagedObjectContext
    
    init() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                fatalError("appdelegate error")
        }
        context = appDelegate.persistentContainer.viewContext
        initData()
    }
    
    
    func getAllTasks() -> [Task] {

        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let list:[Task]

        do {
            list = try context.fetch(fetchRequest)
        } catch {
            fatalError("Fetching Failed")
        }
        return list
        
    }

    
    func addCategory(name:String) -> Category {

        let category = Category(context: context)

        category.name = name

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return category
        
    }

    func addPriority(name: String, index: Int32) -> Priority {

        let priority = Priority(context: context)

        priority.name = name
        priority.index = index

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return priority
    }


    func addTask(
        name: String,
        completed: Bool,
        deadline: Date?,
        info:String?,
        category:Category?,
        priority:Priority?
    ) -> Task {

        let task = Task(context: context)
        
        task.name = name
        task.completed = completed
        task.deadline = deadline
        task.info = info
        task.category = category
        task.priority = priority

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }

        return task
    }

    func deleteTask(task: Task) {
  
        context.delete(task)

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }

    
}

extension DB {
    func initData() {
      
        let cat1 = addCategory(name: "Спорт")
        let cat2 = addCategory(name: "Семья")
        let cat3 = addCategory(name: "Отдых")
        let cat4 = addCategory(name: "Бизнес")
        let cat5 = addCategory(name: "Здоровье")
        let cat6 = addCategory(name: "Личное")

        let priority1 = addPriority(name: "Низкий", index:1)
        let priority2 = addPriority(name: "Нормальный", index:2)
        let priority3 = addPriority(name: "Высокий", index:3)

        let task1 = addTask(name: "Сходить в бассейн asd asdas dasdasdasdasdasdasd ", completed: false, deadline: Date().rewindDays(15), info: "доп. инфо", category: cat1, priority: priority1)
        let task2 = addTask(name: "Выезд на природу", completed: false, deadline: Date().rewindDays(-10), info: "", category: cat3, priority: priority3)
        let task3 = addTask(name: "Вынести мусор as asdasdasdasdasdasdasdasdas asdasdasdas", completed: false, deadline: Date().rewindDays(25), info: "", category: cat6, priority: priority3)
        let task4 = addTask(name: "Купить продукты", completed: false, deadline: Date().rewindDays(1), info: "доп. инфо", category: cat2, priority: priority1)
        let task5 = addTask(name: "Помыть машину", completed: false, deadline: Date().today, info: "asdasdasdasdas", category: cat2, priority: priority1)

        let task6 = addTask(name: "Сделать ремонт", completed: false, deadline: Date().rewindDays(10), info: "", category: cat1, priority: priority1)

        let task7 = addTask(name: "Отвезти в садик", completed: false, deadline: Date().today, info: "asdasdasdasd", category: cat3, priority: priority3)

        let task8 = addTask(name: "Футбольный матч", completed: false, deadline: Date().today, info: "", category: cat5, priority: priority2)

        let task9 = addTask(name: "Купить подарки", completed: false, deadline: Date().today, info: "", category: cat4, priority: priority1)

        let task10 = addTask(name: "Помыть машину", completed: false, deadline: Date().today, info: "", category: cat6, priority: priority2)


    }
}
