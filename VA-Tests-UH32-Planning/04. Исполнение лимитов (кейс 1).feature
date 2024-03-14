﻿#language: ru

@tree

Функционал: 04. Исполнение лимитов - кейс 1

Как Администратор я хочу
выполнить цепочку документов: Резервирование -> ЗНО (по договору без графика расчетов) -> ПП -> Списание с РС -> ОФД
чтобы проверить соблюдение установленных лимитов в процессе  

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 04.00 Определить тип приложения

	Пусть Инициализация переменных				

Сценарий: 04.01 Создать документ Резервирование планов и лимитов по БДДС по ЦФО 1 (АХО) на 1 квартал 2024 год

	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'
	
	* Отменить проведение документов
		И Я устанавливаю отбор в форме списка Резерв 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)' 
		И для каждой строки таблицы 'Список' я выполняю		
			И Я удаляю текущую строку в списке 'Список'

	* Ввод нового документа
		И Я создаю документ Резервирование по виду бюджета 'БДДС'
		И Я выбираю вариант плана 'ВА - БДДС (ЦФО на уровне документа)'
		Тогда элемент формы с именем "ЦФО" стал равен 'ВА - ЦФО 1 (АХО)'
		И из выпадающего списка с именем "ПериодОтчета" я выбираю точное значение 'Январь 2024 г.'
		И элемент формы с именем 'ПериодОтчетаОкончание' стал равен 'Март 2024 г.'

	* Указать назначение резерва
		И я нажимаю кнопку выбора у поля с именем "Организация"
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - ООО Тест" "По точному совпадению" 
		И я нажимаю кнопку выбора у поля с именем "Назначение_Контрагент"
		И Я в таблице '' по полю '' ищу значение 'Контрагент' 	
		И я нажимаю на кнопку 'ОК'
		Тогда открылось окно 'Контрагенты'
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "Поставщик1" "По точному совпадению"	
		И я нажимаю кнопку выбора у поля с именем "ОбоснованиеРезерва"
		И Я в таблице '' по полю '' ищу значение 'Строка' 	
		И я нажимаю на кнопку 'ОК'
		И в поле с именем 'ОбоснованиеРезерва' я ввожу текст 'под обеспечение счета на оплату'
		И я перехожу к закладке с именем "ГруппаНазначениеРезерва"

	* Заполнить документ "с нуля"
		И я перехожу к закладке с именем "СтраницаКроссТаблица"
	
		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Аналитика1"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Автотранспорт" "По точному совпадению" 
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "февр. 24" 
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '100 000,00'

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 		
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Аналитика1"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Здания" "По точному совпадению" 	
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "март 24" 
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '200 000,00'

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 4" "По точному совпадению" 		
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Проект"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Проект 1" "По точному совпадению" 	
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "март 24" 
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '300 000,00'
		
	* Проверить наличие необходимых лимитов
		И я перехожу к закладке с именем "СтраницаКонтроляДокумента"
		И я нажимаю на кнопку с именем 'ВыполнитьКонтрольДокумента'
		Тогда таблица "ТаблицаКонтроляДокумента" стала равной:
			| 'Вид контроля'                | 'Результат' | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов'  | 'OK'        | 'Подробнее'                 |
			| 'Контроль бюджетных резервов' | 'OK'        | 'Подробнее'                 |			
			
	* Подтвердить резервирование 
		И я нажимаю на кнопку с именем 'ФормаПровести'		
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаДокументаРезерв'
		И я запоминаю заголовок текущего окна как "ЗаголовокОкна"

	* Проверить движения
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной:
			| 'N' | 'Период'             | 'Вид бюджета'                      | 'Приход расход' | 'Кратность лимитирования' | 'Объект планирования' | 'Сумма'      | 'Аналитика партнеров' | 'Источник версии' | 'Состояние' | 'Курс планирования' | 'Аналитика потребностей' | 'Сумма исполнено' | 'Аналитика структуры'                            | 'Лимит исполнено' | 'Аналитика поставки' | 'Количество' | 'Лимит'      | 'Валюта' | 'Количество исполнено' | 'Аналитика номенклатуры' | 'Валюта лимитирования' | 'Кратность планирования' | 'Курс задан в операции' | 'Курс лимитирования' | 'Аналитика статей бюджетов'                                          | 'Корректировка документа' |
			| '1' | '01.02.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | '$ЗаголовокОкна$'     | '100 000,00' | 'ВА - ООО Тест'       | ''                | ''          | '1,0000'            | ''                       | ''                | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | ''                | ''                   | ''           | '100 000,00' | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Автотранспорт;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
			| '2' | '01.03.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | '$ЗаголовокОкна$'     | '200 000,00' | 'ВА - ООО Тест'       | ''                | ''          | '1,0000'            | ''                       | ''                | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | ''                | ''                   | ''           | '200 000,00' | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход'        | ''                        |
			| '3' | '01.03.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | '$ЗаголовокОкна$'     | '300 000,00' | 'ВА - ООО Тест'       | ''                | ''          | '1,0000'            | ''                       | ''                | 'ВА - ЦФО 1 (АХО); ВА - Проект 1; ВА - ООО Тест' | ''                | ''                   | ''           | '300 000,00' | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 4 Расход'                                               | ''                        |
		
	* Закрыть все окна
		И я закрываю все окна клиентского приложения											
	
	Сценарий: Проверяем зарезервированные средства в Отчете по лимитам
	* Сформируем отчет по БДДС за 2024
		И Я формирую Отчет по лимитам по виду бюджета 'БДДС' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C8' равна '$СуммаДокументаРезерв$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамРезерв" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

		