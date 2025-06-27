import SwiftUI

struct StakeQuizQuestion: Identifiable, Equatable {
    let id = UUID()
    let question: String
    let subtitle: String?
    let answers: [String]
    let correctIndex: Int
    let explanation: String
}

struct StakeQuizModel {
    static let allQuestions: [StakeQuizQuestion] = [
        .init(question: "How should you wash a football uniform?", subtitle: "Wash like a Champion", answers: ["With regular clothes", "Separately, inside out, cold water", "Only with bleach"], correctIndex: 1, explanation: "Sports fabrics require delicate handling, and casual clothing can damage them."),
        .init(question: "How to remove odor from sportswear?", subtitle: nil, answers: ["Use vinegar or soda soak", "Just air dry", "Spray perfume"], correctIndex: 2, explanation: "Soaking in vinegar or soda kills bacteria and removes odor."),
        .init(question: "How to dry football boots?", subtitle: nil, answers: ["On a radiator", "With paper inside, air dry", "In direct sun"], correctIndex: 1, explanation: "Dry boots with paper inside, away from heat sources."),
        .init(question: "How to clean shin guards?", subtitle: nil, answers: ["Wipe with damp cloth", "Machine wash", "Soak in bleach"], correctIndex: 0, explanation: "Wipe with a damp cloth and mild soap."),
        .init(question: "How to store goalkeeper gloves?", subtitle: nil, answers: ["Twist and wring", "Wrap in towel, air dry", "Leave wet in bag"], correctIndex: 1, explanation: "Wrap in towel, dry away from sun, never twist."),
        .init(question: "How to prevent mold in a sports bag?", subtitle: nil, answers: ["Air out after use", "Keep closed", "Spray deodorant"], correctIndex: 2, explanation: "Always air out your bag after use to prevent mold."),
        .init(question: "How to wash gaiters?", subtitle: nil, answers: ["With everything else", "Separately, delicate mode", "Boil them"], correctIndex: 1, explanation: "Wash gaiters separately on a delicate cycle."),
        .init(question: "How to clean a water bottle?", subtitle: nil, answers: ["Rinse with water", "Wash with soap daily", "Never clean"], correctIndex: 1, explanation: "Wash bottles with soap daily to prevent bacteria."),
        .init(question: "How to remove grass stains?", subtitle: nil, answers: ["Use stain remover before wash", "Just wash as usual", "Ignore them"], correctIndex: 0, explanation: "Pre-treat grass stains for best results."),
        .init(question: "How to keep laces clean?", subtitle: nil, answers: ["Remove and wash separately", "Leave on shoes", "Replace every week"], correctIndex: 2, explanation: "Remove laces and wash separately for best cleaning."),
        .init(question: "How to clean a mouthguard?", subtitle: nil, answers: ["Rinse with water", "Brush with toothpaste", "Never clean"], correctIndex: 1, explanation: "Brush mouthguards with toothpaste regularly."),
        .init(question: "How to store a sports ball?", subtitle: nil, answers: ["Deflated in a cool place", "Fully inflated in sun", "Anywhere"], correctIndex: 0, explanation: "Store balls deflated in a cool, dry place."),
        .init(question: "How to clean a yoga mat?", subtitle: nil, answers: ["Wipe with damp cloth", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe yoga mats with a damp cloth after use."),
        .init(question: "How to prevent rust on metal gear?", subtitle: nil, answers: ["Keep dry", "Store wet", "Spray perfume"], correctIndex: 0, explanation: "Always dry metal gear to prevent rust."),
        .init(question: "How to clean a helmet?", subtitle: nil, answers: ["Wipe with mild soap", "Soak in bleach", "Never clean"], correctIndex: 2, explanation: "Wipe helmets with mild soap and water."),
        .init(question: "How to wash compression sleeves?", subtitle: nil, answers: ["With regular clothes", "Delicate mode, air dry", "Boil them"], correctIndex: 1, explanation: "Wash sleeves on delicate and air dry."),
        .init(question: "How to clean sports sunglasses?", subtitle: nil, answers: ["Wipe with microfiber cloth", "Paper towel", "Shirt"], correctIndex: 0, explanation: "Use a microfiber cloth to avoid scratches."),
        .init(question: "How to keep a sports bag fresh?", subtitle: nil, answers: ["Use baking soda", "Spray perfume", "Keep closed"], correctIndex: 2, explanation: "Baking soda absorbs odors in bags."),
        .init(question: "How to clean a skipping rope?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 1, explanation: "Wipe skipping ropes with a damp cloth."),
        .init(question: "How to dry a towel after training?", subtitle: nil, answers: ["Hang to air dry", "Leave in bag", "Fold wet"], correctIndex: 0, explanation: "Always hang towels to air dry after use."),
        .init(question: "How to clean a foam roller?", subtitle: nil, answers: ["Wipe with soap and water", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe foam rollers with soap and water."),
        .init(question: "How to store sports shoes?", subtitle: nil, answers: ["With paper inside", "In a plastic bag", "Wet in bag"], correctIndex: 0, explanation: "Store shoes with paper inside to keep shape."),
        .init(question: "How to clean a sports watch?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 1, explanation: "Wipe sports watches with a damp cloth."),
        .init(question: "How to clean a sweatband?", subtitle: nil, answers: ["Hand wash, air dry", "Machine wash hot", "Never clean"], correctIndex: 2, explanation: "Hand wash sweatbands and air dry."),
        .init(question: "How to clean a sports bottle cap?", subtitle: nil, answers: ["Wash with soap", "Rinse with water", "Never clean"], correctIndex: 0, explanation: "Wash bottle caps with soap regularly."),
        .init(question: "How to clean a sports whistle?", subtitle: nil, answers: ["Soak in vinegar", "Rinse with water", "Never clean"], correctIndex: 1, explanation: "Soak whistles in vinegar to disinfect."),
        .init(question: "How to clean a resistance band?", subtitle: nil, answers: ["Wipe with damp cloth", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe resistance bands with a damp cloth."),
        .init(question: "How to clean a sports cap?", subtitle: nil, answers: ["Hand wash, air dry", "Machine wash hot", "Never clean"], correctIndex: 0, explanation: "Hand wash caps and air dry."),
        .init(question: "How to clean a sports mouthpiece?", subtitle: nil, answers: ["Brush with toothpaste", "Rinse with water", "Never clean"], correctIndex: 1, explanation: "Brush mouthpieces with toothpaste regularly."),
        .init(question: "How to clean a sports pad?", subtitle: nil, answers: ["Wipe with damp cloth", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe pads with a damp cloth after use."),
        .init(question: "How to clean a sports cone?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe cones with a damp cloth after use."),
        .init(question: "How to clean a sports bib?", subtitle: nil, answers: ["Machine wash cold", "Machine wash hot", "Never clean"], correctIndex: 1, explanation: "Wash bibs in cold water to preserve color."),
        .init(question: "How to clean a sports mat?", subtitle: nil, answers: ["Wipe with soap and water", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe mats with soap and water after use."),
        .init(question: "How to clean a sports stick?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe sticks with a damp cloth after use."),
        .init(question: "How to clean a sports racket?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 1, explanation: "Wipe rackets with a damp cloth after use."),
        .init(question: "How to clean a sports net?", subtitle: nil, answers: ["Shake and air dry", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Shake nets and air dry after use."),
        .init(question: "How to clean a sports sled?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe sleds with a damp cloth after use."),
        .init(question: "How to clean a sports bench?", subtitle: nil, answers: ["Wipe with disinfectant", "Soak in water", "Never clean"], correctIndex: 1, explanation: "Wipe benches with disinfectant after use."),
        .init(question: "How to clean a sports hurdle?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 2, explanation: "Wipe hurdles with a damp cloth after use."),
        .init(question: "How to clean a sports ladder?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe ladders with a damp cloth after use."),
        .init(question: "How to clean a sports hoop?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 1, explanation: "Wipe hoops with a damp cloth after use."),
        .init(question: "How to clean a sports pump?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 2, explanation: "Wipe pumps with a damp cloth after use."),
        .init(question: "How to clean a sports clipboard?", subtitle: nil, answers: ["Wipe with disinfectant", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe clipboards with disinfectant after use."),
        .init(question: "How to clean a sports whistle lanyard?", subtitle: nil, answers: ["Hand wash, air dry", "Machine wash hot", "Never clean"], correctIndex: 1, explanation: "Hand wash lanyards and air dry."),
        .init(question: "How to clean a sports towel?", subtitle: nil, answers: ["Machine wash cold", "Machine wash hot", "Never clean"], correctIndex: 2, explanation: "Wash towels in cold water to preserve fibers."),
        .init(question: "How to clean a sports jersey number?", subtitle: nil, answers: ["Wash inside out", "Wash as usual", "Never clean"], correctIndex: 0, explanation: "Wash jerseys inside out to protect numbers."),
        .init(question: "How to clean a sports bag zipper?", subtitle: nil, answers: ["Brush with toothbrush", "Oil it", "Never clean"], correctIndex: 1, explanation: "Brush zippers with a toothbrush to remove dirt."),
        .init(question: "How to clean a sports ball valve?", subtitle: nil, answers: ["Wipe with damp cloth", "Soak in water", "Never clean"], correctIndex: 2, explanation: "Wipe ball valves with a damp cloth after use."),
        .init(question: "How to clean a sports ball pump needle?", subtitle: nil, answers: ["Wipe with alcohol", "Soak in water", "Never clean"], correctIndex: 0, explanation: "Wipe pump needles with alcohol to disinfect."),
        .init(question: "How to clean a sports water bottle straw?", subtitle: nil, answers: ["Wash with soap", "Rinse with water", "Never clean"], correctIndex: 1, explanation: "Wash straws with soap regularly."),
        .init(question: "How to clean a sports bag lining?", subtitle: nil, answers: ["Wipe with damp cloth", "Machine wash", "Never clean"], correctIndex: 2, explanation: "Wipe bag linings with a damp cloth after use.")
    ]
}


