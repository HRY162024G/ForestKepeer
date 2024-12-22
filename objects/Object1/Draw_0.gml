// Рисование спрайта с учетом текущего кадра
draw_self();

// Информация о НПС для отладки
draw_text(x, y - 20, "HP: " + string(health));
draw_text(x, y - 10, "Emotion: " + string(emotion));
