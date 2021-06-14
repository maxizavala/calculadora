import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup
        setupView()
        
        return true
    }

    // MARK: - Metodos privados
    
    private func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds) // Instanciamos la ventana
        let vc = HomeViewController() // Instanciacion del HomeViewcontroller
        window?.rootViewController = vc // Asignamos el Home a la ventana principal
        window?.makeKeyAndVisible() // Hacemos visible la ventana
    }

}

