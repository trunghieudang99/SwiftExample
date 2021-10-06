//
//  ViewModelType.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 03/10/2021.
//

protocol ViewModelType {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}
