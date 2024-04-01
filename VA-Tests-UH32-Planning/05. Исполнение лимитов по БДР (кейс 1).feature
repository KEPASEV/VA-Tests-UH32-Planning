﻿#language: ru

@tree

Функционал: 05. Исполнение лимитов по БДР - кейс 1

Как Администратор я хочу
1) выполнить цепочку документов: Резервирование -> Заявка на расход -> ПТУ -> ОФД
2) выполнить цепочку документов: ЗпР с превышением резерва -> Заявку на корректировку -> Корректировку лимитов
чтобы проверить соблюдение установленных лимитов в процессе  
(!!!чтобы запускать нескольк раз этот тест в одной базе, надо отменять проведение всей цепочки документов)

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 05.00 Определить тип приложения

	Пусть Инициализация переменных				

Сценарий: 05.01.1 Создаем Резервирование планов и лимитов по ЦФО 1 (АХО) на 1 квартал 2024 год
	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'
	
	* Ввести новый документ
		И Я устанавливаю отбор в форме списка Резерв 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)' 
		И Я создаю документ Резервирование по виду бюджета 'БДР'
		И Я выбираю вариант плана 'ВА - БДР (ЦФО на уровне документа)'
		Тогда элемент формы с именем "ЦФО" стал равен 'ВА - ЦФО 1 (АХО)'
		И из выпадающего списка с именем "ПериодОтчета" я выбираю по строке '1 квартал 2024 г.'
		И из выпадающего списка с именем "ПериодОтчетаОкончание" я выбираю по строке '1 квартал 2024 г.'

	* Указать назначение резерва
		И из выпадающего списка с именем "Организация" я выбираю по строке 'ВА - ООО Тест'
		И я нажимаю кнопку выбора у поля с именем "Назначение_Контрагент"
		И Я в таблице '' по полю '' ищу значение 'Контрагент' 	
		И я нажимаю на кнопку 'ОК'
		Тогда открылось окно 'Контрагенты'
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - Поставщик1" "По точному совпадению"	
		И я нажимаю кнопку выбора у поля с именем "ОбоснованиеРезерва"
		И Я в таблице '' по полю '' ищу значение 'Строка' 	
		И я нажимаю на кнопку 'ОК'
		И в поле с именем 'ОбоснованиеРезерва' я ввожу текст 'под обеспечение поставки товаров'
		И я перехожу к закладке с именем "ГруппаНазначениеРезерва"

	* Заполнить документ "с нуля"
		И я перехожу к закладке с именем "СтраницаКроссТаблица"
	
		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Аналитика1"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Автотранспорт" "По точному совпадению" 
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "1 квартал 2024 г."  
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '300 000,00'

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 		
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Аналитика1"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Здания" "По точному совпадению" 	
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "1 квартал 2024 г." 
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '600 000,00'

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_СтатьяБюджета"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 4" "По точному совпадению" 		
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита с именем "КроссТаблица_ИзмерениеСтрока_Проект"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Проект 1" "По точному совпадению" 	
		И в таблице "КроссТаблица" я активизирую колонку 'Σ' в группе "Новое" в группе "1 квартал 2024 г." 
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '900 000,00'
		
	* Проверить наличие необходимых лимитов
		И Контроль лимитов пройден успешно

	* Подтвердить резервирование 
		И я нажимаю на кнопку с именем 'ФормаПровести'		
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаДокументаРезерв'		
		И я удаляю переменную '$$НомерДокРезерва$$'
		И я запоминаю значение поля с именем 'Номер' как '$$НомерДокРезерва$$'

	* Проверить движения
		Когда открылось окно 'Резервирование планов и лимитов * от *'
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''	
		Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'             | 'Вид бюджета'               | 'Объект планирования'                    | 'Состояние' | 'Аналитика структуры'                            | 'Аналитика статей бюджетов'                                          | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров' | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'      | 'Количество' | 'Лимит'      | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '01.01.2024 0:00:00' | 'Бюджет доходов и расходов' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | 'ВА - Статья 1 (ВА - Автотранспорт;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '300 000,00' | ''           | '300 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '2' | '01.01.2024 0:00:00' | 'Бюджет доходов и расходов' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход'        | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '600 000,00' | ''           | '600 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '3' | '01.01.2024 0:00:00' | 'Бюджет доходов и расходов' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - Проект 1; ВА - ООО Тест' | 'ВА - Статья 4 Расход'                                               | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '900 000,00' | ''           | '900 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |	
		
	* Проверяем зарезервированные средства в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R54C8' равна '$СуммаДокументаРезерв$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамРезервБДР" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

Сценарий: 05.01.2 Создаем Заявку на расход				

	* Создать документ ЗНР на основе данных из счёта от поставщика
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И в поле с именем 'Дата' я ввожу текст '01.03.2024  0:00:00'
		И я перехожу к следующему реквизиту	
		И я нажимаю кнопку выбора у поля с именем "ОснованиеОбязательства"
		Тогда открылось окно 'Счета от поставщиков'
		И в таблице "Список" я выбираю текущую строку
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаЗнР'

	* Указать источник лимитов
		И я нажимаю кнопку выбора у поля с именем "ДокументПланирования"
		Тогда открылось окно 'Резервирования планов и лимитов'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$$НомерДокРезерва$$" "По точному совпадению"	
		И я перехожу к следующему реквизиту
		И в поле с именем 'ЖелательнаяДатаРасхода' я ввожу текст '04.03.2024'
		И я перехожу к следующему реквизиту	
		И я удаляю переменную '$$ЖелательнаяДатаРасхода$$'		
		И я запоминаю значение поля с именем 'ЖелательнаяДатаРасхода' как '$$ЖелательнаяДатаРасхода$$'
						
	* Заполнить аналитики учета и планирования 
		И я перехожу к закладке с именем "Движения"
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита с именем "ТаблицаДвиженийСтатьяДоходовИРасходов"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита с именем "Аналитика1"			
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Здания" "По точному совпадению" 
		И В таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Проверить наличие необходимых лимитов
		И Контроль лимитов пройден успешно	
			
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я удаляю переменную '$$СсылкаЗнР$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаЗнР$$"	
		И я удаляю переменную '$$НомерЗнР$$'
		И я запоминаю значение поля с именем 'Номер' как '$$НомерЗнР$$'			

	* Проверить движения
		Когда открылось окно 'Заявка на расход *; 3 000 RUB к *; ВА - Поставщик1; Расчеты с контрагентами'		
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		Тогда открылось окно 'Движения документа: Заявка на расход *; * RUB к *; ВА - Поставщик1; Расчеты с контрагентами'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'                           | 'Вид бюджета'               | 'Объект планирования'                                                         | 'Состояние' | 'Аналитика структуры'             | 'Аналитика статей бюджетов'                                   | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров'                                        | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'     | 'Количество' | 'Лимит'     | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '$$ЖелательнаяДатаРасхода$$ 0:00:00' | 'Бюджет доходов и расходов' | 'Заявка на расход *; 3 000 RUB к *; ВА - Поставщик1; Расчеты с контрагентами' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест; ВА - Поставщик1; Без договора; Без договора' | 'Расход'        | 'RUB'    | 'RUB'                  | '3 000,00'  | ''           | '3 000,00'  | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '2' | '$$ЖелательнаяДатаРасхода$$ 0:00:00' | 'Бюджет доходов и расходов' | 'Резервирование планов и лимитов * от *'                                      | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест; ВА - Поставщик1; Без договора'               | 'Расход'        | 'RUB'    | 'RUB'                  | '-3 000,00' | ''           | '-3 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
															
	* Проверяем заявленные средства в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R54C9' равна '$СуммаЗнР$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамЗнР" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 05.01.3 Отражаем фактические данные об расходе	 		 		  		 		 		 	 
		
	* Открыть документ основание (Заявка на расход)
		Дано Я открываю навигационную ссылку "$$СсылкаЗнР$$"	

	* Ввести Поступление на основание счета
		Когда открылось окно 'Заявка на расход *; * RUB к *; ВА - Поставщик1; Расчеты с контрагентами'
		И я нажимаю на кнопку открытия поля с именем "ОснованиеОбязательства"
		Тогда открылось окно 'Счет от поставщика * от *'
		И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеТоваровУслугСоздатьНаОсновании'
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание)'
		Если флаг с именем 'УПД' равен 'Нет' тогда
			И я устанавливаю флаг с именем 'УПД'
		И в поле с именем 'НомерВходящегоДокумента' я ввожу текст '1'
		И в поле с именем 'ДатаВходящегоДокумента' ввожу значение переменной '$$ЖелательнаяДатаРасхода$$'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'
		
		И я нажимаю на кнопку с именем 'ФормаПровести'
				
	* Проверить автоматическое создание ОФД
		Тогда открылось окно 'Поступление товаров: Накладная, УПД * от *'
		И я нажимаю на кнопку с именем 'ОбщаяКомандаСтруктураПодчиненности'
		И в табличном документе 'ТаблицаОтчета' я перехожу к ячейке "Объект"
		И в табличном документе 'ТаблицаОтчета' я делаю двойной клик на текущей ячейке
		
	* Скорректировать аналитики ОФД
		Когда открылось окно 'Отражение фактических данных * от *'
