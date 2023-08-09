
import SwiftUI
import PassKit

struct PaymentButton: View {
    var action: () -> Void
    
    var height: Double {
        return 50
    }
    
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .accessibility(label: Text("Buy with Apple Pay", comment: "Accessibility label for Buy with Apple Pay button"))
    }
}

extension PaymentButton {
    typealias ViewRepresentable = UIViewRepresentable
    
    struct Representable: ViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender: Any) {
            action()
        }
    }
}

struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentButton(action: {})
                .padding()
                .preferredColorScheme(.light)
            PaymentButton(action: {})
                .padding()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
