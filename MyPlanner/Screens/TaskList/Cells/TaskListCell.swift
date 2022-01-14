import UIKit

final class TaskListCell: UITableViewCell {
    
    static let identifier = "TaskListCell"
    static let preferredHeight: CGFloat = 80
    
    private let taskNameLabel = UILabel()
    private let taskCategoryLabel = UILabel()
    private let deadlineLabel = UILabel()
    private let priorityLabel = UILabel()
    private let buttonComplete = UIButton()
    private let buttonInfo = UIButton()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configuration(taskName: String, taskCategory: String) {
        self.taskNameLabel.text = taskName
        self.taskCategoryLabel.text = taskCategory
    }

}

// MARK: - Setup
extension TaskListCell {
    
    private func setup() {
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        taskNameLabel.text = "Name label"
        
        taskCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        taskCategoryLabel.text = "Category"
        taskCategoryLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        deadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineLabel.text = "10 d"
        
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        buttonComplete.translatesAutoresizingMaskIntoConstraints = false
        buttonComplete.setImage(UIImage(named: "check_not_complete"), for: .normal)
        
        
        buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonInfo.setImage(UIImage(named: "note_not_complete"), for: .normal)
        
    }
    
    private func layout() {
        
        contentView.addSubview(taskNameLabel)
        contentView.addSubview(taskCategoryLabel)
        contentView.addSubview(deadlineLabel)
        contentView.addSubview(priorityLabel)
        contentView.addSubview(buttonComplete)
        contentView.addSubview(buttonInfo)
        
        NSLayoutConstraint.activate([
            
            priorityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            priorityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: priorityLabel.leadingAnchor),
            priorityLabel.widthAnchor.constraint(equalToConstant: 10),
            
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            taskNameLabel.leadingAnchor.constraint(equalTo: priorityLabel.trailingAnchor, constant: 10),
            taskNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: buttonInfo.leadingAnchor, constant: -10),
            taskNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            taskCategoryLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor),
            taskCategoryLabel.leadingAnchor.constraint(equalTo: priorityLabel.trailingAnchor, constant: 10),
            taskCategoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: buttonInfo.leadingAnchor, constant: -10),
            taskCategoryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            buttonComplete.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonComplete.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonComplete.heightAnchor.constraint(equalToConstant: 28),
            buttonComplete.widthAnchor.constraint(equalToConstant: 28),
            
            deadlineLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deadlineLabel.trailingAnchor.constraint(equalTo: buttonComplete.leadingAnchor, constant: -10),
            deadlineLabel.heightAnchor.constraint(equalToConstant: 40),
            deadlineLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),

            buttonInfo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonInfo.trailingAnchor.constraint(equalTo: deadlineLabel.leadingAnchor, constant: -16),
            buttonInfo.heightAnchor.constraint(equalToConstant: 26),
            buttonInfo.widthAnchor.constraint(equalToConstant: 26),
            
        ])
        
    }
}
