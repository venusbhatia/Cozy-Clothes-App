import SwiftUI
import FirebaseAnalytics
import FirebaseCore
import FirebaseInstallations

struct CartView: View {
    
    
    var product: Product
    var selectedItem: [String: Any] = [
        AnalyticsParameterItemListID: "L001",
        AnalyticsParameterItemListName: "SweatShirts",
    ]
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                if cartManager.paymentSuccess { PaymentSuccessView() }
                else
                
                {
                    if cartManager.products.count > 0 {
                        ForEach(cartManager.products, id: \.id) { product in
                            ProductRow(product: product)
                        }
                        
                        HStack {
                            Spacer()
                            Text("Total Amount Payable is ")
                            Text(" Rs. \(cartManager.total).00")
                                .bold()
                        }
                        .padding()
                        
                        PaymentButton(action: cartManager.pay)
                            .padding()
                        
                    } else {
                        Text("Your cart is empty.")
                    }
                }
            }
        }
        .navigationTitle(Text("Your Cart: ₹\(cartManager.total) "))
        .padding(.top)
        
        .onAppear{
            var venus: [String: Any]

            switch product.name {
            case "PinkSweater":
                venus = PinkSweater

            case "BlueJeans":
                venus = BlueJeans

            case "BlackJeans":
                venus = BlackJeans

            case "WhiteJeans":
                venus = WhiteJeans

            case "OrangeSweater":
                venus = OrangeSweater

            case "RedwineSweater":
                venus = RedwineSweater

            case "SandSweater":
                venus = SandSweater

            case "SeaSweater":
                venus = SeaSweater

            case "CreamSweater":
                venus = CreamSweater

            case "BeigeSweater":
                venus = BeigeSweater

            case "GreySweater":
                venus = GreySweater

            case "MinkSweater":
                venus = MinkSweater

            default:
                venus = jeggings
            }
            
            venus[AnalyticsParameterQuantity] = cartManager.products.count

            // Prepare order parameters
            var orderParameters: [String: Any] = [
              AnalyticsParameterCurrency: "INR",
              AnalyticsParameterValue: cartManager.total
            ]

            // Add items array
            orderParameters[AnalyticsParameterItems] = [venus]

            // Log event when cart is viewed
            Analytics.logEvent(AnalyticsEventViewCart, parameters: orderParameters)
        }
                  
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(product: productList[1])
            .environmentObject(CartManager())
    }
}

