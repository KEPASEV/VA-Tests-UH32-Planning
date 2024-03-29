﻿#language: ru

@tree

Функционал: 04. Исполнение лимитов по БДДС - кейс 1

Как Администратор я хочу
1) выполнить цепочку документов: Резервирование -> ЗНО (по договору без графика расчетов) -> ПП -> Списание с РС -> ОФД
2) выполнить цепочку документов: ЗНО с превышением резерва -> Заявку на корректировку -> Корректировку лимитов
чтобы проверить соблюдение установленных лимитов в процессе  
(!!!чтобы запускать нескольк раз этот тест в одной базе, надо отменять проведение всей цепочки документов)

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 04.00 Определить тип приложения

	Пусть Инициализация переменных				

Сценарий: 04.01.1 Создаем Резервирование планов и лимитов по ЦФО 1 (АХО) на 1 квартал 2024 год

	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'
	
	* Ввести новый документ
		И Я устанавливаю отбор в форме списка Резерв 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)' 
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
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - Поставщик1" "По точному совпадению"	
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
		и таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'             | 'Вид бюджета'                      | 'Объект планирования'                                                | 'Состояние' | 'Аналитика структуры'                            | 'Аналитика статей бюджетов'                                          | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров' | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'      | 'Количество' | 'Лимит'      | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '01.02.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | 'ВА - Статья 1 (ВА - Автотранспорт;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '100 000,00' | ''           | '100 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '2' | '01.03.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест'                | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход'        | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '200 000,00' | ''           | '200 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '3' | '01.03.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Резервирование планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО); ВА - Проект 1; ВА - ООО Тест' | 'ВА - Статья 4 Расход'                                               | ''                       | ''                       | ''                   | 'ВА - ООО Тест'       | 'Расход'        | 'RUB'    | 'RUB'                  | '300 000,00' | ''           | '300 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
		
	* Проверяем зарезервированные средства в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет движения денежных средств' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C8' равна '$СуммаДокументаРезерв$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамРезерв" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

	* Закрыть все окна
		И я закрываю все окна клиентского приложения												

