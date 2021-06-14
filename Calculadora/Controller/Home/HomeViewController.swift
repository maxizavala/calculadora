import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPorcentaje: UIButton!
    @IBOutlet weak var operatorIgual: UIButton!
    @IBOutlet weak var operatorMas: UIButton!
    @IBOutlet weak var operatorMenos: UIButton!
    @IBOutlet weak var operatorPor: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    // MARK: - Inicializacion
    init() { // Asociamos un XIB a un controlador Swift
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ciclo de Vida
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Button Actions
    @IBAction func buttonACAction(_ sender: Any) {
    }
    
    @IBAction func buttonPlusMinusAction(_ sender: Any) {
    }
    
    @IBAction func buttonPorcentajeAction(_ sender: Any) {
    }
    
    @IBAction func buttonDivisionAction(_ sender: Any) {
    }
    
    @IBAction func buttonPorAction(_ sender: Any) {
    }
    
    @IBAction func buttonMenosAction(_ sender: Any) {
    }
    
    @IBAction func buttonMasAction(_ sender: Any) {
    }
    
    @IBAction func buttonIgualAction(_ sender: Any) {
    }
    
    @IBAction func buttonDecimalAction(_ sender: Any) {
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
}
