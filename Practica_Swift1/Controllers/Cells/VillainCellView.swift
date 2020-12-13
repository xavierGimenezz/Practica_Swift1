
import UIKit

class VillainCellView: UITableViewCell {
  
    @IBOutlet var villainCellView: UIView?
    @IBOutlet var villainCellImage: UIImageView?
    @IBOutlet var villainCellName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        villainCellImage?.image = nil
        villainCellName?.text = nil
    }
    
    func configureViews (villain: Villain) {
        villainCellImage?.image = UIImage(named: villain.image ?? "")
        villainCellName?.text = villain.name
    }
    
}

