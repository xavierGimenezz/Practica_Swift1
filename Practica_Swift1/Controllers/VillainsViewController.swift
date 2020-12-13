

import UIKit

class VillainsViewController: UIViewController {

    @IBOutlet var tableView: UITableView?
    
    private let villainRepository = VillainRepository()
    private var villains: Villains = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Villanos"
        loadData()
        
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let data = sender as? Villain else {
            return
        }
        destination.villain = data
    }
    
    func villain(at indexPath: IndexPath) -> Villain? {
        if (indexPath.row < villains.count) {
            return villains[indexPath.row]
        } else {
            return nil
        }
    }

    private func loadData(){
        villains = villainRepository.villainList
    }
}

extension VillainsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainCellView", for: indexPath) as? VillainCellView
        
        if(indexPath.row < villains.count) {
            cell?.configureViews(villain: villains[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < villains.count) {
            if let villain = villain(at: indexPath) {
                print(villains[indexPath.row])
                performSegue(withIdentifier: "SEGUE_FROM_VILLAINS_TO_DETAIL",
                             sender: villain)
            }
            
        }
    }
}



