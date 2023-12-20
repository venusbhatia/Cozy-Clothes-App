import SwiftUI
import ConfettiSwiftUI
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore

struct PaymentSuccessView: View {
    @State var counter: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                //Spacer()
                Text("Congratulations on getting new set of Apparels!🥳 Keep an eye on your inbox for the E-mail confirmation.")
                    .font(.custom("Avenir-Heavy", size: 20))
                    .foregroundColor(.cyan)
                    .padding()
                    .cornerRadius(10)
                    .onAppear() {
                        counter += 1
                    }
                    .confettiCannon(counter: $counter, num: 1, confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")], confettiSize: 30, repetitions: 30, repetitionInterval: 0.1)
            }
            .accentColor(.cyan)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
        
        
        .onAppear{
            
            // Prepare purchase params
            var purchaseParams: [String: Any] = [
              AnalyticsParameterTransactionID: "T12345",
              AnalyticsParameterAffiliation: "Google Store",
              AnalyticsParameterCurrency: "INR",
              AnalyticsParameterValue: 1498,
              AnalyticsParameterTax: 258,
              AnalyticsParameterShipping: 534,
              AnalyticsParameterCoupon: "SUMMER_FUN"
            ]

            // Add items
            purchaseParams[AnalyticsParameterItems] = [jeggings]

            // Log purchase event
            Analytics.logEvent(AnalyticsEventPurchase, parameters: purchaseParams)
        }
        
//        .onAppear {
//
//            var purchaseParams: [String: Any] = [
//                AnalyticsParameterTransactionID: "T12345",
//                AnalyticsParameterAffiliation: "Cozy Clothes App",
//                AnalyticsParameterCurrency: "INR",
//                AnalyticsParameterValue: 1499,
//                AnalyticsParameterTax: 258,
//                AnalyticsParameterShipping: "FREE",
//                AnalyticsParameterCoupon: "SUMMER_FUN",
//            ]
//
//            purchaseParams[AnalyticsParameterItems] = [OrangeSweater]
//            Analytics.logEvent(AnalyticsEventPurchase, parameters: purchaseParams)
//
//        }
        
        }
    }

struct PaymentSuccess_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessView()
    }
}
