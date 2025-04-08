import SwiftUI

struct ListPage: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.twoXL) {
                    VStack(alignment: .leading){

                        ListView(title: "Documents", items: listItems1, isInteractive: true)
                    }
                
                    VStack(alignment: .leading){
                        ListView(items: listItems2, isInteractive: true)
                    }
                    
                    VStack(alignment: .leading){
                       
                        
                        ListView(items: listItems3, isInteractive: true)
                    }
                   
                    VStack(alignment: .leading){
                        
                        ListView(title: "Why you should stay with Reliant", items: listItems4, isInteractive: false)
                    }
                   
                    VStack(alignment: .leading){
                        
                        ListView(title: "Why you should stay with Reliant", items: listItems5, isInteractive: true)
                        
                    }
                }
                .pageMargins()
            }
        }
    }
   
    var listItems1: [ListItem] {
        [
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                
                text: "Electricty Facts Label",
                textStyle: .link,
               
                rightIcon: Icon(
                    iconName: "download",
                    type: .utility,
                    size: .medium,
                    color: .iconFeedbackSuccess
                ),
                action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
            ),
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Terms of service",
                textStyle: .link,
                rightIcon: Icon(
                    iconName: "download",
                    type: .utility,
                    size: .medium,
                    color: .iconFeedbackSuccess
                ),
                action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
            ),
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Customer Rights",
                textStyle: .link,

                rightIcon: Icon(
                    iconName: "download",
                    type: .utility,
                    size: .medium,
                    color: .iconFeedbackSuccess
                ),
                action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
            )
        ]
    }
    
    var listItems2: [ListItem] {
        [
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Benefits of staying with Reliant",
                textStyle:.h4,
                rightIcon: Icon(
                    iconName: "chevron_right",
                    type: .utility,
                    size: .medium,
                    color: .grayscale900
                ),
                action: .navigate(destination: AnyView(TagDemoPage()))
            )
           
        ]
    }
    
    var listItems3: [ListItem] {
        [
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Benefits of staying with Reliant",
                textStyle:.h4,
                rightIcon: Icon(
                    iconName: "chevron_right",
                    type: .utility,
                    size: .medium,
                    color: .grayscale900
                ),
                action: .showBottomSheet(sheetContent:
                        AnyView(
                            VStack(alignment: .leading){
                                ListView(title: "Why you should stay with Reliant", items: listItems4, isInteractive: false)
                            }
                        )
                    )
            )
        ]
    }
    
    var listItems4: [ListItem] {
        [
            ListItem(
                leftIcon: Icon(
                    iconName: "circle-check-sharp-regular-utility",
                    type: .utility,
                    size: .medium,
                    color: .iconDefaultGreenUI
                ),
                text: "Lorem ipsum dolor emit",
                textStyle:.p1
            ),
            ListItem(
                leftIcon: Icon(
                    iconName: "circle-dollar-regular-utility",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Gain greater price stability for the length of your term",
                textStyle:.p1
            ),
            ListItem(
                leftIcon: Icon(
                    iconName: "circle-plus-regular-utility",
                    type: .utility,
                    size: .medium,
                    color: .iconDefaultTertiary
                ),
                text: "Exclusive offers, helpful tools, and detailed usage tracking",
                textStyle:.p1
            )
           
        ]
    }
    
    var listItems5: [ListItem] {
        [
            ListItem(
                leftIcon: Icon(
                    iconName: "bill",
                    type: .utility,
                    size: .medium,
                    color: .primaryBase
                ),
                text: "Benefits of staying with Reliant",
                textStyle:.h4,
                rightIcon: Icon(
                    iconName: "chevron_right",
                    type: .utility,
                    size: .medium,
                    color: .grayscale900
                ),
                action: .showBottomSheet(sheetContent:
                        AnyView(
                           
                                VStack{
                                    
                                    Text("Why you should stay with Reliant")
                                        .typographyStyle(.h4)
                                    ListView(items: listItems4, isInteractive: false)
                                    Text("hdhdhhdhd")
                                    ListView(items: listItems4, isInteractive: false)
                                    Text("hdhdhhdhd")
                                    ListView(items: listItems4, isInteractive: false)
                                    
                                    
                                    
                                }
                              
                            
                        )
                    )
            )
        ]
    }
}

    
struct ListViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ListPage()
        }
    }
}