//		И из выпадающего списка с именем "ПриходРасход" я выбираю точное значение 'Расход'

		И я перехожу к закладке с именем "СтраницаВзаиморасчеты"
		И в таблице "Взаиморасчеты" я нажимаю кнопку выбора у реквизита с именем "ВзаиморасчетыСтатьяБюджета"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я перехожу к строке:
			| ''                          |
			| 'Статья доходов и расходов' |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 
		И в таблице "Взаиморасчеты" я завершаю редактирование строки
		
		И я перехожу к закладке с именем "ГруппаБДР"
		И в таблице "ТабБюджетДоходовИРасходов" я нажимаю кнопку выбора у реквизита с именем "ТабБюджетДоходовИРасходовСтатьяДоходовИРасходов"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 
		И в таблице "ТабБюджетДоходовИРасходов" я нажимаю кнопку выбора у реквизита с именем "АналитикаБДР1"
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Здания" "По точному совпадению" 
		И в таблице "ТабБюджетДоходовИРасходов" я нажимаю кнопку выбора у реквизита с именем "ТабБюджетДоходовИРасходовЦФО"
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - ЦФО 1 (АХО)" "По точному совпадению" 	
		И в таблице "ТабБюджетДоходовИРасходов" я нажимаю кнопку выбора у реквизита с именем "ТабБюджетДоходовИРасходовДокументПланирования"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я перехожу к строке:
			| ''                 |
			| 'Заявка на расход' |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно 'Заявки на расход'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$$НомерЗнР$$" "По точному совпадению"	
		И в таблице "ТабБюджетДоходовИРасходов" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаПровести'	
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаДокументаФакт'			
						
	* Проверить движения ОФД	
		Когда открылось окно 'Отражение фактических данных * от *'
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		И я перехожу к закладке с именем "ГруппаОперацииБюджетов"
		И элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'                             | 'Вид бюджета'               | 'Объект планирования'                                                         | 'Состояние' | 'Аналитика структуры'             | 'Аналитика статей бюджетов'                                   | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров'                          | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'     | 'Количество' | 'Лимит'     | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '$$ЖелательнаяДатаРасхода$$ 0:00:00' | 'Бюджет доходов и расходов' | 'Заявка на расход *; 3 000 RUB к *; ВА - Поставщик1; Расчеты с контрагентами' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест; ВА - Поставщик1; Без договора' | 'Расход'        | 'RUB'    | 'RUB'                  | '-3 000,00' | ''           | '-3 000,00' | '3 000,00'        | ''                     | '3 000,00'        | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
						
	* Проверяем факт расхода в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R54C10' равна '$СуммаДокументаФакт$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамФактРасхода" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'
		
	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 05.02.1 Создаем Заявку на расход с превышением резерва		 

	* Открыть документ основание (Заявка на расход)
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		И Я в списке "Заявки на расход" по полю "Номер" ищу элемент "$$НомерЗнР$$" "По точному совпадению"
		Когда открылось окно 'Заявки на расход'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокСкопировать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И в поле с именем 'Дата' я ввожу текст '01.04.2024  0:00:00'
		И я перехожу к следующему реквизиту	
		И в поле с именем 'ЖелательнаяДатаРасхода' я ввожу текст '01.04.2024'
		И я перехожу к следующему реквизиту	
	
	* Проверить наличие необходимых лимитов
		И я перехожу к закладке с именем "СтраницаКонтроляДокумента"
		Тогда таблица "ТаблицаКонтроляДокумента" стала равной:
			| 'Вид контроля'                | 'Результат' | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов'  | 'OK'        | 'Подробнее'                 |
			| 'Контроль бюджетных резервов' | 'Нарушен'   | 'Подробнее'                 |
		
	* Сохранить документ
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я удаляю переменную '$$СсылкаЗнР$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаЗнР$$"
		И я удаляю переменную '$$ЖелательнаяДатаРасхода$$'		
		И я запоминаю значение поля с именем 'ЖелательнаяДатаРасхода' как '$$ЖелательнаяДатаРасхода$$'


