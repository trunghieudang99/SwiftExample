//
//  SayHelloViewModel.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 03/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class SayHelloViewModel: ViewModelType {

    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let greeting = input.validate
            .withLatestFrom(input.name)
            .map { name in
                return "Hello \(name)"
            }
            .startWith("")
            .asDriver(onErrorJustReturn: ":-(")
        return Output(greeting: greeting)
    }
    
}
