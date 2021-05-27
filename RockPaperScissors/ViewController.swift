import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var eeveeImageView: UIImageView!
    @IBOutlet weak var pikachuImageView: UIImageView!
    @IBOutlet weak var eeveeScoreLabel: UILabel!
    @IBOutlet weak var pikachuScoreLabel: UILabel!
    
    //分數
    var eeveeScore = 0
    var pikachuScore = 0
    
    let gestures = ["rock","paper","scissors"]
    let resultWords = ["WIN🥳","LOSE😭","DRAW😎"]
    
    //畫面已顯示
    override func viewDidAppear(_ animated: Bool) {
        startAlert()
    }
    
    //畫面載入
    override func viewDidLoad() {
        super.viewDidLoad()
        reset(alert: nil)
    }
    
    //設置
    func reset(alert:UIAlertAction?) {
        resultLabel.text = ""
        eeveeScoreLabel.text = "0"
        pikachuScoreLabel.text = "0"
        eeveeImageView.image = nil
        pikachuImageView.image = nil
        pikachuScore = 0
        eeveeScore = 0
    }
    
    //一開始跳出的startAlert訊息
    func startAlert() {
        let controller = UIAlertController(title: "Are U Ready !?", message: "先贏得5場勝利就是贏家", preferredStyle: .alert)
        let startAction = UIAlertAction(title: "START", style: .default, handler: nil)
        controller.addAction(startAction)
        present(controller, animated: true, completion: nil)
    }
    
    //重新玩的alert
    func replayAlert(isWin:Bool) {
        var title = ""
        
        if isWin {
            //贏
            title = "You WIN"
        }else{
            //輸
            title = "You LOSE"
        }
        
        let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let replayAction = UIAlertAction(title: "REPLAY", style: .default, handler: reset(alert:))
        controller.addAction(replayAction)
        present(controller, animated: true, completion: nil)
    }
    
    //電腦隨機出拳
    func charmanderPicRandom() {
        eeveeImageView.image = UIImage(named: gestures.randomElement()!)
    }
    
    //判斷paper
    @IBAction func paperBtn(_ sender: UIButton) {
        charmanderPicRandom()
        pikachuImageView.image = UIImage(named: "playerPaper")
        
        switch eeveeImageView.image {
        case UIImage(named: gestures[0]):
            resultLabel.text = resultWords[0]
            pikachuScore += 1
            pikachuScoreLabel.text = "\(pikachuScore)"
        case UIImage(named: gestures[1]):
            resultLabel.text = resultWords[2]
        case UIImage(named: gestures[2]):
            resultLabel.text = resultWords[1]
            eeveeScore += 1
            eeveeScoreLabel.text = "\(eeveeScore)"
        default:
            break
        }
        finalResult()
    }
    
    //判斷rock
    @IBAction func rockBtn(_ sender: UIButton) {
        charmanderPicRandom()
        pikachuImageView.image = UIImage(named: "playerRock")
        
        switch eeveeImageView.image {
        case UIImage(named: gestures[0]):
            resultLabel.text = resultWords[2]
        case UIImage(named: gestures[1]):
            resultLabel.text = resultWords[1]
            eeveeScore += 1
            eeveeScoreLabel.text = "\(eeveeScore)"
        case UIImage(named: gestures[2]):
            resultLabel.text = resultWords[0]
            pikachuScore += 1
            pikachuScoreLabel.text = "\(pikachuScore)"
        default:
            break
        }
        finalResult()
    }
    
    //判斷scissors
    @IBAction func scissorsRtn(_ sender: UIButton) {
        charmanderPicRandom()
        pikachuImageView.image = UIImage(named: "playerScissors")
        
        switch eeveeImageView.image {
        case UIImage(named: gestures[0]):
            resultLabel.text = resultWords[1]
            eeveeScore += 1
            eeveeScoreLabel.text = "\(eeveeScore)"
        case UIImage(named: gestures[1]):
            resultLabel.text = resultWords[0]
            pikachuScore += 1
            pikachuScoreLabel.text = "\(pikachuScore)"
        case UIImage(named: gestures[2]):
            resultLabel.text = resultWords[2]
        default:
            break
        }
        finalResult()
    }
    
    //判斷分數
    func finalResult() {
        if pikachuScore == 5 {
            replayAlert(isWin: true)
        }else if eeveeScore == 5 {
            replayAlert(isWin: false)
        }
    }
    
    
}

