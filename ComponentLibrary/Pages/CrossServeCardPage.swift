import SwiftUI
struct CrossServeCardPrice_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                CrossServeCard(
                    image: "mask",
                    tag: "Included",
                    tagColor: .greenAccessible,
                    enrollText:"Enrolled on 08/23/2024",
                    title: "Free nights",
                    description: "No energy charge every night from 8 pm to 6 am",
                    isSelected: true
                )
                
                CrossServeCard(
                    image: "doorbell",
                    tag: "Included",
                    tagColor:.greenAccessible,
                    brandImage: "brand",
                    title: "Home Base Essentials",
                    description: "Get a Vivint Smart Thermostat,  Doorbell Camera Pro and installation for FREE!",
                    link: "View details",
                    price: CrossServeCardPrice(oldPrice: "$299", newPrice: "Free", subtext: "Installation included", subtextColor: .iconDefaultGreenUI),
                    footerLink: "Activate"
                )
                
                CrossServeCard(
                    image: "maskRewards",
                    title: "Reliant Rewards",
                    description: "Reliant Rewards lets you earn points to redeem for bill credits, Amazon gift cards, and more.",
                    link: "View details",
                    price: CrossServeCardPrice(newPrice: "0 POINTS", subtext: "as of 01/13/2025"),
                    footerLink: "Add"
                )
                
                CrossServeCard(
                    image: "doorbell",
                    tag: "Included",
                    tagColor: .greenAccessible,
                    brandImage: "brand",
                    enrollText: "Enrolled on 08/23/2024",
                    title: "Home Base Essentials",
                    description: "Get a Vivint Smart Thermostat,  Doorbell Camera Pro and installation for FREE!",
                    link: "View details",
                    price: CrossServeCardPrice(newPrice: "$240", subtext: "Your estimated average bill for next month"),
                    footerLink: "Manage"
                )
                
                CrossServeCard(
                    image: "doorbell",
                    title: "A/C Heat Protect",
                    description: "Keep cool summer – get protected against costly AC repairs",
                    link: "View details",
                    price:CrossServeCardPrice( newPrice: "Free"),
                    footerLink: "Add item"
                )
                
                CrossServeCard(
                    image: "doorbell",
                    brandImage: "brand",
                    title: "Home Base Essentials",
                    description: "Get a Vivint Smart Thermostat,  Doorbell Camera Pro and installation for FREE!",
                    link: "View details",
                    price:CrossServeCardPrice( newPrice: "Free"),
                    footerLink: "Add item",
                    isSelected: true
                )
                
                CrossServeCard(
                    image: "doorbell",
                    tag: "Pending",
                    tagColor: .grayscale400,
                    brandImage: "brand",
                    title: "Schedule free installation",
                    description: "Enjoy hassle-free installation of your smart thermostat and doorbell by Vivint professionals, ensuring optimal performance and security. Please schedule to complete this offer.",
                    buttonText:"Schedule free installation",
                    buttonVariant: .primary,
                    footerText: "Need more help? Talk to an agent 1-XXX-XXX-XXXX"
                )
                
                CrossServeCard(
                    image: "doorbell",
                    tag: "Homeowner exclusive",
                    tagColor: .tertiaryBase,
                    brandImage: "brand",
                    title: "Home Base Essentials",
                    description: "Get a Vivint Smart Thermostat,  Doorbell Camera Pro and installation for FREE!",
                    buttonText:"View offer",
                    buttonVariant: .primary
                )
                
                CrossServeCard(
                    image: "doorbell",
                    title: "Average billing",
                    description: "Designed to make bill amounts more predictable and easier to handle by averaging electricity costs",
                    buttonText:"Watch video",
                    buttonVariant: .secondary
                )
                
                CrossServeCard(
                    image: "doorbell",
                    tag: "Pending Schedule",
                    tagColor: .grayscale400,
                    brandImage: "brand",
                    title: "Schedule free installation",
                    description: "Enjoy hassle-free installation of your smart thermostat and doorbell by Vivint professionals, ensuring optimal performance and security. Please schedule to complete this offer.Enjoy hassle-free installation of your smart thermostat and doorbell by Vivint professionals, ensuring optimal performance and security. Please schedule to complete this offer.",
                    buttonText:"Schedule free installation",
                    buttonVariant: .primary,
                    footerText: "Need more help? Talk to an agent 1-XXX-XXX-XXXX",
                    imageOnRight: true
                )
                
                CrossServeCard(
                    image: "update",
                    title: "You are eligible to renew your plan",
                    description: "Your current plan is ending soon, and you are eligible to renew now.",
                    buttonText:"View available plans",
                    buttonVariant: .primary,
                    imageOnRight: true,
                    backgroundColor: ColorToken.containerFillPrimaryDefault
                )
            }
            .padding()
        }
    }
}