Сценарий: 04.01.2 Создаем Заявку на оплату на основании счета (по договору без графика расчетов)				
	* Создать счёт от поставщика
		И Я создаю счет от поставщика 'ВА - Поставщик1' по организации 'ВА - ООО Тест'
		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю точное значение 'Без договора'				
		И Я добавляю в счет от поставщика номенклатуру 'ВА - Товар1' в количестве '2' по цене '1000' по ставке 'Без НДС'
		И Я добавляю в счет от поставщика номенклатуру 'ВА - Товар2' в количестве '1' по цене '1000' по ставке 'Без НДС'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Счет от поставщика (создание) *' в течение 20 секунд	
		И я запоминаю значение поля с именем 'Номер' таблицы 'Список' как 'НомерСчета'

	* Создать документ ЗНО на основе данных из счёта от поставщика
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		И я нажимаю кнопку выбора у поля с именем "ОснованиеОбязательства"
		И Я в таблице '' по полю '' ищу значение 'Счет от поставщика' 	
		И я нажимаю на кнопку 'ОК'
		Тогда открылось окно 'Счета от поставщиков'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$НомерСчета$" "По точному совпадению"	
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаЗнО'
		И я запоминаю значение поля с именем 'ЖелательнаяДатаПлатежа' как 'ЖелательнаяДатаПлатежа'

	* Указать источник лимитов
		И я нажимаю кнопку выбора у поля с именем "ДокументПланирования"
		Тогда открылось окно 'Резервирования планов и лимитов'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$$НомерДокРезерва$$" "По точному совпадению"	
		И я перехожу к следующему реквизиту
		
	* Заполнить платежные реквизиты
		И я нажимаю кнопку выбора у поля с именем "СчетКассаОрганизации"
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля с именем "СчетКонтрагента"
		И в таблице "Список" я выбираю текущую строку
				
	* Заполнить аналитики учета и планирования по источнику лимита
		И я перехожу к закладке с именем "Движения"
		И в таблице "ТаблицаДвижений" я нажимаю на кнопку с именем 'ТаблицаДвиженийЗаполнитьПоРезерву'
		И в таблице "Резервы" я перехожу к строке:
			| 'Аналитика1'  | 'Пометка' | 'Резерв'     | 'Статья бюджета / Аналитики статьи' |
			| 'ВА - Здания' | 'Нет'     | '200 000,00' | 'ВА - Статья 1'                     |
		И в таблице "Резервы" я изменяю флаг с именем 'РезервыПометка'
		И в таблице "Резервы" я завершаю редактирование строки
		И в таблице "Резервы" я активизирую поле с именем "РезервыЗаявлено"
		И в таблице "Резервы" я выбираю текущую строку
		И в таблице "Резервы" в поле с именем 'РезервыЗаявлено' я ввожу текст "$СуммаЗнО$"
		И в таблице "Резервы" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаПеренестиВДокумент'
		И в таблице "ТаблицаДвижений" я активизирую поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств"
		И я выбираю пункт контекстного меню с именем 'ТаблицаДвиженийКонтекстноеМенюУдалить' на элементе формы с именем "ТаблицаДвижений"

	* Проверить наличие необходимых лимитов
		И Контроль лимитов пройден успешно	
			
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я удаляю переменную '$$НомерЗнО$$'
		И я запоминаю значение поля с именем 'Номер' как '$$НомерЗнО$$'
		И я удаляю переменную '$$СсылкаЗнО$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаЗнО$$"	 				

	* Проверить движения
		Когда открылось окно 'Заявка на оплату *; * RUB к *; ВА - Поставщик1; Оплата поставщику'
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениямТолькоУХ'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'                           | 'Вид бюджета'                      | 'Объект планирования'                                                   | 'Состояние' | 'Аналитика структуры'             | 'Аналитика статей бюджетов'                                   | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров'                                        | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'     | 'Количество' | 'Лимит'     | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '$ЖелательнаяДатаПлатежа$ 0:00:00' | 'Бюджет движения денежных средств' | 'Заявка на оплату *; 3 000 RUB к *; ВА - Поставщик1; Оплата поставщику' | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест; ВА - Поставщик1; Без договора; Без договора' | 'Расход'        | 'RUB'    | 'RUB'                  | '3 000,00'  | ''           | '3 000,00'  | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
			| '2' | '$ЖелательнаяДатаПлатежа$ 0:00:00' | 'Бюджет движения денежных средств' | 'Резервирование планов и лимитов * от *'                                | ''          | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | 'ВА - ООО Тест; ВА - Поставщик1; Без договора'               | 'Расход'        | 'RUB'    | 'RUB'                  | '-3 000,00' | ''           | '-3 000,00' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
														
	* Проверяем заявленные средства в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет движения денежных средств' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C9' равна '$СуммаЗнО$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамЗнО" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 04.01.3 Создаем Платежный документ
	* Открыть документ основание (ЗнО)
		Дано Я открываю навигационную ссылку "$$СсылкаЗнО$$"

	* Подготовить платежный документ
		Когда открылось окно 'Заявка на оплату *; * RUB *; ВА - Поставщик1; Оплата поставщику'
		И я нажимаю на кнопку 'Платежное поручение'
		Когда открылось окно 'Платежное поручение (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я удаляю переменную '$$СсылкаПП$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаПП$$"
							
