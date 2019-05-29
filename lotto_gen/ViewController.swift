

import UIKit

class ViewController: UIViewController {

    var titleLabel: UILabel?
    var displayNumbers: UILabel?
    var bonusBallGenLabel: UILabel?
    var bonusBallLabel: UILabel?

    var button = dropDownBtn()
    let numGenLabel = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel()
        titleLabel.text = "LOTTO GENERATOR"
        titleLabel.numberOfLines = 0
        titleLabel.frame = CGRect(x: self.view.bounds.size.width/2, y: 30, width: self.view.bounds.width, height: 50)
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        titleLabel.center.x = self.view.center.x

        let instructTxtField = UITextView(frame: CGRect(x: self.view.bounds.size.width/2, y: 70, width: self.view.bounds.width, height: 50))
        instructTxtField.textAlignment = .center
        instructTxtField.center.x = self.view.center.x

        instructTxtField.text = "Instructions: Choose a game from the drop down menu, and then click the BLUE Generate button. If you wish to switch to another game, choose it from the menu and hit the blue button again."
        self.view.addSubview(instructTxtField)


        button = dropDownBtn.init(frame: CGRect(x: 16, y: 100, width: 150, height: 50))
        button.setTitle("Pick a Game", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -(self.view.bounds.size.width/4)).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250).isActive = true

        button.widthAnchor.constraint(equalToConstant: 180).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true

        button.dropView.dropDownOptions = ["Pick 3", "Pick 4", "Jersey Cash 5", "Pick 6", "Power Ball", "Mega Millions" ]

        displayNumbers = UILabel(frame: CGRect(x: self.view.bounds.size.width/2, y: 320, width: 180, height: 50))
        displayNumbers?.text = "DISPLAY NUMBERS HERE"
        displayNumbers?.center.x = self.view.center.x
        displayNumbers?.textAlignment = .center
        displayNumbers?.isHidden = true

        self.view.addSubview(displayNumbers!)

        let generateButton = UIButton(frame: CGRect(x: self.view.bounds.size.width/2 , y: 175, width: 300, height: 50))
        generateButton.setTitle("Generate", for: .normal)
        generateButton.backgroundColor = .blue
        generateButton.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(generateButton)

        generateButton.addTarget(self, action: #selector(generateNumbers), for: .touchUpInside)

        generateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.bounds.size.width/4).isActive = true
        generateButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250).isActive = true

        generateButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        //create label
        bonusBallGenLabel = UILabel()
        bonusBallGenLabel?.text = "TEST THIS"
        bonusBallGenLabel?.frame = CGRect(x: 250, y: 360, width: self.view.bounds.width, height: 50)

        //hide label
        bonusBallGenLabel?.isHidden = true
        self.view.addSubview(bonusBallGenLabel!)

        bonusBallLabel = UILabel()
        bonusBallLabel?.text = "BONUS BALL:"
        bonusBallLabel?.frame = CGRect(x: self.view.bounds.size.width/2, y: 360, width: self.view.bounds.width, height: 50)
        bonusBallLabel?.textAlignment = .center
        bonusBallLabel?.center.x = 165
        bonusBallLabel?.isHidden = true
        self.view.addSubview(bonusBallLabel!)

    }

    @objc func generateNumbers(sender: UIButton) {
        let typeOfGame = button.currentTitle

        //add Cases here
        switch typeOfGame {
        case "Pick 3":
            print("game is Pick 3")
//            sender.setTitle(pickThree(), for: .normal)
            displayNumbers?.text = pickThree()
        displayNumbers?.isHidden = false

            bonusBallLabel?.isHidden = true
            bonusBallGenLabel?.isHidden = true

        case "Pick 4":
            print("game is Pick 4")
//            sender.setTitle(pickFour(), for: .normal)
            displayNumbers?.text = pickFour()
            displayNumbers?.isHidden = false

            bonusBallLabel?.isHidden = true
            bonusBallGenLabel?.isHidden = true

        case "Jersey Cash 5":
            print("game is Jersey Cash 5")
//            sender.setTitle(pickFive(), for: .normal)
            displayNumbers?.text = pickFive()
            displayNumbers?.isHidden = false

            bonusBallLabel?.isHidden = true
            bonusBallGenLabel?.isHidden = true

        case "Pick 6":
            print("game is Pick 6")
//            sender.setTitle(pickSix(), for: .normal)
            displayNumbers?.text = pickSix()
            displayNumbers?.isHidden = false

            bonusBallLabel?.isHidden = true
            bonusBallGenLabel?.isHidden = true

        case "Power Ball":
            print("game is Power Ball")
//            sender.setTitle(powerBall(), for: .normal)
            displayNumbers?.text = powerBall()
            displayNumbers?.isHidden = false

            //bonusball label
            bonusBallLabel?.isHidden = false

            //unhide label
            bonusBallGenLabel?.isHidden = false

            //set label to randomly generated number
            bonusBallGenLabel?.text = String(powerBallBonus())

        case "Mega Millions":
            print("game is Mega Millions")
//            sender.setTitle(megaMil(), for: .normal)
            displayNumbers?.text = megaMil()
            displayNumbers?.isHidden = false

            //bonusball label
            bonusBallLabel?.isHidden = false

            //unhide label
            bonusBallGenLabel?.isHidden = false

            //set label to randomly generated number
            bonusBallGenLabel?.text = String(megaMillionsBonus())

        default:
            print("No Game chosen")
        }
    }

    //MARK: Game choice section

    func pickThree() -> String {
        var nums = 1
        let numChoices = 3
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 10)

            savedLotto.append(lotNumber)

            print("Here are your Lotto Numbers: \(savedLotto)")
            nums += 1
        }

        return "\(savedLotto)"
    }

    func pickFour() -> String {
        var nums = 1
        let numChoices = 4
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 10)

            savedLotto.append(lotNumber)

            print("Here are your Lotto Numbers: \(savedLotto)")
            nums += 1
        }
        return "\(savedLotto)"
    }

    func pickFive() -> String { //NO BONUS BALL
        var nums = 1
        let numChoices = 5
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 44)

            if savedLotto.contains(lotNumber){
                nums -= 1
            } else {
                savedLotto.append(lotNumber)
            }

            savedLotto.sort()

            print("Here are your Lotto Numbers: \(savedLotto)")
            nums += 1
        }
        return "\(savedLotto)"
    }


    func pickSix() -> String { //NO BONUS BALL
        var nums = 1
        let numChoices = 6
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 50)

            if savedLotto.contains(lotNumber){
                nums -= 1
            } else {
                savedLotto.append(lotNumber)
            }

            savedLotto.sort()

            print("Here are your Lotto Numbers: \(savedLotto)")
            nums += 1
        }
        return "\(savedLotto)"
    }

    func powerBall() -> String {
        var nums = 1
        let numChoices = 5
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 70)

            if savedLotto.contains(lotNumber){
                nums -= 1
            } else {
                savedLotto.append(lotNumber)
            }

            savedLotto.sort()

            print("Here are your Lotto Numbers: \(savedLotto)")
            nums += 1
        }
        return "\(savedLotto)"
    }
    func megaMil() -> String {
        var nums = 1
        let numChoices = 5
        var savedLotto: [Int] = []

        while nums <= numChoices {
            let lotNumber = Int.random(in: 1 ..< 71)

            if savedLotto.contains(lotNumber){
                nums -= 1
            } else {
                savedLotto.append(lotNumber)
            }

            savedLotto.sort()

            print(savedLotto, terminator: " ")
            nums += 1
        }

        return "\(savedLotto)"
    }

    //MARK: Bonusball section

    func megaMillionsBonus() -> Int {
        let bonusBall = Int.random(in: 1 ..< 26)

        print("Here is your Mega Ball Number \(bonusBall)")

        return bonusBall
    }

    func powerBallBonus() -> Int {
        let bonusBall = Int.random(in: 1 ..< 26)

        print("Here is your Power Ball Number \(bonusBall)")

        return bonusBall
    }


}

// MARK: Protocol for dropdown menu
protocol dropDownProtocol {
    func dropDownPressed(string: String)
}

// MARK: class for Dropdown menu
class dropDownBtn: UIButton, dropDownProtocol {

    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()

    }

    var dropView = dropDownView()
    var  height = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray

        dropView = dropDownView.init(frame: CGRect.init(x: 16, y: 110, width: 100, height: 50))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false

    }

    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }

    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {

            isOpen = true

            NSLayoutConstraint.deactivate([self.height])

            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            NSLayoutConstraint.activate([self.height])

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)

        } else {
            isOpen = false

            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)

        }
    }

    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {

    var dropDownOptions = [String]()

    var tableView = UITableView()

    var delegate : dropDownProtocol!

    override init(frame: CGRect) {
        super.init(frame: frame)

        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray

        tableView.delegate = self
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(tableView)

        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}
