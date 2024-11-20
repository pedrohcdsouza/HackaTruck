//
//  ContentView.swift
//  SaudeAi
//
//  Created by Turma01-11 on 08/11/24.
//

import SwiftUI

struct SheetView2: View {
    @Environment(\.dismiss) var dismiss
    @State var corNow : Color = .azulBackGround
    @Binding var remNome: String
    @State var CEP: String
    @StateObject var vmState = ViewModel()


    var body: some View {
        ZStack{
            corNow
            VStack{
                Text("Remédios Encontrados")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.azulEscuro)
                    .font(.system(size: 20))
                    .border(Color.azulEscuro)
                    .cornerRadius(80)
                    .font(.headline)
                    .padding(.top)
                Spacer()
                ScrollView{
                    ForEach(vmState.chars, id: \.self){ l in
                        ForEach(l.remedio!, id: \.self){e in
                            
                        
                    if(e.nome!.lowercased().contains(remNome.lowercased())){
                        HStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.azulEscuro)
                                    .frame(width: 350, height: 110)
                                    .overlay(
                                        HStack{
                                            Image(.pilula2)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 90)
                                                .background(Color.white)
                                                .padding(.horizontal, 10)
                                            Spacer()
                                            
                                            VStack{
                                                Text(" \(e.nome!)")
                                                    .frame(maxWidth: 100, alignment: .center)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .border(Color.azulClaro)
                                                    .background(.azulClaro)
                                                    .cornerRadius(20)
                                                    .offset(x: -75)
                                                    .padding(.vertical, 2)
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        Text("Indicação: \(e.ind!)")
                                                            .frame(width: .infinity)
                                                            .bold()
                                                            .foregroundColor(.white)
                                                        Text("Tarja: \(e.tarja!)")
                                                        
                                                            .frame(width: .infinity, height: 25)
                                                            .bold()
                                                            .foregroundColor(.white)
                                                        
                                                    }
                                                    Spacer()
                                                }
                                            }
                                        }
                                    )}
                        }
                    }
                    }
                    }
                }
                Spacer()
                Button("Voltar") {
                    dismiss()
                }
                .frame(width: 100, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
                .padding()
            }
        }.onAppear(){
            vmState.fetch()
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tarjaCor: String
    var res: [rem] = []
    @State var corNow : Color = .azulBackGround
    @StateObject var vmState = ViewModel()
    
    var body: some View {
        ZStack{
            corNow
            VStack{
                if (tarjaCor == "AMARELA"){
                    Text("REMÉDIOS TARJA \(tarjaCor)")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.yellow)
                        .font(.system(size: 20))
                        .border(Color.yellow)
                        .cornerRadius(80)
                        .font(.headline)
                        .padding(.top)
                  
                    ForEach(vmState.chars, id: \.self){l in
                        ForEach(l.remedio!, id: \.self){e in
                        if(e.tarja == "amarela"){
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.azulEscuro)
                                        .frame(width: 350, height: 110)
                                        .overlay(
                                            HStack{
                                                Image(.pilula2)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 90)
                                                    .background(Color.white)
                                                    .padding(.horizontal, 10)
                                                Spacer()
                                                
                                                VStack{
                                                    Text(" \(e.nome!)")
                                                        .frame(maxWidth: 100, alignment: .center)
                                                        .bold()
                                                        .foregroundColor(.white)
                                                        .border(Color.azulClaro)
                                                        .background(.azulClaro)
                                                        .cornerRadius(20)
                                                        .offset(x: -75)
                                                        .padding(.vertical, 2)
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            Text("Indicação: \(e.ind!)")
                                                                .frame(width: .infinity)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            Text("Tarja: \(e.tarja!)")
                                                            
                                                                .frame(width: .infinity, height: 25)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            
                                                        }
                                                        Spacer()
                                                    }
                                                }
                                            }
                                        )}
                            }
                            }
                        }
                    }
                }
                else if (tarjaCor == "PRETA"){
                    Text("REMÉDIOS TARJA \(tarjaCor)")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .font(.system(size: 20))
                        .border(Color.black)
                        .cornerRadius(80)
                        .font(.headline)
                        .padding(.top)
                    
              
                    ForEach(vmState.chars, id: \.self){l in
                        ForEach(l.remedio!, id: \.self){ e in
                            
                        
                        if(e.tarja == "preta"){
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.azulEscuro)
                                        .frame(width: 350, height: 110)
                                        .overlay(
                                            HStack{
                                                Image(.pilula2)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 90)
                                                    .background(Color.white)
                                                    .padding(.horizontal, 10)
                                                Spacer()
                                                
                                                VStack{
                                                    Text(" \(e.nome!)")
                                                        .frame(maxWidth: 100, alignment: .center)
                                                        .bold()
                                                        .foregroundColor(.white)
                                                        .border(Color.azulClaro)
                                                        .background(.azulClaro)
                                                        .cornerRadius(20)
                                                        .offset(x: -75)
                                                        .padding(.vertical, 2)
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            Text("Indicação: \(e.ind!)")
                                                                .frame(width: .infinity)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            Text("Tarja: \(e.tarja!)")
                                                            
                                                                .frame(width: .infinity, height: 25)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            
                                                        }
                                                        Spacer()
                                                    }
                                                }
                                            }
                                        )}
                                }
                            }
                        }
                    }

                }
                else if (tarjaCor == "VERMELHA"){
                    Text("REMÉDIOS TARJA \(tarjaCor)")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .font(.system(size: 20))
                        .border(Color.red)
                        .cornerRadius(80)
                        .font(.headline)
                        .padding(.top)
                  
                    ForEach(vmState.chars, id: \.self){l in
                        ForEach(l.remedio!, id: \.self){e in
                        if(e.tarja == "vermelha"){
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.azulEscuro)
                                        .frame(width: 350, height: 110)
                                        .overlay(
                                            HStack{
                                                Image(.pilula2)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 90)
                                                    .background(Color.white)
                                                    .padding(.horizontal, 10)
                                                Spacer()
                                                
                                                VStack{
                                                    Text(" \(e.nome!)")
                                                        .frame(maxWidth: 100, alignment: .center)
                                                        .bold()
                                                        .foregroundColor(.white)
                                                        .border(Color.azulClaro)
                                                        .background(.azulClaro)
                                                        .cornerRadius(20)
                                                        .offset(x: -75)
                                                        .padding(.vertical, 2)
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            Text("Indicação: \(e.ind!)")
                                                                .frame(width: .infinity)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            Text("Tarja: \(e.tarja!)")
                                                            
                                                                .frame(width: .infinity, height: 25)
                                                                .bold()
                                                                .foregroundColor(.white)
                                                            
                                                        }
                                                        Spacer()
                                                    }
                                                }
                                            }
                                        )}
                                }
                            }
                        }
                    }

                }
                Spacer()
               
                Button("Voltar") {
                    dismiss()
                }
                .frame(width: 100, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
                .padding()
            }.onAppear(){
                vmState.fetch()
            }
        }
    }
}

