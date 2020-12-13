
import UIKit

protocol DetailViewDelegate {
    func updateData(_ heroe: Heroe?)
}

class DetailViewController: UIViewController {
    var heroe: Heroe? = nil
    var villain: Villain? = nil
    
    @IBOutlet var detailImage: UIImageView?
    @IBOutlet var detailName: UILabel?
    @IBOutlet var detailDescription: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heroe ?? "")
        print(villain ?? "")
        
    
        if heroe != nil {
            detailImage?.image = UIImage(named: heroe?.image ?? "")
            detailName?.text = heroe?.name
            detailDescription?.text = heroe?.description
        } else {
            detailImage?.image = UIImage(named: villain?.image ?? "")
            detailName?.text = villain?.name
            detailDescription?.text = villain?.description
        }
        
        
    }
    
    
    
    func configureDetailView (heroe: Heroe) {
        detailImage?.image = UIImage(named: heroe.image ?? "")
        detailName?.text = heroe.name
        detailDescription?.text = heroe.description
    }
    
    
}
