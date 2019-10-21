import UIKit

class TimeStampViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var timeStamps = [TimeStamp]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeStamps.append(contentsOf: DataManager.shared.fetchTimeStampsData())
    }
}

extension TimeStampViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeStamps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeStampCell", for: indexPath) as! TimeStampCell
        cell.configureCell(with: timeStamps[indexPath.row])
        return cell
    }
    
    
}
