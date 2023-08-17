import SwiftUI
import FirebaseAnalytics
import FirebaseCore
import FirebaseInstallations

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()

                Text("₹ \(product.price)")
            }
            
            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                
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
                    
                    // Specify removal quantity
                    venus[AnalyticsParameterQuantity] = cartManager.products.count

                    // Prepare params
                    var removeParams: [String: Any] = [
                      AnalyticsParameterCurrency: "INR",
                      AnalyticsParameterValue: product.price
                    ]

                    // Add items
                    removeParams[AnalyticsParameterItems] = [venus]

                    // Log removal event
                    Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: removeParams)
                    
//                    Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
//                        "Parameter_Item_List": cartManager.removeFromCart(product: product),
//                        AnalyticsParameterCurrency: "INR",
//                        AnalyticsParameterValue: product.price,
//                    ])
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[2])
            .environmentObject(CartManager())
    }
}
