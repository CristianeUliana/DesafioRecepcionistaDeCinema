//
//  RecepcionistaTests.swift
//  RecepcionistaTests
//
//  Created by Cristiane Goncalves Uliana on 25/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import XCTest
@testable import Recepcionista

class RecepcionistaTests: XCTestCase {

   
    func testDeveLiberarEntradaMeiaNoiteSessaoAntesMeiaNoite() {
        
        let data = Date()
        
        let calendar = Calendar.current
        
        let dataAtual = calendar.date(
            bySettingHour: 00,
            minute: 00,
            second: 00,
            of: data)!.addDay(1)
        
        let dataSessao = calendar.date(
            bySettingHour: 23,
            minute: 30,
            second: 00,
            of: data)!
        
    
        let dataVerificada = ViewController().verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida"
        } else if dataMaxima < dataAtual {
            mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        
        XCTAssertTrue(mensagem == "Entrada permitida")
        

    }
    
    func testDeveLiberarEntradaDepoisMeiaNoiteSessaoAntesMeiaNoite() {
        
        let data = Date()
        
        let calendar = Calendar.current
        
        let dataAtual = calendar.date(
            bySettingHour: 00,
            minute: 30,
            second: 00,
            of: data)!.addDay(1)
        
        let dataSessao = calendar.date(
            bySettingHour: 23,
            minute: 59,
            second: 59,
            of: data)!
        
        
        let dataVerificada = ViewController().verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida"
        } else if dataMaxima < dataAtual {
            mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        
        XCTAssertTrue(mensagem == "Entrada permitida")
    }
    
    
    
    func testDeveLiberarEntradaMeiaNoiteSessaoDepoisMeiaNoite() {
        
        let data = Date()
        
        let calendar = Calendar.current
        
        let dataAtual = calendar.date(
            bySettingHour: 00,
            minute: 00,
            second: 00,
            of: data)!
        
        let dataSessao = calendar.date(
            bySettingHour: 00,
            minute: 30,
            second: 00,
            of: data)!
        
        
        let dataVerificada = ViewController().verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida"
        } else if dataMaxima < dataAtual {
            mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        
        XCTAssertTrue(mensagem == "Entrada permitida")
        
        
    }
    
    func testDeveLiberarEntradaAntesMeiaNoiteSessaoDepoisMeiaNoite() {
        
        let data = Date()
        
        let calendar = Calendar.current
        
        let dataAtual = calendar.date(
            bySettingHour: 23,
            minute: 59,
            second: 00,
            of: data)!.addDay(-1)
        
        let dataSessao = calendar.date(
            bySettingHour: 00,
            minute: 01,
            second: 00,
            of: data)!
        
        
        let dataVerificada = ViewController().verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida"
        } else if dataMaxima < dataAtual {
            mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        
        XCTAssertTrue(mensagem == "Entrada permitida")
        
        
    }
    
    func testDeveLiberarEntradaDepoisMeiaNoiteSessaoDepoisMeiaNoite() {
        
        let data = Date()
        
        let calendar = Calendar.current
        
        let dataAtual = calendar.date(
            bySettingHour: 00,
            minute: 00,
            second: 00,
            of: data)!
        
        let dataSessao = calendar.date(
            bySettingHour: 00,
            minute: 30,
            second: 00,
            of: data)!
        
        
        let dataVerificada = ViewController().verificacaoMeiaNoite(dataSessao, dataAtual)
        
        let dataMaxima = dataVerificada.addMinute(30).addSecond(59)
        let dataMinima = dataVerificada.addMinute(-30)
        
        var mensagem: String
        
        if dataMaxima >= dataAtual && dataMinima <= dataAtual {
            mensagem = "Entrada permitida"
        } else if dataMaxima < dataAtual {
            mensagem = "O tempo limite para entrada foi excedido"
        } else {
            mensagem = "Aguarde a abertura da sala"
        }
        
        
        XCTAssertTrue(mensagem == "Entrada permitida")
        
        
    }
}