//	* Подготовка платежного документа через реестр платежей
//		И Я создаю Реестр платежей по организации 'ВА - ООО Тест' 
//	 	И в поле с именем 'ДатаОплаты' я ввожу текст '$ЖелательнаяДатаПлатежа$'
//	 	И я перехожу к следующему реквизиту
//	 	Тогда таблица "ЗаявкиНаОплату" стала равной:
//	 		| 'N' | 'Заявка на оплату'   | 'Сумма платежа'   |
//	 		| '1' | '$ЗаголовокОкнаЗнО$' | '$СуммаЗнО$, RUB' |
//		И я нажимаю на кнопку с именем 'ФормаПровести'
//		И я нажимаю на кнопку с именем 'ФормаСформироватьПлатежныеПоручения'
//		Тогда открылось окно 'Генерация платежных поручений'
//		И я нажимаю на кнопку с именем 'СоздатьПлатежныеПоручения'
//		И я нажимаю на кнопку с именем 'ФормаСписокСозданныхОбъектов'

	* Проверить наследование аналитик в ПП
		И я перехожу к закладке с именем "ГруппаРасшифровка"
		Тогда таблица "РасшифровкаПлатежа" стала равной по шаблону:
			| 'N' | 'Договор'      | 'Аналитика 2'       | 'ЦФО'              | 'Сумма платежа' | 'Курс' | 'Расчеты в у.е.' | 'Сумма' | 'Аналитика 1' | 'Ставка НДС' | 'Сумма НДС' | 'Аналитика 5'       | 'Проект' | 'Статья ДДС'    | 'Аналитика 3'       | 'Аналитика 6'       | 'Элемент структуры задолженности' | 'Аналитика 4'       | 'Документ планирования'                                                 | 'Отступ' |
			| '1' | 'Без договора' | '<Не используется>' | 'ВА - ЦФО 1 (АХО)' | '3 000,00'      | '1'    | '3 000'          | ''      | 'ВА - Здания' | 'Без НДС'    | ''          | '<Не используется>' | ''       | 'ВА - Статья 1' | '<Не используется>' | '<Не используется>' | 'Основной долг'                   | '<Не используется>' | 'Заявка на оплату *; 3 000 RUB к *; ВА - Поставщик1; Оплата поставщику' | ''       |
	
	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 04.01.4 Отражаем фактические данные об оплате	 		 		  		 		 		 	 
		
	* Открыть документ основание (Платежное поручение)
		Дано Я открываю навигационную ссылку "$$СсылкаПП$$"	

	* Ввести Списание с расчетного счета
		Когда открылось окно 'Платежное поручение * от *'			
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю кнопку выбора у поля с именем "Дата"
		И в поле с именем 'Дата' я ввожу текст '01.04.2024  0:00:00'
		И я запоминаю значение поля с именем 'Дата' как 'ДатаСписания'	
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаДокументаФакт'
		И я нажимаю на кнопку с именем 'ФормаПровести'				
		
	* Проверить наследование аналитик в Списание с р/с
		Тогда таблица "РасшифровкаПлатежа" стала равной по шаблону:
			| 'N' | 'Договор / Статья расходов' | 'Статья расходов' | 'Проект' | 'Аналитика 5' | 'Документ расчетов' | 'Сумма' | 'Аналитика 1' | 'Погашение задолженности' | 'Курс' | 'Расчеты в у.е.' | 'Счет на оплату'            | 'Счет авансов' | 'Ставка НДС' | 'НДС' | 'Счета расчетов' | 'Аналитика 2' | 'ЦФО'              | 'Аналитика 3' | 'Аналитика 6' | 'Аналитика 4' | 'Элемент структуры задолженности' | 'Документ планирования'                                                 | 'Налоговый учет' | 'Отступ' |
			| '1' | 'Без договора'              | 'ВА - Статья 1'   | ''       | ''            | ''                  | ''      | 'ВА - Здания' | 'Автоматически'           | '1'    | '3 000'          | 'Счет от поставщика * от *' | '60.02'        | 'Без НДС'    | ''    | '60.01'          | ''            | 'ВА - ЦФО 1 (АХО)' | ''            | ''            | ''            | 'Основной долг'                   | 'Заявка на оплату *; 3 000 RUB к *; ВА - Поставщик1; Оплата поставщику' | ''               | ''       |
		
	* Проверить автоматическое создание ОФД
		И я нажимаю на кнопку с именем 'ОбщаяКомандаСтруктураПодчиненности'
		Тогда открылось окно 'Связанные документы: Списание с расчетного * от *'
		И в табличном документе 'ТаблицаОтчета' я перехожу к ячейке "Объект"
		И в табличном документе 'ТаблицаОтчета' я делаю двойной клик на текущей ячейке
		
	* Проверить наследование аналитик в ОФД		
		Тогда таблица "ТабБюджетДвиженияДенежныхСредств" стала равной по шаблону:
			| 'Договор'      | 'ЦФО'              | 'Объект расчетов' | 'Сумма в валюте документа' | 'Статья ДДС'    | 'Аналитика1'  | 'Сумма в валюте взаиморасчетов' | 'Аналитика2'        | 'Аналитика3'        | 'Банковский счет/Касса'                           | 'Аналитика4'        | 'Аналитика5'        | 'Курс' | 'Документ планирования'                                                 | 'Аналитика6'        | 'Проект' | 'Сумма' | 'Идентификатор позиции' |
			| 'Без договора' | 'ВА - ЦФО 1 (АХО)' | ''                | '3 000,00'                 | 'ВА - Статья 1' | 'ВА - Здания' | '3 000'                         | '<Не используется>' | '<Не используется>' | '40700810000000000011, Автотест банк организации' | '<Не используется>' | '<Не используется>' | '1'    | 'Заявка на оплату *; 3 000 RUB к *; ВА - Поставщик1; Оплата поставщику' | '<Не используется>' | ''       | ''      | 'Указан'                |
						
	* Проверить движения ОФД	
		Когда открылось окно 'Отражение фактических данных * от *'
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		И я перехожу к закладке с именем "ГруппаОперацииБюджетов"
		И элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Вид бюджета'                      | 'Приход расход' | 'Кратность лимитирования' | 'Объект планирования'                                                   | 'Сумма'     | 'Аналитика партнеров'                          | 'Источник версии' | 'Лимит'     | 'Состояние' | 'Курс планирования' | 'Сумма исполнено' | 'Аналитика структуры'             | 'Аналитика потребностей' | 'Лимит исполнено' | 'Аналитика поставки' | 'Количество' | 'Валюта' | 'Количество исполнено' | 'Аналитика номенклатуры' | 'Валюта лимитирования' | 'Кратность планирования' | 'Курс задан в операции' | 'Курс лимитирования' | 'Аналитика статей бюджетов'                                   | 'Корректировка документа' |
			| '1' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | 'Заявка на оплату *; 3 000 RUB к *; ВА - Поставщик1; Оплата поставщику' | '-3 000,00' | 'ВА - ООО Тест; ВА - Поставщик1; Без договора' | ''                | '-3 000,00' | ''          | '1,0000'            | '3 000,00'        | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | ''                       | '3 000,00'        | ''                   | ''           | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
	
	* Проверяем факт оплаты в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет движения денежных средств' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C10' равна '$СуммаДокументаФакт$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамФакт" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'
		
	* Закрыть все окна
		И я закрываю все окна клиентского приложения	


