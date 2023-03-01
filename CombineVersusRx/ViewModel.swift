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
    
    private var rxFirstSubject = BehaviorSubject(value: 1)
    private var rxSecondSubject = BehaviorSubject(value: 1)
    
    var rxFirstStream: Observable<Int> {
        return rxFirstSubject.asObservable()
    }
    var rxSecondStream: Observable<Int> {
        return rxSecondSubject.asObservable()
    }

    init() {
        combineFirstStream = 1
        combineSecondStream = 1
    }
    
    func increaseCombineFirstStream() {
        combineFirstStream += 1
    }
    
    func increaseCombineSecondStream() {
        combineSecondStream += 1
    }
    
    func increaseRxFirstStream() {
        guard let value = try? rxFirstSubject.value() else {
            debugPrint("Failed to get value")
            return
        }
        
        rxFirstSubject.onNext(value + 1)
    }
    
    func increaseRxSecondStream() {
        guard let value = try? rxSecondSubject.value() else {
            debugPrint("Failed to get value")
            return
        }
        
        rxSecondSubject.onNext(value + 1)
    }
}
