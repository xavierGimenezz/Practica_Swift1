
import UIKit

class HeroeCellView: UITableViewCell {

    @IBOutlet var heroCellView: UIView?
    @IBOutlet var heroeCellImage: UIImageView?
    @IBOutlet var heroeCellName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heroeCellImage?.image = nil
        heroeCellName?.text = nil
        
    }

    func configureViews (heroe: Heroe) {
        heroeCellImage?.image = UIImage(named: heroe.image ?? "")
        heroeCellName?.text = heroe.name
    }
    
}
