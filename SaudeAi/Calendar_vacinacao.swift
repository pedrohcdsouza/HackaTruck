//
//  Teste1.swift
//  Testes_Calendar
//
//  Created by Turma01-10 on 13/11/24.
//

import Foundation
import SwiftUI

struct Calendar_vacinacao: View {
    
    let year = Calendar.current.component(.year, from: Date())
    
    @State private var date = Date()
    @StateObject private var viewObj = ViewModel()
    
    @State var arrayVacinas: [structVa] = []
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        
        let startComponents = DateComponents(year: calendar.component(.year, from: Date()), month: 1, day: 1)
        
        let endComponents = DateComponents(year: calendar.component(.year, from: Date()), month: 12, day: 31, hour: 23, minute: 59, second: 59)
        
        return calendar.date(from: startComponents)!...calendar.date(from: endComponents)!
    }()
    
    
    @State private var colorBackGround: Color = .azulBackGround
    
    // Função para obter o mês de uma string de data
    func getMonth(from dateString: String) -> Int? {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let date = dateFormatter.date(from: dateString) {
            
            let calendar = Calendar.current
            return calendar.component(.month, from: date)
            
        }
        
        return nil
        
    }
    
    // Função para filtrar as vacinas do mês selecionado
    var filteredVacinas: [structVa] {
        let calendar = Calendar.current
        let selectedMonth = calendar.component(.month, from: date)
        return arrayVacinas.filter { v in
            if let vacinaMonth = getMonth(from: v.data!) {
                return vacinaMonth == selectedMonth
            }
            return false
        }
    }

    var body: some View {
        ZStack {
            colorBackGround
            
            VStack {//VStack LOGO
                
                VStack { // Logo
                    
                    HStack {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                        
                        Image(.logoNome)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x:0,y:3)
                        
                        Spacer()
                    }
                    .padding()
                    .position(x: 260, y: 50)
                }//VStack - Logo
                Spacer()
                VStack { // DatePicker
                    
                    DatePicker(
                        "Selecione o mês da campanha: ",
                        selection: $date,
                        in: dateRange,
                        displayedComponents: [.date]
                    )
                    .environment(\.locale, .init(identifier: "US"))
                    .datePickerStyle(.graphical)
                    .frame(width: 280, height: 280)
                    .padding()
                    //                    .border(Color.azulEscuro)
                    .cornerRadius(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.azulEscuro, lineWidth: 4)
                    )
                }//DatePicker
                .position(x: 170, y: 30)
                .padding()
                
                VStack {//Lista de vacinas na tela
                    
                    Spacer()
                    
                    Text("Campanhas")
                        .foregroundStyle(.azulEscuro)
                        .bold()
                        .padding()
                        .font(.system(size: 20))
                    ScrollView {
                        ForEach(filteredVacinas, id: \.self) { vacina in
                            ZStack {
                                Rectangle()
                                    .frame(width: 310, height: 70)
                                    .foregroundStyle(.azulClaro.opacity(0.6))
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(vacina.data!)
                                        Text(vacina.nome!)
                                    }
                                    Text(vacina.des!)
                                    //.font(.subheadline)
                                        .foregroundColor(.black.opacity(0.59))
                                    
                                }
                                //                                .padding([.top, .bottom])
                                //                                .padding([.leading, .trailing], 45)
                                //                                .background(Color.azulClaro.opacity(0.7))
                                //                                .padding()
                            }
                        }
                        
                    }//Lista de vacinas
                    //.background(.azulClaro)
                    .cornerRadius(10)
                    // .frame(width: 200, height: 0)
                }//VStack scrollView
                //.padding()
                //Icone de exportar pra pdf
                VStack{
                    Image(.importPDF)
                        .scaledToFit()
                    
                }
            }
        }
        .onAppear() {
            viewObj.fetch()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                for obj in viewObj.chars {
                    for vacina in obj.vacina! {
                        if arrayVacinas.count < obj.vacina!.count {
                            arrayVacinas.append(vacina)
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Calendar_vacinacao()
}
