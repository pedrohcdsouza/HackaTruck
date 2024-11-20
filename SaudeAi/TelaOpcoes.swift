import SwiftUI

struct TelaOpcoes: View {
    @State var CEP: String
    @StateObject var viewObj = ViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                // Fundo com gradiente da cor especificada
                LinearGradient(gradient: Gradient(colors: [
                    Color(hex: "ACD3FF")
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                HStack {
                    VStack {
                        Image(.logo)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .shadow(radius: 10)
                        
                       // Ajusta o valor para mover a imagem para cima

                          
                        Image(.logoNome)
                            .resizable()
                            .frame(width: 110, height: 55)
                    
                        Text("ÁREAS DE ACESSO ")
                            .padding()
                            .frame(width:500, height: 30)
                            .foregroundColor(Color(hex:"08569B"))
                            .underline()
                            .cornerRadius(8)
                            .offset(y: 2)
                        
                        // Primeiro botão de navegação
                        NavigationLink(destination: Calendar_vacinacao()) {
                            Text("Calendário da Vacinação")
                                .frame(width: 300, height:20)
                                .padding(16) // Padding uniforme
                                .background(Color(hex: "08569B"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        // Segundo botão de navegação
                        NavigationLink(destination: Medicamentos(CEP: CEP)) {
                            Text("Medicamentos Disponíveis no SUS")
                                .frame(width:300, height:20)
                                .padding(16) // Padding uniforme
                                .background(Color(hex: "08569B"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .offset(y: -30)
                    .padding()
                }
            }
        }
    }
}

// Função para criar cor a partir de um código hexadecimal
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    TelaOpcoes(CEP: " ")
}
