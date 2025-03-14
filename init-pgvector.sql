-- Автоматическое создание расширения pgvector при инициализации базы данных
CREATE EXTENSION IF NOT EXISTS vector;

-- Опционально: создание тестовой таблицы для проверки работы pgvector
CREATE TABLE IF NOT EXISTS vector_test (
    id SERIAL PRIMARY KEY,
    embedding vector(3)
);

-- Вставка тестовых данных
INSERT INTO vector_test (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');

-- Проверка, что расширение работает корректно
SELECT embedding <-> '[3,1,2]' AS distance FROM vector_test LIMIT 1;
