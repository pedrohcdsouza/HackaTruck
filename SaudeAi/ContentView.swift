//
//  ContentView.swift
//  testebotao
//
//  Created by Turma01-23 on 14/11/24.
//

import SwiftUI

import SwiftUI
struct ContentView: View {
    @State private var givenCEP: String = "" // Estado para armazenar o texto do TextField
    @State private var isActive: Bool = false
    var body: some View {
        let codigo_regiao = String(givenCEP.prefix(2))
        NavigationStack{
        ZStack{
            Color.azulBackGround
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    Image(.logo)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .shadow(radius: 10)
                    Image(.logoNome)
                        .resizable()
                        .frame(width: 110, height: 55)
                    
                }// FIM DE VSTACK LOGOS

                    VStack{
                        HStack {
                            // TextField que recebe a entrada do usuário
                            TextField("Digite seu CEP",
                                      text: $givenCEP)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300, height: 100)
                            .padding()
                            .offset(x:40,y:0)
                            
                            // Botão que só é ativado se o TextField não estiver vazio
                            Button(action: {
                                // Ação que será realizada quando o botão for pressionado
                                if (!givenCEP.isEmpty ){
                                    isActive = true
                                } // FIM DO IF
                            }) {
                                Text("Buscar")
                                    .frame(width: 60,height: 1)
                                    .padding(1)
                                    .padding()
                                    .background(givenCEP.isEmpty ? Color.gray : Color.azulEscuro)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .offset(x:-40,y:0)
                            }
                            .disabled(givenCEP.isEmpty) // Desativa o botão se o campo estiver vazio
                            NavigationLink(
                                destination: TelaOpcoes(CEP: codigo_regiao),
                                isActive: $isActive, // Controla quando a navegação acontece
                                label: { EmptyView() } // Não exibe nada aqui, pois a navegação é feita programaticamente
                            )
                            .hidden()
                        }// FIM DE HSTACK
                        .padding()
                        
                        HStack{
                            Image(.location)
                                .resizable()
                                .frame(width: 17, height: 17)
                            Link("Não sei o meu CEP", destination: URL(string: "https://buscacepinter.correios.com.br/app/endereco/index.php")!)
                            // Link site do correio para pesquisar o CEP de acordo com a região
                                .foregroundColor(Color.azulEscuro)
                                .font(.system(size: 12))
                                .bold()
                                .offset(x:-5,y:1)
                        }
                        .offset(x:-92,y:-64)
                    }
                    .offset(x:0,y:-25)
                }//FIM NAVIGATIONSTACK
            } // FIM DE ZSTACK
        } // FIM DO BODY VIEW
    }// FIM DO CONTENTVIEW
}

#Preview {
    ContentView()
}