Сценарий: 04.02.1 Создаем Заявку на оплату с превышением резерва
	* Создать документ ЗНО копированием
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'				
		И Я в списке "Заявки на оплату" по полю "Номер" ищу элемент "$$НомерЗнО$$" "По точному совпадению"
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокСкопировать'		
		Когда открылось окно 'Заявка на оплату (создание)'
		И в поле с именем 'СуммаДокумента' я ввожу текст '200 000,00'
		И я перехожу к следующему реквизиту		

	* Проверить наличие необходимых лимитов
		И я перехожу к закладке с именем "СтраницаКонтроляДокумента"
		Тогда таблица "ТаблицаКонтроляДокумента" стала равной:
			| 'Вид контроля'                | 'Результат' | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов'  | 'OK'        | 'Подробнее'                 |
			| 'Контроль бюджетных резервов' | 'Нарушен'   | 'Подробнее'                 |
		
	* Сохранить документ
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я удаляю переменную '$$СсылкаЗнО2$$'	
		И я сохраняю навигационную ссылку текущего окна в переменную "$$СсылкаЗнО2$$"

Сценарий: 04.02.2 Создаем Заявку на корректировку резерва
	* Открыть документ основание (ЗнО)
		Дано Я открываю навигационную ссылку "$$СсылкаЗнО2$$"

	* Создать Заявку на корректировку
		Когда открылось окно 'Заявка на оплату *; * RUB к *; ВА - Поставщик1; Оплата поставщику'
		И я нажимаю на кнопку 'Заявка на корректировку планов и лимитов'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'		

	* Проверить заполнение
		Тогда открылось окно 'Заявка на корректировку планов и лимитов * от *'		
		И элемент формы с именем "ДокументОснование" стал равен по шаблону 'Заявка на оплату *; 200 000 RUB к *; ВА - Поставщик1; Оплата поставщику'
		И элемент формы с именем "ВидБюджета" стал равен 'Бюджет движения денежных средств'
		И элемент формы с именем "ПредставлениеПериода" стал равен 'Март 2024 г.'
		И элемент формы с именем "ЦФО" стал равен 'ВА - ЦФО 1 (АХО)'
		И элемент формы с именем "Валюта" стал равен 'RUB'
		И элемент формы с именем "ПриходРасход" стал равен 'Расход'
		И таблица "Планы" стала равной по шаблону:
			| 'N' | 'Статья бюджета' | 'Свободно' | 'Аналитика1'  | 'Терминатор' | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Аналитика6'        | 'Лимит' | 'Документ резерва'                       | 'Резерв'   |
			| '1' | 'ВА - Статья 1'  | ''         | 'ВА - Здания' | ''           | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | ''      | 'Резервирование планов и лимитов * от *' | '3 000,00' |
		
		И таблица "ТаблицаКонтроляДокумента" стала равной:
			| 'Вид контроля'                | 'Результат' | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов'  | 'OK'        | 'Подробнее'                 |
			| 'Контроль бюджетных резервов' | '-'         | 'Не требуется'              |
	
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я удаляю переменную '$$ПланыСуммаРезерв$$'
		И я запоминаю значение поля с именем 'ПланыСуммаРезерв' таблицы 'Планы' как '$$ПланыСуммаРезерв$$'
		И я удаляю переменную '$$НомерЗнК$$'
		И я запоминаю значение поля с именем 'Номер' как '$$НомерЗнК$$'
			
	* Проверить движения	
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		Тогда открылось окно 'Движения документа: Заявка на корректировку планов и лимитов * от *'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		И таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Период'             | 'Вид бюджета'                      | 'Объект планирования'                             | 'Состояние' | 'Аналитика структуры' | 'Аналитика статей бюджетов'                                   | 'Аналитика номенклатуры' | 'Аналитика потребностей' | 'Аналитика поставки' | 'Аналитика партнеров' | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'                | 'Количество' | 'Лимит'                | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования' | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
			| '1' | '01.03.2024 0:00:00' | 'Бюджет движения денежных средств' | 'Заявка на корректировку планов и лимитов * от *' | ''          | 'ВА - ЦФО 1 (АХО)'    | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | ''                   | ''                    | 'Расход'        | 'RUB'    | 'RUB'                  | '$$ПланыСуммаРезерв$$' | ''           | '$$ПланыСуммаРезерв$$' | ''                | ''                     | ''                | ''                | 'Нет'                   | '1,0000'            | '1'                      | '1,0000'             | '1'                       | ''                        |
	
	* Проверяем средства к обеспечению в Отчете по лимитам
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет движения денежных средств' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C4' равна '$$ПланыСуммаРезерв$$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамКОбеспечению" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'							

	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 04.02.3 Создаем Корректировку лимитов по заявке
		
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Корректировка планов и лимитов'

	* Ввести новый документ
		Тогда открылось окно 'Корректировки планов и лимитов'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		И я нажимаю кнопку выбора у поля с именем "ДокументОснование"
		Тогда открылось окно 'Выбор типа данных'
		И Я в таблице '' по полю '' ищу значение 'Заявка на корректировку планов и лимитов' 	
		И я нажимаю на кнопку 'ОК'	
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$$НомерЗнК$$" "По точному совпадению"	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Проверить заполнение таблицы приемника
		Тогда таблица "Требуется" стала равной по шаблону:
			| 'Аналитика6'        | '№' | 'Документ резерва'                       | 'Лимит' | 'Период'       | 'Направление операции' | 'ЦФО'              | 'Валюта' | 'Проект' | 'Статья бюджета' | 'Свободно' | 'Терминатор' | 'Аналитика1'  | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Резерв'               |
			| '<Не используется>' | '1' | 'Резервирование планов и лимитов * от *' | ''      | 'Март 2024 г.' | 'Расход'               | 'ВА - ЦФО 1 (АХО)' | 'RUB'    | ''       | 'ВА - Статья 1'  | ''         | ''           | 'ВА - Здания' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '$$ПланыСуммаРезерв$$' |
					
		И я запоминаю значение поля с именем 'ТребуетсяРезерв' таблицы 'Требуется' как 'ТребуетсяРезерв'

	* Обеспечить за счет переноса из другого периода
		И в таблице "ОбеспечитьЗаСчетПострочно" я нажимаю на кнопку с именем 'ТребуетсяПодборОбеспеченияПоСтроке'
		Тогда открылось окно 'Подбор планов и лимитов'
		И я нажимаю кнопку выбора у поля с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Значение'
		И Я в списке "Список" по полю "Наименование в программе" ищу и выбираю элемент "ВА - ЦФО 1 (АХО)" "По точному совпадению" 				
		И я нажимаю кнопку выбора у поля с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение'
		И Я в списке "Список" по полю "Наименование" ищу и выбираю элемент "ВА - Статья 1" "По точному совпадению" 				
		Если флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование' равен 'Да' Тогда
			И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
		И я нажимаю кнопку выбора у поля с именем "Период"
		Тогда открылось окно 'Выберите период'
		И в поле с именем 'DateEnd' я ввожу текст '31.01.2024'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно 'Подбор планов и лимитов'
		И в таблице "Список" я перехожу к строке:
			| 'Аналитика 1' | 'Валюта' | 'Дата операции'  | 'Доступно' | 'Направление' | 'Статья бюджета' | 'ЦФО/Проект'       |
			| 'ВА - Здания' | 'RUB'    | 'Январь 2024 г.' | '200 000'  | 'Расход'      | 'ВА - Статья 1'  | 'ВА - ЦФО 1 (АХО)' |
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'ПеренестиВДокумент'
		И я нажимаю на кнопку с именем 'ФормаПровести'			
					
	* Проверка заполнения таблицы источника
		Тогда таблица "ОбеспечитьЗаСчетПострочно" стала равной:
			| 'Вид операции' | 'ЦФО'              | 'Валюта' | 'Период'         | 'Сумма корректировки' | 'Направление операции' | 'Проект' | 'Статья бюджета'               | 'Аналитика1'  | 'Терминатор' | 'Аналитика2'        | 'Аналитика3'        | 'Аналитика4'        | 'Аналитика5'        | 'Аналитика6'        | 'Документ резерва' |
			| 'Перенос'      | 'ВА - ЦФО 1 (АХО)' | 'RUB'    | 'Январь 2024 г.' | '$ТребуетсяРезерв$'   | 'Расход'               | ''       | 'ВА - Статья 1, ВА - Статья 1' | 'ВА - Здания' | ''           | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '<Не используется>' | ''                 |
		
	* Проверить движения
		Когда открылось окно 'Корректировка планов и лимитов * от *'
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И таблица "ОперацииБюджетов" стала равной по шаблону:
			| 'N' | 'Вид бюджета'                      | 'Приход расход' | 'Кратность лимитирования' | 'Объект планирования'                             | 'Сумма'     | 'Аналитика партнеров' | 'Источник версии' | 'Лимит'     | 'Состояние' | 'Курс планирования' | 'Сумма исполнено' | 'Аналитика структуры' | 'Аналитика потребностей' | 'Лимит исполнено' | 'Аналитика поставки' | 'Количество' | 'Валюта' | 'Количество исполнено' | 'Аналитика номенклатуры' | 'Валюта лимитирования' | 'Кратность планирования' | 'Курс задан в операции' | 'Курс лимитирования' | 'Аналитика статей бюджетов'                                   | 'Корректировка документа' |
			| '1' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | ''                                                | '3 000,00'  | ''                    | ''                | '3 000,00'  | ''          | '1,0000'            | ''                | 'ВА - ЦФО 1 (АХО)'    | ''                       | ''                | ''                   | ''           | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
			| '2' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | 'Резервирование планов и лимитов * от *'          | '3 000,00'  | ''                    | ''                | '3 000,00'  | ''          | '1,0000'            | ''                | 'ВА - ЦФО 1 (АХО)'    | ''                       | ''                | ''                   | ''           | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
			| '3' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | ''                                                | '-3 000,00' | ''                    | ''                | '-3 000,00' | ''          | '1,0000'            | ''                | 'ВА - ЦФО 1 (АХО)'    | ''                       | ''                | ''                   | ''           | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
			| '4' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | 'Заявка на корректировку планов и лимитов * от *' | '-3 000,00' | ''                    | ''                | '-3 000,00' | ''          | '1,0000'            | ''                | 'ВА - ЦФО 1 (АХО)'    | ''                       | ''                | ''                   | ''           | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
	
	* Проверяем корректировку лимитов в Отчете по лимитам					
		И Я формирую Отчет по лимитам по виду бюджета 'Бюджет движения денежных средств' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R14C5' равна '-$ТребуетсяРезерв$'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R34C5' равна '$ТребуетсяРезерв$'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R34C4' равна ''
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамКорректировка" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'							

	* Проверяем контроль лимитов в Заявке на оплату

		Дано Я открываю навигационную ссылку "$$СсылкаЗнО2$$"
		Когда открылось окно 'Заявка на оплату *; * RUB к *; ВА - Поставщик1; Оплата поставщику'
		И Контроль лимитов пройден успешно
		 
	* Закрыть все окна
		И я закрываю все окна клиентского приложения