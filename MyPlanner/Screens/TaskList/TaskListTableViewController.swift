import UIKit
import CoreData

class TaskListTableViewController: UITableViewController {
    
    let db = DB()
    var taskList:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskList = db.getAllTasks()
        setup()
    }


}

extension TaskListTableViewController {
    private func setup() {
        tableView.register(
            TaskListCell.self,
            forCellReuseIdentifier: TaskListCell.identifier
        )

    }
}


// MARK: - Table view data source
extension TaskListTableViewController {
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TaskListCell.preferredHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListCell.identifier, for: indexPath
        ) as? TaskListCell else {
            fatalError("cell error")
        }
        
        let task = taskList[indexPath.row]
        
        cell.configuration(
            taskName: task.name ?? "default",
            taskCategory: task.category?.name ?? "default"
        )
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            db.deleteTask(task: taskList[indexPath.row])
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        } else if editingStyle == .insert { }
        
    }
}
