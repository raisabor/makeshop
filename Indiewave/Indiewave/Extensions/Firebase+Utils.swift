//
//  Firebase+Utils.swift
//  Indiewave
//
//  Created by Richmond Aisabor on 6/30/21.
//

import Firebase

extension Firestore {
    
    func fetchCurrentUser(completion: @escaping (User?, Error?) -> ()) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            // fetched our user here
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user, nil)
        }
    }
}

