

import UIKit

class SplashViewController: UIViewController {

    private let SEGUE_TO_HOME = "SEGUE_FROM_SPLASH_TO_HOME"
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        activityIndicator?.startAnimating()
        
        navigationNext()
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    private func navigationNext() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)){ [weak self] in
            let storyboardHome = UIStoryboard(name: "KimetsuHome",
                                              bundle: nil)
            if let destination = storyboardHome.instantiateInitialViewController(){
                self?.navigationController?.setViewControllers([destination],
                                                               animated: true)
            }
        }
    }


}

