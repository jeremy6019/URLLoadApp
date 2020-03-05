//
//  ViewController.swift
//  URLLoadApp
//
//  Created by 503 on 2020/03/05.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit
class Cars:Decodable{
    var list:Array<Car>
    
    init(list:Array<Car>){
        self.list = list
    }
}

class Car:Decodable{
    var name:String
    var price:Int
    
    init(name:String, price:Int){
        self.name=name
        self.price=price
    }
}
class ViewController: UIViewController {
   /*
     지금까지는 로컬자원만을 사용해왔다 이예제에서는 네트워크
     의원격지에 떨어진 데이터를 앱으로 로드해보자
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://localhost:7777")!
        
        print(url)
        do{
            let str = try String(contentsOf: url, encoding: String.Encoding.utf8)
            print(str)
            
            let data = str.data(using: String.Encoding.utf8)!
            //String자체는 json객체가 아니므로 , 파싱 즉 디코딩이 요구된다
            // ㅣㅣ최종적으로 완성된 결과뮬은 json을 Cars인스턴스로 옮겨놓운 결과물이다
            let cars = try JSONDecoder().decode(Cars.self, from: data)
            
            for obj in cars.list{
                print("이름:\(obj.name), 가격:\(obj.price)")
            }
            
        }catch{
            
        }
    }


}

