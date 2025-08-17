-- TASK_4.SQL
-- PRINT FULL DESCRIPTION OF THE TABLE Books IN alx_book_store DATABASE

SELECT 
    COLUMN_NAME AS "Column Name",
    COLUMN_TYPE AS "Data Type",
    IS_NULLABLE AS "Nullable",
    COLUMN_KEY AS "Key",
    COLUMN_DEFAULT AS "Default Value",
    EXTRA AS "Extra"
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store'  -- explicitly specify the database
    AND TABLE_NAME = 'Books'
ORDER BY 
    ORDINAL_POSITION;