Сценарий: 05.02.2 Создаем Заявку на корректировку резерва
	
	* Открыть документ основание (ЗнР)
		Дано Я открываю навигационную ссылку "$$СсылкаЗнР$$"

	* Создать Заявку на корректировку	
		Когда открылось окно 'Заявка на расход *; * RUB *; ВА - Поставщик1; Расчеты с контрагентами'
		И я нажимаю на кнопку 'Заявка на корректировку планов и лимитов'
		Тогда открылось окно 'Заявка на корректировку планов и лимитов (создание) *'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Проверить заполнение
		Тогда элемент формы с именем "ДокументОснование" стал равен по шаблону 'Заявка на расход *; * RUB *; ВА - Поставщик1; Расчеты с контрагентами'
		И элемент формы с именем "ВидБюджета" стал равен 'Бюджет доходов и расходов'
		И элемент формы с именем 'НачалоПериода' стал равен '$$ЖелательнаяДатаРасхода$$ 0:00:00'
		И элемент формы с именем "ЦФО" стал равен 'ВА - ЦФО 1 (АХО)'
		И элемент формы с именем "Проект" стал равен ''
		И элемент формы с именем "Валюта" стал равен 'RUB'				
		И элемент формы с именем "ПриходРасход" стал равен 'Расход'
		
		И таблица "Планы" стала равной по шаблону:
			| 'N' | 'Статья бюджета' | 'Свободно'   | 'Аналитика1'  | 'Терминатор' | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Аналитика6'        | 'Лимит' | 'Документ резерва'                       | 'Резерв'   |
			| '1' | 'ВА - Статья 1'  | '600 000,00' | 'ВА - Здания' | ''           | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | ''      | 'Резервирование планов и лимитов * от *' | '3 000,00' |
				
		И таблица "ТаблицаКонтроляДокумента" стала равной:
			| 'Вид контроля'                | 'Результат' | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов'  | 'OK'        | 'Подробнее'                 |
			| 'Контроль бюджетных резервов' | '-'         | 'Не требуется'              |	
						
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я удаляю переменную '$$ПланыСумма$$'
		И я запоминаю значение поля с именем 'ПланыСуммаРезерв' таблицы 'Планы' как '$$ПланыСумма$$'
		И я удаляю переменную '$$СсылкаЗнК$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаЗнК$$"		

	* Проверить движения	
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		Тогда открылось окно 'Движения документа: Заявка на корректировку планов и лимитов * от *'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'                             | 'Вид бюджета'               | 'Объект планирования'                             | 'Состояние' | 'Аналитика структуры' | 'Аналитика статей бюджетов'                                   | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров' | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'                | 'Количество' | 'Лимит'                | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '$$ЖелательнаяДатаРасхода$$ 0:00:00' | 'Бюджет доходов и расходов' | 'Заявка на корректировку планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО)'    | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | ''                    | 'Расход'        | 'RUB'    | 'RUB'                  | '$$ПланыСумма$$' | ''           | '$$ПланыСумма$$' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
				
	* Проверяем средства к обеспечению в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R54C4' равна '$$ПланыСумма$$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамКОбеспечениюБДР" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'		
	
	* Закрыть все окна
		И я закрываю все окна клиентского приложения				
	
