#генерим данные (по требованиям не сказано про эксельку с пациентами, поэтому будем использовать
#рандомные данные)

set.seed(123)
patients <- data.frame(
  patient_id = 1:100,
  Возраст = sample(20:80, 100, replace = TRUE),
  Пол = sample(c("м", "ж"), 100, replace = TRUE),
  гемоглобин = rnorm(100, mean = 140, sd = 15),
  глюкоза = rnorm(100, mean = 5.5, sd = 1.2),
  лейкоциты = rnorm(100, mean = 6.5, sd = 1.8)
)

# Преобразуем переменную Пол в фактор
patients$Пол <- factor(patients$Пол, levels = c("м", "ж"))

# Создаем возрастные группы
возраст_группа_2 <- ifelse(patients$Возраст <= 60, "Молодые", "Старшие")

# Рассчитываем среднее и стандартное отклонение гемоглобина для возрастных групп
final_result <- aggregate(гемоглобин ~ возраст_группа_2, data = patients, 
                          FUN = function(x) c(mean = mean(x), sd = sd(x)))

# Переименовываем столбцы
final_result <- data.frame(
  возраст_группа_2 = final_result$возраст_группа_2,
  средний_гемоглобин = final_result$гемоглобин[, "mean"],
  стандартное_отклонение = final_result$гемоглобин[, "sd"]
)

# Создаем папку для результатов, если её нет
if (!dir.exists("/home/results")) {
  dir.create("/home/results", recursive = TRUE)
}

# Сохраняем результат в нужную папку
write.csv(final_result, "/home/results/анализ_гемоглобина.csv", row.names = FALSE, fileEncoding = "UTF-8")

print(paste("Файл сохранен в:", "/home/results/анализ_гемоглобина.csv"))