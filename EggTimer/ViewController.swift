import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var totalTime = 0
    var secondsPassed: Float = 0.0
    let eggTime: [String : Int] = ["Soft": 300,"Medium": 420,"Hard" :720]
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 1.0
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0
        titleLabel.text = sender.currentTitle!
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        secondsPassed = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            if self.secondsPassed < Float(self.totalTime) {
                self.secondsPassed = self.secondsPassed + 0.1
                let percentProgress = Float(self.secondsPassed) / Float(self.totalTime)
                self.progressBar.progress = percentProgress
                if self.secondsPassed == Float(self.totalTime){
                        self.titleLabel.text = "Done!"
                    }
                }
            }
    }
}
