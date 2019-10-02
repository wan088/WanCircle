import UIKit
import Firebase
class BoardListViewController: UITableViewController {
    var boards = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initBoards()
    }
    func initBoards(){
        let ref = Database.database().reference().child("게시판목록")
        ref.observe(.value) {[weak self] (snapshot) in
            let dict = snapshot.value as? [String:String] ?? [:]
            for key in dict.keys{
                print(key)
                self?.boards.append(key)
            }
            self?.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boardCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "boardCell")
        cell.textLabel?.text = boards[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 25)
        cell.detailTextLabel?.text = "회원전용"
        cell.detailTextLabel?.font = .systemFont(ofSize: 15)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bvc = BoardViewController()
        bvc.boardName = boards[indexPath.row]
        bvc.navigationItem.title = bvc.boardName
        self.show(bvc, sender: self)
    }
}
