//
//  ViewModel.swift
//  CombineVersusRx
//
//  Created by Gordon Choi on 2023/03/02.
//

import Combine

import RxSwift

final class ViewModel {
    @Published var combineFirstStream: Int
    @Published var combineSecondStream: Int
    
    var rxFirstStream: Observable<Int>
    var rxSecondStream: Observable<Int>

    init() {
        combineFirstStream = 1
        combineSecondStream = 1
        
        rxFirstStream = Observable.just(1)
        rxSecondStream = Observable.just(1)
    }
    
    func increaseCombineFirstStream() {
        
    }
    
    func increaseCombineSecondStream() {
        
    }
    
    func increaseRxFirstStream() {
        
    }
    
    func increaseRxSecondStream() {
        
    }
    
    func combineZip() {
        
    }
    
    func combineCombineLatest() {
        
    }
    
    func rxZip() {
        
    }
    
    func rxCombineLatest() {
        
    }
}
