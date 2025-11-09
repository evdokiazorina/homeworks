# Анализ гемоглобина - Docker контейнер

## Описание
Docker контейнер для воспроизведения анализа данных гемоглобина. Создает CSV файл с результатами анализа.

## Структура проекта
- **Dockerfile** - инструкции для сборки Docker образа
- **analysis_script.R** - R-скрипт для анализа данных гемоглобина  
- **Readme.md** - документация по проекту
- **results/** - папка для результатов (создается автоматически)

## Шаги

```bash
# 1. Сборка образа
docker build -t hemoglobin-analysis .

# 2. Создание папки и запуск
mkdir -p results
docker run -v $(pwd)/results:/home/results hemoglobin-analysis

# 3. Проверка результата
ls -la results/
cat results/анализ_гемоглобина.csv