struct Medicamentos: View {
    @State var CEP: String
    @State var tcor: String = ""
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @StateObject var viewModel = ViewModel()
    @State var corNow : Color = .azulBackGround
    @State var recebe: String = ""
    @StateObject var vmState = ViewModel()
    var remFinal: [rem] = []

    var body: some View {
        ZStack{
            corNow
            VStack {
                HStack{
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                    Image(.logoNome)
                        .resizable()
                        .frame(width: 110, height: 55)
                }
                .padding(10)
                HStack{
                    TextField("Pesquise seu remédio", text: $recebe)
                        .frame(width: 200)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    Button(action: {
                        showingSheet2.toggle()}){
                            Text("Buscar")
                                .frame(width: 90,height: 35)
                                .padding(10)
                                .background(Color.azulEscuro)
                                .foregroundColor(.white)
                                .bold()
                                .cornerRadius(10)}
                            .sheet(isPresented: $showingSheet2) {
                                SheetView2(remNome:$recebe, CEP: CEP)
                        }
                }
                
                Text("Categorias")
                    .foregroundColor(.azulEscuro)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack{
                    Button(action: {
                        showingSheet.toggle()
                        tcor = "PRETA"}){
                            Image(.tarjapreta)
                                .padding(20)
                                .background(Color.white)
                            .border(Color.azulEscuro, width: 5)}
                            .sheet(isPresented: $showingSheet) {
                                SheetView(tarjaCor: $tcor)
                        }
                    Button(action: {
                        showingSheet.toggle()
                        tcor = "VERMELHA"}){
                            Image(.tarjavermelha)
                                .padding(23)
                                .background(Color.white)
                            .border(Color.azulEscuro, width: 5)}
                            .sheet(isPresented: $showingSheet) {
                            SheetView(tarjaCor: $tcor)
                        }
                    Button(action: {
                        showingSheet.toggle()
                        tcor = "AMARELA"}){
                            Image(.tarjayellow)
                                .padding(22)
                                .background(Color.white)
                            .border(Color.azulEscuro, width: 5)}
                            .sheet(isPresented: $showingSheet) {
                            SheetView(tarjaCor: $tcor)
                        }
                    }
               ScrollView{
                   Spacer()
                   VStack{
                       ForEach(vmState.chars, id: \.self){l in
                           ForEach(l.remedio!, id: \.self){ e in
                           HStack{
                               ZStack{
                                   Rectangle()
                                       .foregroundColor(.azulEscuro)
                                       .frame(width: 350, height: 110)
                                      
                                   HStack{
                                       Image(.pilula2)
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 90)
                                           .background(Color.white)
                                           .padding(.horizontal, 20)
                                       Spacer()
                                           VStack{
         
                                                   Text(" \(e.nome!)")
                                                       .frame(maxWidth: 100, alignment: .center)
                                                       .bold()
                                                       .foregroundColor(.white)
                                                       .border(Color.azulClaro)
                                                       .background(.azulClaro)
                                                       .cornerRadius(20)
                                                       .offset(x: -75)
                                                       .padding(.vertical, 2)
                                                   HStack{
                                                       VStack(alignment: .leading){
                                                           Text("Indicação: \(e.ind!)")
                                                               .frame(width: .infinity)
                                                               .bold()
                                                               .foregroundColor(.white)
                                                           Text("Tarja: \(e.tarja!)")

                                                               .frame(width: .infinity, height: 25)
                                                               .bold()
                                                               .foregroundColor(.white)
                                                           
                                                       }
                                                       Spacer()
                                                   }
                                               }
                                               
                                          
                                       }
                                      
                                   }
                               }
                           }
                           
                       }
                   }.onAppear(){
                       vmState.fetch()
                   }
                }
                Spacer()
            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Medicamentos(CEP: " ")
}
