//
//  PromptExample.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 29.06.2023.
//

import SwiftUI

struct PromptExample: Identifiable {
    
    // MARK: - Public Properties
    let id = UUID()
    let style: ArtStyle
    let prompt: String
    let imageName: String
    
    // MARK: - Initialization
    init(style: ArtStyle, prompt: String, imageName: String? = nil) {
        self.style = style
        self.prompt = prompt
        self.imageName = imageName ?? "\(style.rawValue)-example"
    }
}

// MARK: - Hashable
extension PromptExample: Hashable { }

// MARK: - Public Static Properties
extension PromptExample {
    
    static let allExamples = [
        PromptExample(
            style: .enhance,
            prompt: "Gothic cathedral in a stormy night, with lightning illuminating the sky and rain pouring down, high resolution"
        ),
        PromptExample(
            style: .model3D,
            prompt: "Florarium, inside a glass lamp, the intricate detail, centered, volumetric lighting, hyper-detailed, ultra-realistic, sharp focus, volumetric, ray tracing"
        ),
        PromptExample(
            style: .cinematic,
            prompt: "Beautiful face, upturned nose, big lips, red hair, blue eyes, Woman, princess, crown, medieval 4k, highly detailed, hyperrealistic, photo, professional picture, ultra detailed, ultra realistic, sharp focus"
        ),
        PromptExample(
            style: .isometric,
            prompt: "Stunning sunset over an ocean horizon, with orange and pink hues spreading across the sky, peaceful, serene, high detail, seascape"
        ),
        PromptExample(
            style: .enhance,
            prompt: "Chocolate cake with rich, fudgy frosting and perfectly layered cake, garnished with fresh berries and drizzled with melted chocolate, decadent, sweet, high detail, food photography",
            imageName: "enhance-example-2"
        ),
        PromptExample(
            style: .digitalArt,
            prompt: "Super cute blue baby dragon, cartoon character, dreamy eyes, highly detailed, dreamlike"
        ),
        PromptExample(
            style: .fantasyArt,
            prompt: "Daring astronaut, space suit and helmet, standing in front of futuristic spaceship, in a flower field, adventurous, detailed, high detail, portrait"
        ),
        PromptExample(
            style: .lowPoly,
            prompt: "Hummingbird bird sitting on a branch, bright, high detail"
        ),
        PromptExample(
            style: .anime,
            prompt: "The Little Mermaid, anime, beautiful face, long hair, high detail, sharp focus, pink hair"
        ),
        PromptExample(
            style: .photographic,
            prompt: "Photorealistic, rabbit, sitting in a chamomile field, sun, spring, high detail, sharp focus, 8k"
        )
    ]
}
