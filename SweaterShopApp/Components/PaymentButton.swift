import SwiftUI
import PassKit
import FirebaseAnalytics

struct PaymentButton: View {
    
    var selectedItem: [String: Any] = [
        AnalyticsParameterItemListID: "L001",
        AnalyticsParameterItemListName: "SweatShirts",
    ]
    
    @EnvironmentObject var cartManager: CartManager
    
    var action: () -> Void
    
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
        }
    
    struct Representable: UIViewRepresentable {
            var action: () -> Void
            @EnvironmentObject var cartManager: CartManager // declare here
            
            func makeCoordinator() -> Coordinator {
                Coordinator(action: action, cartManager: cartManager) // pass to Coordinator
            }
            
            func makeUIView(context: Context) -> UIView {
                context.coordinator.button
            }
            
            func updateUIView(_ rootView: UIView, context: Context) {
                context.coordinator.action = action
            }
        }
    }

struct PaymentButton_Previews: PreviewProvider {
    
    static var previews: some View {
        PaymentButton(action: {})
    }
}

extension PaymentButton {
    class Coordinator: NSObject {
        
        var cartManager: CartManager
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void, cartManager: CartManager) {
            self.action = action
            self.cartManager = cartManager
            
            super.init()
            
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender: Any) {
            action()
            
//            var shippingParams: [String: Any] = [
//                AnalyticsParameterCurrency: "INR",
//                AnalyticsParameterValue: cartManager.total,
//                AnalyticsParameterCoupon: "SUMMER_FUN",
//                AnalyticsParameterShippingTier: "Ground"
           // ]
            
//            var paymentParams: [String: Any] = [
//                AnalyticsParameterCurrency: "INR",
//                AnalyticsParameterValue: cartManager.total,
//                AnalyticsParameterCoupon: "SUMMER_FUN",
//                AnalyticsParameterPaymentType: "Visa"
//            ]
            
//            var venus: [String: Any]
//
//            switch product.name {
//            case "PinkSweater":
//                venus = PinkSweater
//
//            case "BlueJeans":
//                venus = BlueJeans
//
//            case "BlackJeans":
//                venus = BlackJeans
//
//            case "WhiteJeans":
//                venus = WhiteJeans
//
//            case "OrangeSweater":
//                venus = OrangeSweater
//
//            case "RedwineSweater":
//                venus = RedwineSweater
//
//            case "SandSweater":
//                venus = SandSweater
//
//            case "SeaSweater":
//                venus = SeaSweater
//
//            case "CreamSweater":
//                venus = CreamSweater
//
//            case "BeigeSweater":
//                venus = BeigeSweater
//
//            case "GreySweater":
//                venus = GreySweater
//
//            case "MinkSweater":
//                venus = MinkSweater
//
//            default:
//                venus = jeggings
//            }
            
            var checkoutParams: [String: Any] = [
              AnalyticsParameterCurrency: "INR",
              AnalyticsParameterValue: cartManager.total,
              AnalyticsParameterCoupon: "SUMMER_FUN"
            ];

            checkoutParams[AnalyticsParameterItems] = [OrangeSweater]
            Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: checkoutParams)
            
//            Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: [
//                AnalyticsParameterCurrency: "INR",
//                AnalyticsParameterValue: cartManager.total,
//                AnalyticsParameterCoupon: "SUMMER_FUN",
//            ])
            
            var shippingParams: [String: Any] = [
              AnalyticsParameterCurrency: "INR",
              AnalyticsParameterValue: cartManager.total,
              AnalyticsParameterCoupon: "SUMMER_FUN",
              AnalyticsParameterShippingTier: "Ground"
            ]
            
            shippingParams[AnalyticsParameterItems] = [OrangeSweater]
            
            Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: shippingParams)
            
//            shippingParams[AnalyticsParameterItems] = [OrangeSweater]
//            Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: shippingParams)
            
            var paymentParams: [String: Any] = [
              AnalyticsParameterCurrency: "INR",
              AnalyticsParameterValue: cartManager.total,
              AnalyticsParameterCoupon: "SUMMER_FUN",
              AnalyticsParameterPaymentType: "Card Payment"
            ]

            paymentParams[AnalyticsParameterItems] = [OrangeSweater]

            Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: paymentParams)
            
//            paymentParams[AnalyticsParameterItems] = [OrangeSweater]
//            Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: paymentParams)
        }
    }
}
