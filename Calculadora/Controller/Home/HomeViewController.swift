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
    
    // MARK: - Variables
    private var total: Double = 0 // Almacena el total
    private var temp: Double = 0 // Valor temporal mostrado en la label
    private var operando = false // Indica si se ha seleccionado un operador
    private var decimal = false // Indica se se ha seleccionado la coma
    private var operador: operadorType = .ninguna // Operacion actual

    // MARK: - Constantes
    private let kSeparadorDecimal = Locale.current.decimalSeparator! // , o . segun pais
    private let kMaxLenght = 9 // Tamaño maximo de numero
    
    private enum operadorType {
        case ninguna, suma, resta, multiplicacion, division, porcentaje
    }
    
    // Formateo de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores auxiliar
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo de valores por pantalla en formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
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
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        numberDecimal.round()
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPorcentaje.round()
        operatorIgual.round()
        operatorMas.round()
        operatorMenos.round()
        operatorPor.round()
        operatorDivision.round()

        numberDecimal.setTitle(kSeparadorDecimal, for: .normal)
        
        resultado()
    }

    // MARK: - Button Actions
    @IBAction func buttonACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func buttonPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func buttonPorcentajeAction(_ sender: UIButton) {
        
        if operador != .porcentaje {
            resultado()
        }
        
        operando = true
        operador = .porcentaje
        resultado()
        sender.shine()
    }
    
    @IBAction func buttonDivisionAction(_ sender: UIButton) {
        
        if operador != .ninguna {
            resultado()
        }
        
        operando = true
        operador = .division
        sender.selectOperador(true)
        sender.shine()
    }
    
    @IBAction func buttonPorAction(_ sender: UIButton) {
        
        if operador != .ninguna {
            resultado()
        }
        
        operando = true
        operador = .multiplicacion
        sender.selectOperador(true)
        sender.shine()
    }
    
    @IBAction func buttonMenosAction(_ sender: UIButton) {
        
        if operador != .ninguna {
            resultado()
        }
        
        operando = true
        operador = .resta
        sender.selectOperador(true)
        sender.shine()
    }
    
    @IBAction func buttonMasAction(_ sender: UIButton) {
        
        if operador != .ninguna {
            resultado()
        }
        
        operando = true
        operador = .suma
        sender.selectOperador(true)
        sender.shine()
    }
    
    @IBAction func buttonIgualAction(_ sender: UIButton) {
        resultado()
        sender.shine()
    }
    
    @IBAction func buttonDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operando && currentTemp.count >= kMaxLenght {
            return
        }
        
        resultLabel.text = resultLabel.text! + kSeparadorDecimal
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {

        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operando && currentTemp.count >= kMaxLenght {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // Se ha seleccionado una operacion
        if operando {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operando = false
        }
        
        // Operaciones decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kSeparadorDecimal)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    // Limpia los valores
    private func clear() {
        operador = .ninguna // Borra operador
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 { // Borra el resultado temporal (1er click)
            temp = 0
            resultLabel.text = "0"
        } else { // Borral el resultado total (2do click)
            total = 0
            resultado()
        }
    }
    
    // Obtiene el resultado final
    private func resultado() {
        switch operador {
        case .ninguna: // nada
            break
        case .suma:
            total = total + temp
            break
        case .resta:
            total = total - temp
            break
        case .multiplicacion:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .porcentaje:
            temp = temp / 100
            total = temp
            break
        }
     
        // Formateo en Pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLenght {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operador = .ninguna
        
        selectVisualOperation()
        
        print("Total:\(total)")
        
    }
    
    // Muestra de forma visual la operacion seleccionada
    private func selectVisualOperation() {
        if !operando {
            // No hay operacion seleccionada
            operatorMas.selectOperador(false)
            operatorMenos.selectOperador(false)
            operatorPor.selectOperador(false)
            operatorDivision.selectOperador(false)
        } else {
            switch operador {
            case .ninguna, .porcentaje:
                operatorMas.selectOperador(false)
                operatorMenos.selectOperador(false)
                operatorPor.selectOperador(false)
                operatorDivision.selectOperador(false)
                break
            case .suma:
                operatorMas.selectOperador(true)
                operatorMenos.selectOperador(false)
                operatorPor.selectOperador(false)
                operatorDivision.selectOperador(false)
                break
            case .resta:
                operatorMas.selectOperador(false)
                operatorMenos.selectOperador(true)
                operatorPor.selectOperador(false)
                operatorDivision.selectOperador(false)
                break
            case .multiplicacion:
                operatorMas.selectOperador(false)
                operatorMenos.selectOperador(false)
                operatorPor.selectOperador(true)
                operatorDivision.selectOperador(false)
                break
            case .division:
                operatorMas.selectOperador(false)
                operatorMenos.selectOperador(false)
                operatorPor.selectOperador(false)
                operatorDivision.selectOperador(true)
                 break
            }
        }
    }
    
}
