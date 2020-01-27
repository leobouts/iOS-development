//
//  Constants.swift
//  PokeDex
//
//  Created by Leonidas on 28/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"


//closure that informs the controller our downloaded data are available for him to load so it dont crash
typealias DownloadComplete = () -> ()
