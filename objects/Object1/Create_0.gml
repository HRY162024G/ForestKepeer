// Создание переменных
health = 100; // Здоровье НПС
speed = 2; // Стандартная скорость
run_speed = 4; // Скорость бега
emotion = 1; // Эмоция: 1 - нейтральное состояние
view_radius = 20; // Радиус видимости
memory = []; // Простая память (массив для запоминания объектов)
map_bounds = {left: 0, right: room_width, top: 0, bottom: room_height}; // Границы карты
loneliness = 0; // Одиночество
seen_npcs = []; // Замеченные объекты
alarm[0] = 30; // Таймер для изменения эмоций
