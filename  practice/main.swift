

////Воин, Колдун, Медик, Защитник
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может


//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока неумрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем







var players: [String] = ["Воин", "Колдун", "Медик", "Защитник"]
var health: [Int] = [1000, 1000, 1000, 1500]
var punchesOfPlayers: [Int] = [200, 300, 0, 100]
var sumOfPucnhes = 0
var treatment = 200
var boss = 5000
var punchesOfBoss = 200
let gameCompleted = true
for (index, item) in players.enumerated() {
    print ("\(item) - \(health[index])")
}

func bossHit() {
    
    for i in 0..<health.count {
        health[i] = health[i] - punchesOfBoss
    }
}

func heroesHit() {
    for i in 0..<punchesOfPlayers.count {
        boss = boss - punchesOfPlayers[i]
    }
}

func MedicalSupport () {
        health[0] = health[0] + treatment
        health[1] = health[1] + treatment
        health[3] = health[3] + treatment
}

func round() {
    print(" ")
    bossHit()
    print("Босс атакует!")
    print("Здоровье героев: \(health)")
    heroesHit()
    for i in 0..<players.count {
        print("\(players[i]) атакует!")
    }
    print("Здоровье босса: \(boss)")
    MedicalSupport()
    print("Здоровье героев + медицинская помощь: \(health)")
    print(" ")
}

var rounds: Int = 1

while true {
    if health[0] <= 0 && health[1] <= 0 && health[2] <= 0 && health[3] >= 0 {
        print("Game Over! Boss win!")
        break
    } else if boss <= 0 {
        print("Heroes win!")
        break
    }
    
    print("\(rounds) раунд:")
    round()
    rounds = rounds + 1
}


