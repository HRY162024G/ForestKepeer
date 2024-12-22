// Движение
var x_move = irandom_range(-1, 1); // Случайное движение по горизонтали
var y_move = irandom_range(-1, 1); // Случайное движение по вертикали

// Если игрок бегает (шанс на бег)
if (irandom(100) < 10) {
    x_move *= run_speed;
    y_move *= run_speed;
} else {
    x_move *= speed;
    y_move *= speed;
}

// Проверка границ карты
if ((x + x_move > map_bounds.left) && (x + x_move < map_bounds.right)) {
    x += x_move;
}
if ((y + y_move > map_bounds.top) && (y + y_move < map_bounds.bottom)) {
    y += y_move;
}

// Проверка окружающих объектов
var nearby_objects = instance_place_list(x, y, obj_anything); // obj_anything - замените на нужный класс объектов
memory = [];
seen_npcs = [];
loneliness += 1; // Увеличиваем одиночество при отсутствии видимых объектов

for (var i = 0; i < array_length(nearby_objects); i++) {
    var obj = nearby_objects[i];
    var dist = point_distance(x, y, obj.x, obj.y);
    if (dist <= view_radius) {
        memory[array_length(memory)] = obj; // Запоминаем объект
        if (obj.object_index == object1) {
            seen_npcs[array_length(seen_npcs)] = obj;
            loneliness = max(0, loneliness - 10); // Уменьшаем одиночество
        }
    }
}

// Изменение эмоций на основе состояния
if (health < 50) {
    emotion = 3; // Гнев
} else if (loneliness > 50) {
    emotion = 4; // Одиночество
} else if (array_length(seen_npcs) > 0) {
    emotion = 5; // Радость
} else {
    emotion = 1; // Нейтральная эмоция
}

// Установка кадра анимации
image_index = emotion - 1;

// Проверка здоровья
if (health <= 0) {
    instance_destroy(); // Удаление объекта при нулевом здоровье
}
