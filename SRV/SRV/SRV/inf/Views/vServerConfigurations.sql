﻿






CREATE view [inf].[vServerConfigurations] as
/*
	exec sp_configure 'show advanced options', 1; -- чтобы дополнительные опции вступили в силу
	-- (1-по умолчанию)

	exec sp_configure 'query governor cost limit', 6000; -- предполагаемый лимит на время выполнения запроса (а не на время для отображения результата
		-- выполнения запроса)-действует только на SQL-запрос, а не на инструкции T-SQL
		-- ВНИМАНИЕ! Лимит идет на предполагаемое время выполнения запроса по его предварительному плану выполнения.
		-- Т. е. запрос может в реальности выполняться 25 сек, а сервер подумает что дольше-тогда запрос сразу завершится с ошибкой.
		-- Т. е. лимит идет не по факту выполнения запроса (запрос не прерывается во время своего выполнения), 
		-- а по предварительному плану выполнения запроса (для запроса строится предварительный план выполнения и если по времени он превышает лимит,
		-- то запрос завершается с ошибкой и не запускается
		-- (0-по умолчанию)
	exec sp_configure 'query wait (s)', 600; --для указания времени в секундах, в течение которого запрос будет ожидать ресурсы
	-- (-1-по умолчанию)

	exec sp_configure 'remote query timeout (s)', 600; -- для задания времени ожидания SQL Server (в секундах), в течение которого может выполняться удаленная операция
	-- (0-по умолчанию)

	exec sp_configure 'blocked process threshold', 20; -- определяет пороговое значение (в секундах), в течение которого блокированный процесс порождает сообщения.
	-- Это событие не формируется для системных задач и для задач, которые ожидают ресурсы, не производящие отслеживаемых взаимоблокировок.
	-- При формировании данного события можно выдать предупреждение.
	-- Например, можно выдать администратору на пейджер сообщение о необходимости разобраться с блокировкой.
	-- Мониторинг порога блокировки процесса использует фоновый поток отслеживания взаимоблокировок, который просматривает список задач,
	-- ожидающих выполнения в течение времени, превышающего указанное в настройках пороговое значение.
	-- Это событие формируется один раз в течение отчетного интервала для каждой из заблокированных задач.
	-- Отчет о блокированном процессе выполняется по принципу оптимальных затрат.
	-- Нет никакой гарантии, что он будет выдаваться в реальном времени или хотя бы достаточно быстро.
	--  (0-по умолчанию)
	exec sp_configure 'Database Mail XPs', 1; -- для активации компонента Database Mail на сервере (для почтовых уведомлений)
	-- (0-по умолчанию)

	exec sp_configure 'clr enabled', 1; -- для возможности выполнения CLR-сборок
	-- (0-по умолчанию)

	exec sp_configure 'Ad Hoc Distributed Queries', 1;
	-- По умолчанию SQL Server не разрешает нерегламентированные распределенные запросы,
	-- использующие операторы OPENROWSET и OPENDATASOURCE.
	-- Если этот параметр равен 1, SQL Server допускает выполнение нерегламентированных распределенных запросов.
	-- Если этот параметр не задан или равен 0, SQL Server не разрешает нерегламентированный доступ

	exec sp_configure 'contained database authentication', 1; -- поддержка автономных БД
	-- (0-по умолчанию)

	exec sp_configure 'Ole Automation Procedures', 1; -- возможность создания экземпляров объектов OLE-автоматизации в пакетах Transact-SQL
	-- (0-по умолчанию)

	reconfigure with override; -- чтобы изменения конфигурации вступили в силу
*/
SELECT
configuration_id,
name,
value,
minimum,
maximum,
value_in_use,
description,
is_dynamic,
is_advanced
FROM sys.configurations







GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Сведения о конфигурации экземпляра MS SQL Server', @level0type = N'SCHEMA', @level0name = N'inf', @level1type = N'VIEW', @level1name = N'vServerConfigurations';
