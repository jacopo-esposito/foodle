import SwiftUI

struct Blur: UIViewRepresentable {
    
    var blurStyle: UIBlurEffect.Style
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: CGRect.zero)
        let blurEffect = UIBlurEffect(style: blurStyle)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        view.backgroundColor = .clear
        view.insertSubview(blurView, at: 0)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