Сценарий: 05.02.3 Создаем Корректировку лимитов по заявке
		
	* Открыть документ основание (ЗнК)
		Дано Я открываю навигационную ссылку "$$СсылкаЗнК$$"

	* Ввести новый документ
		Когда открылось окно 'Заявка на корректировку планов и лимитов * от *'
		И я нажимаю на кнопку 'Корректировка планов и лимитов'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Проверить заполнение параметров
		Тогда элемент формы с именем "ВидБюджета" стал равен 'Бюджет доходов и расходов'
		И элемент формы с именем 'НачалоПериода' стал равен '$$ЖелательнаяДатаРасхода$$ 0:00:00'
		И элемент формы с именем "ЦФО" стал равен 'ВА - ЦФО 1 (АХО)'
		И элемент формы с именем "Проект" стал равен ''
		И элемент формы с именем "Валюта" стал равен 'RUB'
		И элемент формы с именем "ПриходРасход" стал равен 'Расход'

	* Проверить заполнение таблицы приемника
		И я перехожу к закладке с именем "СтраницаПолучатель"	
		Тогда таблица "Требуется" стала равной по шаблону:
			| '№' | 'Аналитика6'        | 'Лимит' | 'Документ резерва'                       | 'Статья бюджета' | 'Свободно'   | 'Аналитика1'  | 'Терминатор' | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Резерв'         |
			| '1' | '<Не используется>' | ''      | 'Резервирование планов и лимитов * от *' | 'ВА - Статья 1'  | '600 000,00' | 'ВА - Здания' | ''           | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '$$ПланыСумма$$' |
									
		И я запоминаю значение поля с именем 'ТребуетсяРезерв' таблицы 'Требуется' как 'ТребуетсяРезерв'		
	
	* Обеспечить за счет переноса из другого периода
		И в таблице "ОбеспечитьЗаСчетПострочно" я нажимаю на кнопку с именем 'ТребуетсяПодборОбеспеченияПоСтроке'
		Тогда открылось окно 'Подбор планов и лимитов'
		Если элемент формы с именем 'ВидИсточника' стал равен 'Лимиты' тогда
			И я меняю значение переключателя 'Вид источника' на 'Резервы'
		И я нажимаю кнопку выбора у поля с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Значение'
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - ЦФО 1 (АХО)" "По точному совпадению" 				
		И я нажимаю кнопку выбора у поля с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение'
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 				
		Если флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование' равен 'Да' Тогда
			И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
		И в таблице "Список" я перехожу к строке:
			| 'Аналитика 1' | 'Валюта' | 'Дата операции'     | 'Направление' | 'Статья бюджета' | 'ЦФО/Проект'       |
			| 'ВА - Здания' | 'RUB'    | '1 квартал 2024 г.' | 'Расход'      | 'ВА - Статья 1'  | 'ВА - ЦФО 1 (АХО)' |
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'ПеренестиВДокумент'
		И я нажимаю на кнопку с именем 'ФормаПровести'			
	
	* Проверка заполнения таблицы источника
		Тогда таблица "ОбеспечитьЗаСчетПострочно" стала равной:
			| 'Вид операции' | 'ЦФО'              | 'Валюта' | 'Период'            | 'Сумма корректировки' | 'Направление операции' | 'Проект' | 'Статья бюджета'               | 'Аналитика1'  | 'Терминатор' | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Аналитика6'        |
			| 'Перенос'      | 'ВА - ЦФО 1 (АХО)' | 'RUB'    | '1 квартал 2024 г.' | '$ТребуетсяРезерв$'   | 'Расход'               | ''       | 'ВА - Статья 1, ВА - Статья 1' | 'ВА - Здания' | ''           | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' |
				
//	* Проверить движения
//		Когда открылось окно 'Корректировка планов и лимитов * от *'
//		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
//
//	* Проверяем корректировку лимитов в Отчете по лимитам					
//		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет доходов и расходов' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
//		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
//        И я нажимаю на кнопку с именем 'СформироватьОтчет'
//		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R24C5' равна '-$ТребуетсяРезерв$'
//		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R14C5' равна '$ТребуетсяРезерв$'
//		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R54C4' равна ''
//		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамКорректировкаБДР" по шаблону
//		И Я закрываю окно 'Отчет по лимитам (период в строках)'
//		Тогда открылось окно '1С:Предприятие'
//		И я нажимаю на кнопку 'Нет'

	* Проверяем контроль лимитов в Заявке на расход

		Дано Я открываю навигационную ссылку "$$СсылкаЗнР$$"
		Когда открылось окно 'Заявка на расход *; * RUB *; ВА - Поставщик1; Расчеты с контрагентами'
		И Контроль лимитов пройден успешно

	* Закрыть все окна
		И я закрываю все окна клиентского приложения	
						



