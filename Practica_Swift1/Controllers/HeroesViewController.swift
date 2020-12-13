

import UIKit

class HeroesViewController: UIViewController {

    @IBOutlet var tableView: UITableView?
    

    private let heroeRepository = HeroeRepository()
    private var heroes: Heroes = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Heroes"
        
        loadData()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let data = sender as? Heroe else {
            return
        }
        destination.heroe = data
    }
    
    func heroe(at indexPath: IndexPath) -> Heroe? {
        if (indexPath.row < heroes.count) {
            return heroes[indexPath.row]
        } else {
            return nil
        }
    }

    private func loadData(){
        heroes = heroeRepository.heroesList
    }
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeCellView", for: indexPath) as? HeroeCellView
        
        if(indexPath.row < heroes.count) {
            cell?.configureViews(heroe: heroes[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < heroes.count) {
            if let heroe = heroe(at: indexPath) {
                print(heroes[indexPath.row])
                performSegue(withIdentifier: "SEGUE_FROM_HEROES_TO_DETAIL",
                             sender: heroe)
            }
            
        }
    }
}

