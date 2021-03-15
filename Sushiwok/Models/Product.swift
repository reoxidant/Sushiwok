//
//  Sushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

//"Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"

struct Product: Codable {
    let id: String
    let image:String
    let title:String
    let description:String
    let grams:Int
    let price:Int
}

class ProductApi{
    static func createProductList() -> [[Product]]{
        let products =
            [
                [
                    Product(
                        id: "1",
                        image: "fila-bum",
                        title: "Фила Бум",
                        description: "ролл Филадельфия 2 шт., ролл Филадельфия в угре, ролл Филадельфия в масаго, ролл Фудживара 1031 г",
                        grams: 1031,
                        price: 599
                    ),
                    Product(
                        id: "2",
                        image: "umka",
                        title: "Умка",
                        description: "ролл Фиеста, ролл Сэнсей, ролл Калифорния в кунжуте 653 г",
                        grams: 653,
                        price: 444
                    ),
                    Product(
                        id: "3",
                        image: "filomaniya",
                        title: "Филомания",
                        description: "ролл Филадельфия в масаго, ролл Филадельфия, ролл Калифорния в кунжуте, ролл с огурцом 707 г",
                        grams: 707,
                        price: 777
                    ),
                    Product(
                        id: "4",
                        image: "uikend",
                        title: "Уикенд",
                        description: "ролл Сочная креветка, ролл Хатамото, запеч. ролл Окунь-гриль, запеч. ролл Крабик Хот, ролл Калифорния с креветкой, ролл Марокко, запеч. ролл Румяный, запеч. ролл Сырный, ролл Фудживара 1707 г",
                        grams: 1707,
                        price: 1799
                    ),
                    Product(
                        id: "5",
                        image: "iskushenie",
                        title: "Набор Искушение",
                        description: "ролл Ореховый рай, ролл Берри, ролл Сочный фрукт 438 г",
                        grams: 438,
                        price: 499
                    )
                ],
                [
                    Product(
                        id: "6",
                        image: "okitori",
                        title: "Ролл Окитори",
                        description: "лосось, цыпленок, омлет тамаго, масаго, шеф-соус, спайси соус, кунжут 234 г",
                        grams: 234,
                        price: 325
                    ),
                    Product(
                        id: "7",
                        image: "ebi-roru",
                        title: "Ролл Эби Рору",
                        description: "креветка тигровая, краб-крем, огурец, перец болгарский, салат айсберг, масаго, медовый соус 252 г",
                        grams: 252,
                        price: 319
                    ),
                    Product(
                        id: "8",
                        image: "spajsi-krevetka",
                        title: "Ролл Спайси креветка",
                        description: "лосось, сливочный сыр, огурец, масаго, креветки,s спайси соус 217 г",
                        grams: 217,
                        price: 319
                    ),
                    Product(
                        id: "9",
                        image: "dabl-unagi",
                        title: "Ролл Дабл унаги",
                        description: "угорь, цыпленок, краб-крем, сливочный сыр, омлет тамаго, апельсиновый соус, спайси соус, паприка, кунжут 234 г",
                        grams: 234,
                        price: 325
                    ),
                    Product(
                        id: "10",
                        image: "midori",
                        title: "Ролл Мидори",
                        description: "креветка тигровая, краб-крем, чука, масаго, яки соус, спайси соус, медовый соус 237 г",
                        grams: 237,
                        price: 325
                    )
                ],
                [
                    Product(
                        id: "11",
                        image: "wok-ostrij-s-govyadinoj",
                        title:"Wok острый с говядиной",
                        description: "рис, говядина, перец болгарский, капуста, морковь, фасоль стручковая, перец чили, кунжут, терияки соус, устричный соус, соус ширачи 430 г",
                        grams: 430,
                        price: 319
                    ),
                    Product(
                        id: "12",
                        image: "wok-klassicheskij",
                        title: "Wok классический",
                        description: "лапша удон, цыпленок, шампиньоны, капуста, перец болгарский, лук репчатый, огурец, морковь, терияки соус, кунжут 415 г",
                        grams: 415,
                        price: 309
                    ),
                    Product(
                        id: "13",
                        image: "wok-po-kitaisky",
                        title: "Wok по-китайски",
                        description: "лапша удон, цыпленок, перец болгарский, чеснок, лук репчатый, кинза, соус ширачи, соус пикантный, амой соус 320 г",
                        grams: 320,
                        price: 299
                    ),
                    Product(
                        id: "14",
                        image: "wok-sitnij",
                        title: "Wok сытный",
                        description: "лапша удон, бекон, цыпленок, шампиньоны, чеснок, сливочный соус, кунжут 340 г",
                        grams: 340,
                        price: 345
                    ),
                    Product(
                        id: "15",
                        image: "wok-vegetarianskij",
                        title: "Wok вегетарианский",
                        description: "лапша удон, капуста, шампиньоны, морковь, перец болгарский, огурец, томаты черри, лук репчатый, терияки соус, кунжут 370 г",
                        grams: 370,
                        price: 249
                    )
                ],
                [
                    Product(
                        id: "16",
                        image: "sushi-chuka",
                        title:"Суши Чука",
                        description: "водоросли чука, нори, рис 30 г",
                        grams: 39,
                        price: 99
                    ),
                    Product(
                        id: "17",
                        image: "sushi-ostrij-krab",
                        title: "Суши Острый краб",
                        description: "нори, рис, спайси соус, краб-крем 35 г",
                        grams: 35,
                        price: 99
                    ),
                    Product(
                        id: "18",
                        image: "sushi-spaysi-tori",
                        title: "Суши Спайси Тори",
                        description: "цыпленок, нори, рис, спайси соус 35 г",
                        grams: 35,
                        price: 99
                    ),
                    Product(
                        id: "19",
                        image:  "zapechennye-sushi-krab",
                        title: "Запеченные Суши Краб",
                        description: "нори, рис, яки соус, краб-крем 35 г",
                        grams: 35,
                        price: 99
                    ),
                    Product(
                        id: "20",
                        image:"zapechennye-sushi-ugor",
                        title: "Запеченные Суши Угорь",
                        description: "рис, яки соус, угорь, нори 35 г",
                        grams: 35,
                        price: 99
                    )
                ],
                [
                    Product(
                        id: "21",
                        image: "drakon-mini-pitstsa-amer-20sm",
                        title:"Дракон на пышном тесте 20 см",
                        description: "ветчина, пепперони, сыр моцарелла, грибы шампиньоны, перец халапеньо, пицца-соус, пышное тесто, паприка, сыр пармезан, лук красный 330 г",
                        grams: 330,
                        price: 279
                    ),
                    Product(
                        id: "22",
                        image:  "picca-drakon-30-sm",
                        title: "Дракон на пышном тесте 30 см",
                        description: "пепперони, ветчина, сыр моцарелла, грибы шампиньоны, перец болгарский, сыр пармезан, лук красный, перец халапеньо, пицца-соус, пышное тесто 720 г",
                        grams: 720,
                        price: 499
                    ),
                    Product(
                        id: "23",
                        image: "picca-petrovskaya-30-sm",
                        title: "Петровская на пышном тесте 30 см",
                        description: "акция, цыпленок, пепперони, ветчина, сыр моцарелла, грибы шампиньоны, сыр пармезан, томаты, лук красный, пицца-соус, пышное тесто 810 г",
                        grams: 630,
                        price: 499
                    ),
                    Product(
                        id: "24",
                        image: "picca-proshutto-fungi-30-sm",
                        title: "Прошутто фунги на пышном тесте 30 см",
                        description: "грибы шампиньоны, ветчина, сыр моцарелла, пицца-соус, пышное тесто 630 г",
                        grams: 630,
                        price: 499
                    ),
                    Product(
                        id: "25",
                        image: "picca-zhyulen-30-sm",
                        title: "Жюльен на пышном тесте 30 см",
                        description: "акция, цыпленок копченый, сыр моцарелла, яйцо, лук репчатый, соус грибной, пышное тесто 780 г",
                        grams: 780,
                        price: 599
                    )
                ]
        ]
        return products
    }
}
