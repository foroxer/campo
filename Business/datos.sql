SELECT 
	DB_NAME() AS [Base de datos],
	t.name AS Tabla, 
	c.name AS Columna, 
	st.name AS [Tipo de dato], 
	c.max_length AS Longitud, 
	CASE 
		WHEN c.is_nullable = 0 THEN 'No'
		ELSE 'Si'
	END AS [Es Nulleable],
	CASE 
		WHEN c.is_identity = 0 THEN 'No'
		ELSE 'Si'
	END AS [Es Identidad], 
	isnull(ep.value, 'add description here') AS [Description]
FROM [sys].[tables] t
INNER JOIN [sys].[columns] c
	ON t.object_id= c.object_id 
INNER JOIN [sys].[systypes] st 
	ON c.system_type_id= st.xusertype 
INNER JOIN [sys].[objects] o 
	ON t.object_id= o.object_id 
LEFT JOIN [sys].[extended_properties] ep 
	ON o.object_id = ep.major_id 
	AND c.column_Id = ep.minor_id
WHERE t.name <> 'sysdiagrams' 
ORDER BY 
	t.name,
	c.column_Id