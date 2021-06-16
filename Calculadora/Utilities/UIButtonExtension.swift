import UIKit

extension UIButton {

    // Borde redondo
    func round() {
        layer.cornerRadius = bounds.height / 2.25
        clipsToBounds = true
    }
    
    // Brilla
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
    // Apariencia de un boton seleccionado
    func selectOperador(_ selected: Bool) {
        backgroundColor = selected ? .blue : .systemTeal
        setTitleColor(selected ? .white : .black, for: .normal)
    }
    
}
