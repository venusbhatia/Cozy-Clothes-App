import SwiftUI
import FirebaseAnalytics
import FirebaseCore
import FirebaseInstallations

struct ContentView1: View {
    @StateObject var cartManager = CartManager()

    var body: some View {
        
        NavigationView {
            ProductList()
                .environmentObject(cartManager)
        }
    }
}

struct ProductList: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            VStack {
                ForEach(productList) { product in
                    ProductCard(product: product, cartManager: cartManager)
                }
            }
        }
    }
}


struct ProductCard: View {
    var product: Product
    var cartManager: CartManager
    
    var selectedItem: [String: Any] = [
      AnalyticsParameterItemListID: "L001",
      AnalyticsParameterItemListName: "SweatShirts",]
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product, cartManager: cartManager)) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    Image(product.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("₹ \(product.price)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
            }
        }
    }
}

struct ProductDetailView: View {
    var product: Product
    var cartManager: CartManager
    
    var selectedItem: [String: Any] = [
        AnalyticsParameterItemListID: "L001",
        AnalyticsParameterItemListName: "SweatShirts",
    ]

    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Text(product.name)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView{
                    
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: 270)
                    
                    Text(product.description)
                        .font(.title3)
                        .bold()
                }

                HStack {
                    Text("₹ \(product.price)")
                        .font(.title)
                        .bold()

                    Button {
                        cartManager.addToCart(product: product)
                        
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
                        
                        // Specify order quantity
                        venus[AnalyticsParameterQuantity] = cartManager.products.count

                        // Prepare item detail params
                        var itemDetails: [String: Any] = [
                          AnalyticsParameterCurrency: "INR",
                          AnalyticsParameterValue: product.price
                          
                        ]

                        // Add items
                        itemDetails[AnalyticsParameterItems] = [venus]
                        
                        // Log an event when product is added to cart
                        Analytics.logEvent(AnalyticsEventAddToCart, parameters: itemDetails)
                        
                        showingAlert = true
                        
//                        Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
//                            "Item_added_to_cart": product.name,
//                            "Parameter_Item_List": selectedItem,
//                            AnalyticsParameterCurrency: "INR",
//                            AnalyticsParameterValue: product.price,
//                        ])
                        
                    } label: {
                        Text("Add to Cart")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(25)
                            .padding()
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Item added to cart"),
                            message: Text("\(product.name) has been added to your cart."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .padding()
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
            .onAppear{
                var selectedItem: [String: Any] = [
                  AnalyticsParameterItemListID: "List1",
                  AnalyticsParameterItemListName: "Luxury Clothes",
                ]
                
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
                
                selectedItem[AnalyticsParameterItems] = [venus]

                // Log select item event
                Analytics.logEvent(AnalyticsEventSelectItem, parameters: selectedItem)
                
                // Prepare ecommerce parameters
                var productDetails: [String: Any] = [
                  AnalyticsParameterCurrency: "INR",
                  AnalyticsParameterValue: product.price
                ]

                // Add items array
                productDetails[AnalyticsParameterItems] = [venus]

                // Log view item event
                Analytics.logEvent(AnalyticsEventViewItem, parameters: productDetails)
            }
            
//            .onAppear {
//
//                var productDetails: [String: Any] = [
//                  AnalyticsParameterCurrency: "INR",
//                  AnalyticsParameterValue: product.price
//                ]
//
//                productDetails[AnalyticsParameterItems] = [product.name]
//
//                Analytics.logEvent(AnalyticsEventViewItem, parameters: productDetails)
//
//                Analytics.logEvent(AnalyticsEventSelectItem, parameters: [
//                    "selectedItem": product.name,
//                    "Parametercart Item List": selectedItem,
//                ])
//            }
            
            .environmentObject(cartManager)
        }
    }
}
