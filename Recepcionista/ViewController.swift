//
//  ViewController.swift
//  Recepcionista
//
//  Created by Cristiane Goncalves Uliana on 25/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var dataSessaoTextField: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dataSessaoEntrouEmFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataSessaoTextField(sender:)), for: .valueChanged)
    }

    
    @objc func exibeDataSessaoTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy - hh:mm a"
        self.dataSessaoTextField?.text = formatador.string(from: sender.date)
    }

    
    func verificaDataSessao() -> Date? {
        guard let dataSessao = dataSessaoTextField?.text else {return nil}
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy - hh:mm a"
        formatador.timeZone = TimeZone(secondsFromGMT: -3)
        guard let dateSessaoFromString: Date = formatador.date(from: dataSessao) else {return nil}
        //print(dateSessaoFromString)
        return dateSessaoFromString
    }
    
    
    func verificaDataAtual() -> Date {
        let data = Date()
        let dataAtual = data.addHour(-3)
        //print(dataAtual)
        return dataAtual
    }
    
    func exibeMensagem(_ mensagem: String) {
        let alerta = UIAlertController(title: "Atenção!", message: mensagem, preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    func verificacaoMeiaNoite(_ dataSessao: Date, _ dataAtual: Date) -> Date {
        var data = dataSessao
        let calendar = Calendar.current
        
        let onzeMeia = calendar.date(
            bySettingHour: 23,
            minute: 30,
            second: 00,
            of: dataSessao)!
        
        let onzeCinquentaNove = calendar.date(
            bySettingHour: 23,
            minute: 59,
            second: 59,
            of: dataSessao)!
        
        let meiaNoite = calendar.date(
            bySettingHour: 00,
            minute: 00,
            second: 00,
            of: dataSessao)!
        
        let meiaNoiteMeia = calendar.date(
            bySettingHour: 00,
            minute: 29,
            second: 59,
            of: dataSessao)!
        
        let dataAtualMaisUm = dataSessao.addDay(1)
        let dataAtualMenosUm = dataSessao.addDay(-1)
        
        if dataSessao >= onzeMeia && dataSessao <= onzeCinquentaNove && dataAtual == dataAtualMaisUm {
                data = dataSessao.addDay(+1)
        } else if dataSessao >= meiaNoite && dataSessao <= meiaNoiteMeia && dataAtual == dataAtualMenosUm{
            data = dataSessao.addDay(-1)
        }
        return data
    }
    
    

    @IBAction func verificarButton(_ sender: UIButton) {
        
        guard let dataSessao = verificaDataSessao() else {return}
        let dataAtual = verificaDataAtual()
        
        let dataVerificada = verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida. Dirija-se à sala 05."
        } else if dataMaxima < dataAtual {
           mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        exibeMensagem(mensagem)
    }
}



    extension Date {
        
        func addDay(_ day: Int = 0) -> Date {
            
            return Calendar.current.date(byAdding: .day, value: day, to: self) ?? Date()
        }
        
        func addHour(_ value: Int = 0) -> Date {
            
            return Calendar.current.date(byAdding: .hour, value: value, to: self) ?? Date()
        }
        
        func addMinute(_ minute: Int = 0) -> Date {
            
            return Calendar.current.date(byAdding: .minute, value: minute, to: self) ?? Date()
        }
        
        func addSecond(_ second: Int = 0) -> Date {
            
            return Calendar.current.date(byAdding: .second, value: second, to: self) ?? Date()
        }
    }
    
