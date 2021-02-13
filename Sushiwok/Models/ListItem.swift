//
//  Sushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation
import UIKit

//"Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"

struct ListItem {
    var image:UIImage
    var title:String
    var description:String
    
    static func createSushiArray() -> [[ListItem]]{
        let categories =
            [
                [
                    ListItem(
                        image: UIImage(named: "fila-bum")!,
                        title: "Фила Бум",
                        description: "ролл Филадельфия 2 шт., ролл Филадельфия в угре, ролл Филадельфия в масаго, ролл Фудживара 1031 г"),
                    ListItem(
                        image: UIImage(named: "umka")!,
                        title: "Умка",
                        description: "ролл Фиеста, ролл Сэнсей, ролл Калифорния в кунжуте 653 г"),
                    ListItem(
                        image:UIImage(named: "filomaniya")!,
                             title: "Филомания",
                             description: "ролл Филадельфия в масаго, ролл Филадельфия, ролл Калифорния в кунжуте, ролл с огурцом 707 г"),
                    ListItem(
                        image: UIImage(named: "uikend")!,
                        title: "Уикенд",
                        description: "ролл Сочная креветка, ролл Хатамото, запеч. ролл Окунь-гриль, запеч. ролл Крабик Хот, ролл Калифорния с креветкой, ролл Марокко, запеч. ролл Румяный, запеч. ролл Сырный, ролл Фудживара 1707 г"),
                    ListItem(
                        image: UIImage(named: "iskushenie")!,
                        title: "Набор Искушение",
                        description: "ролл Ореховый рай, ролл Берри, ролл Сочный фрукт 438 г")
                ],
                [
                    ListItem(
                        image: UIImage(named: "okitori")!,
                        title: "Ролл Окитори",
                        description: "лосось, цыпленок, омлет тамаго, масаго, шеф-соус, спайси соус, кунжут 234 г"),
                    ListItem(
                        image: UIImage(named: "ebi-roru")!,
                        title: "Ролл Эби Рору",
                        description: "креветка тигровая, краб-крем, огурец, перец болгарский, салат айсберг, масаго, медовый соус 252 г"),
                    ListItem(
                        image: UIImage(named: "spajsi-krevetka")!,
                        title: "Ролл Спайси креветка",
                        description: "лосось, сливочный сыр, огурец, масаго, креветки,s спайси соус 217 г"),
                    ListItem(
                        image: UIImage(named: "dabl-unagi")!,
                        title: "Ролл Дабл унаги",
                        description: "угорь, цыпленок, краб-крем, сливочный сыр, омлет тамаго, апельсиновый соус, спайси соус, паприка, кунжут 234 г"),
                    ListItem(
                        image: UIImage(named: "midori")!,
                        title: "Ролл Мидори",
                        description: "креветка тигровая, краб-крем, чука, масаго, яки соус, спайси соус, медовый соус 237 г")
                ],
                [
                    ListItem(
                        image: UIImage(named: "wok-ostrij-s-govyadinoj")!,
                        title:"Wok острый с говядиной",
                        description: "рис, говядина, перец болгарский, капуста, морковь, фасоль стручковая, перец чили, кунжут, терияки соус, устричный соус, соус ширачи 430 г"),
                    ListItem(
                        image: UIImage(named: "wok-klassicheskij")!,
                        title: "Wok классический",
                        description: "лапша удон, цыпленок, шампиньоны, капуста, перец болгарский, лук репчатый, огурец, морковь, терияки соус, кунжут 415 г"),
                    ListItem(
                        image: UIImage(named: "wok-po-kitaisky")!,
                        title: "Wok по-китайски",
                        description: "лапша удон, цыпленок, перец болгарский, чеснок, лук репчатый, кинза, соус ширачи, соус пикантный, амой соус 320 г"),
                    ListItem(
                        image: UIImage(named: "wok-sitnij")!,
                        title: "Wok сытный",
                        description: "лапша удон, бекон, цыпленок, шампиньоны, чеснок, сливочный соус, кунжут 340 г"),
                    ListItem(
                        image: UIImage(named: "wok-vegetarianskij")!,
                        title: "Wok вегетарианский",
                        description: "лапша удон, капуста, шампиньоны, морковь, перец болгарский, огурец, томаты черри, лук репчатый, терияки соус, кунжут 370 г")
                ],
                [
                    ListItem(
                        image: UIImage(named: "sushi-chuka")!,
                        title:"Суши Чука",
                        description: "водоросли чука, нори, рис 30 г"),
                    ListItem(
                        image: UIImage(named: "sushi-ostrij-krab")!,
                        title: "Суши Острый краб",
                        description: "нори, рис, спайси соус, краб-крем 35 г"),
                    ListItem(
                        image:UIImage(named: "sushi-spaysi-tori")!,
                        title: "Суши Спайси Тори",
                        description: "цыпленок, нори, рис, спайси соус 35 г"),
                    ListItem(
                        image: UIImage(named: "zapechennye-sushi-krab")!,
                        title: "Запеченные Суши Краб",
                        description: "нори, рис, яки соус, краб-крем 35 г"),
                    ListItem(
                        image: UIImage(named: "zapechennye-sushi-ugor")!,
                        title: "Запеченные Суши Угорь",
                        description: "рис, яки соус, угорь, нори 35 г")
                ],
                [
                    ListItem(
                        image: UIImage(named: "drakon-mini-pitstsa-amer-20sm")!,
                        title:"Дракон на пышном тесте 20 см",
                        description: "ветчина, пепперони, сыр моцарелла, грибы шампиньоны, перец халапеньо, пицца-соус, пышное тесто, паприка, сыр пармезан, лук красный 330 г"),
                    ListItem(
                        image: UIImage(named: "picca-drakon-30-sm")!,
                        title: "Дракон на пышном тесте 30 см",
                        description: "пепперони, ветчина, сыр моцарелла, грибы шампиньоны, перец болгарский, сыр пармезан, лук красный, перец халапеньо, пицца-соус, пышное тесто 720 г"),
                    ListItem(
                        image: UIImage(named: "picca-petrovskaya-30-sm")!,
                        title: "Петровская на пышном тесте 30 см",
                        description: "акция, цыпленок, пепперони, ветчина, сыр моцарелла, грибы шампиньоны, сыр пармезан, томаты, лук красный, пицца-соус, пышное тесто 810 г"),
                    ListItem(
                        image: UIImage(named: "picca-proshutto-fungi-30-sm")!,
                        title: "Прошутто фунги на пышном тесте 30 см",
                        description: "грибы шампиньоны, ветчина, сыр моцарелла, пицца-соус, пышное тесто 630 г"),
                    ListItem(
                        image: UIImage(named: "picca-zhyulen-30-sm")!,
                        title: "Жюльен на пышном тесте 30 см",
                        description: "акция, цыпленок копченый, сыр моцарелла, яйцо, лук репчатый, соус грибной, пышное тесто 780 г")
                ]
        ]
        return categories
    }
}
