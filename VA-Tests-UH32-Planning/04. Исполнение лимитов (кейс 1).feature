﻿#language: ru

@tree

Функционал: 04. Исполнение лимитов по БДДС - кейс 1

Как Администратор я хочу
выполнить цепочку документов: Резервирование -> ЗНО (по договору без графика расчетов) -> ПП -> Списание с РС -> ОФД
чтобы проверить соблюдение установленных лимитов в процессе  
Чтобы запускать нескольк раз этот тест в одной базе, надо отменять проведение всей цепочки документов

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 04.00 Определить тип приложения

	Пусть Инициализация переменных				

Сценарий: 04.01 Создаем документ Резервирование планов и лимитов по ЦФО 1 (АХО) на 1 квартал 2024 год

	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'
	
	* Ввод нового документа
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
		И Контроль лимитов пройден успешно

	* Подтвердить резервирование 
		И я нажимаю на кнопку с именем 'ФормаПровести'		
		Когда открылось окно 'Резервирование планов и лимитов * от *'
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаДокументаРезерв'
		И я запоминаю заголовок текущего окна как "ЗаголовокОкна"
		И я запоминаю значение поля с именем 'Номер' как 'НомерДокРезерва'

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
	
Сценарий: 04.02 Проверяем зарезервированные средства в Отчете по лимитам
	* Сформировать отчет по БДДС за 2024
		И Я формирую Отчет по лимитам по виду бюджета 'БДДС' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C8' равна '$СуммаДокументаРезерв$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамРезерв" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

Сценарий: 04.03 Создаем счёт, полученный от поставщика
		
	* Получить счёт от поставщика
		И Я создаю счет от поставщика 'ВА - Поставщик1' по организации 'ВА - ООО Тест'
		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю точное значение 'Без договора'				
		И Я добавляю в счет от поставщика номенклатуру 'ВА - Товар1' в количестве '2' по цене '1000' по ставке 'Без НДС'
		И Я добавляю в счет от поставщика номенклатуру 'ВА - Товар2' в количестве '1' по цене '1000' по ставке 'Без НДС'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Счет от поставщика (создание) *' в течение 20 секунд	
		И я запоминаю значение поля с именем 'Номер' таблицы 'Список' как 'НомерСчета'

Сценарий: 04.04 Инициируем оплату на основании счета (по договору без графика расчетов)		
		
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
	
//	* Отменить проведение документов
//		Когда открылось окно 'Заявки на оплату'
//		И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Значение" я выбираю точное значение 'ВА - ООО Тест'
//		И для каждой строки таблицы 'Список' я выполняю		
//			И Я удаляю текущую строку в списке 'Список'

	* Создать документ ЗНО на основе данных из счёта от поставщика
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
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$НомерДокРезерва$" "По точному совпадению"	
				
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
		И я запоминаю заголовок текущего окна как "ЗаголовокОкнаЗнО"
		И я запоминаю значение поля с именем 'Номер' как 'НомерЗнО'

	* Проверить движения
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениямТолькоУХ'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		Тогда элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной:
			| 'N' | 'Период'                           | 'Вид бюджета'                      | 'Приход расход' | 'Кратность лимитирования' | 'Объект планирования' | 'Сумма'     | 'Аналитика партнеров'                                        | 'Источник версии' | 'Состояние' | 'Курс планирования' | 'Аналитика потребностей' | 'Сумма исполнено' | 'Аналитика структуры'             | 'Лимит исполнено' | 'Аналитика поставки' | 'Количество' | 'Лимит'     | 'Валюта' | 'Количество исполнено' | 'Аналитика номенклатуры' | 'Валюта лимитирования' | 'Кратность планирования' | 'Курс задан в операции' | 'Курс лимитирования' | 'Аналитика статей бюджетов'                                   | 'Корректировка документа' |
			| '1' | '$ЖелательнаяДатаПлатежа$ 0:00:00' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | '$ЗаголовокОкнаЗнО$'  | '3 000,00'  | 'ВА - ООО Тест; ВА - Поставщик1; Без договора; Без договора' | ''                | ''          | '1,0000'            | ''                       | ''                | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | ''                | ''                   | ''           | '3 000,00'  | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
			| '2' | '$ЖелательнаяДатаПлатежа$ 0:00:00' | 'Бюджет движения денежных средств' | 'Расход'        | '1'                       | '$ЗаголовокОкна$'     | '-3 000,00' | 'ВА - ООО Тест; ВА - Поставщик1; Без договора'               | ''                | ''          | '1,0000'            | ''                       | ''                | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | ''                | ''                   | ''           | '-3 000,00' | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |

	* Закрыть все окна
		И я закрываю все окна клиентского приложения											
				
Сценарий: 04.05 Проверяем заявленные средства в Отчете по лимитам
	* Сформировать отчет по БДДС за 2024	
		И Я формирую Отчет по лимитам по виду бюджета 'БДДС' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C9' равна '$СуммаЗнО$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамЗнО" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'

Сценарий: 04.06 Подготовка платежного документа
	* Найти документ основание (ЗнО)
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$НомерЗнО$" "По точному совпадению"	

	* Подготовка платежного документа
		Когда открылось окно '$ЗаголовокОкнаЗнО$'
		И я нажимаю на кнопку 'Платежное поручение'
		Когда открылось окно 'Платежное поручение (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я запоминаю значение поля с именем 'Номер' как 'НомерПП'
							
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
		И таблица "РасшифровкаПлатежа" стала равной:
			| 'N' | 'Договор'      | 'Аналитика 2'       | 'ЦФО'              | 'Сумма платежа' | 'Аналитика 1' | 'Аналитика 5'       | 'Проект' | 'Статья ДДС'    | 'Аналитика 3'       | 'Аналитика 6'       | 'Аналитика 4'       | 'Документ планирования' |
			| '1' | 'Без договора' | '<Не используется>' | 'ВА - ЦФО 1 (АХО)' | '$СуммаЗнО$'    | 'ВА - Здания' | '<Не используется>' | ''       | 'ВА - Статья 1' | '<Не используется>' | '<Не используется>' | '<Не используется>' | '$ЗаголовокОкнаЗнО$'    |				

Сценарий: 04.07 Подтверждение осуществления платежа	 		 		  		 		 		 	 
		
		И В командном интерфейсе я выбираю 'Банк и касса' 'Платежные поручения'
		И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "$НомерПП$" "По точному совпадению"	
		
		Когда открылось окно 'Платежное поручение * от *'		

	* Ввести списание с расчетного счета
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю кнопку выбора у поля с именем "Дата"
		И в поле с именем 'Дата' я ввожу текст '01.04.2024  0:00:00'
		И я запоминаю значение поля с именем 'Дата' как 'ДатаСписания'
	
		И я нажимаю на кнопку с именем 'ФормаПровести'				
		
	* Проверить наследование аналитик в Списание с р/с
		Тогда таблица "РасшифровкаПлатежа" стала равной:
			| 'N' | 'Договор / Статья расходов' | 'Статья расходов' | 'Проект' | 'Аналитика 5' | 'Аналитика 1' | 'Аналитика 2' | 'ЦФО'              | 'Аналитика 3' | 'Аналитика 6' | 'Аналитика 4' | 'Документ планирования' |
			| '1' | 'Без договора'              | 'ВА - Статья 1'   | ''       | ''            | 'ВА - Здания' | ''            | 'ВА - ЦФО 1 (АХО)' | ''            | ''            | ''            | '$ЗаголовокОкнаЗнО$'    |

	* Проверить автоматическое создание ОФД
		И я нажимаю на кнопку с именем 'ОбщаяКомандаСтруктураПодчиненности'
		Тогда открылось окно 'Связанные документы: Списание с расчетного * от *'
		И в табличном документе 'ТаблицаОтчета' я перехожу к ячейке "Объект"
		И в табличном документе 'ТаблицаОтчета' я делаю двойной клик на текущей ячейке
		
	* Проверить наследование аналитик в ОФД		
		Тогда таблица "ТабБюджетДвиженияДенежныхСредств" стала равной:
			| 'Договор'      | 'ЦФО'              | 'Объект расчетов' | 'Сумма в валюте документа' | 'Статья ДДС'    | 'Аналитика1'  | 'Аналитика2'        | 'Аналитика3'        | 'Банковский счет/Касса'                           | 'Аналитика4'        | 'Аналитика5'        | 'Курс' | 'Документ планирования' | 'Аналитика6'        | 'Проект' | 'Сумма' |
			| 'Без договора' | 'ВА - ЦФО 1 (АХО)' | ''                | '$СуммаЗнО$'               | 'ВА - Статья 1' | 'ВА - Здания' | '<Не используется>' | '<Не используется>' | '40700810000000000011, Автотест банк организации' | '<Не используется>' | '<Не используется>' | '1'    | '$ЗаголовокОкнаЗнО$'    | '<Не используется>' | ''       | ''      |
						
	* Проверить движения ОФД	
		И я нажимаю на кнопку с именем 'ФормаОбработкаДвиженияДокументаОтчетПоДвижениям'
		И я нажимаю на кнопку с именем 'ФормаПоказатьПериод'
		И я перехожу к закладке с именем "ГруппаОперацииБюджетов"
		И элемент формы с именем "ИнформацияОПроведении" стал равен 'Структура'
		И элемент формы с именем "КорректируемыеЭкземплярыОтчетовОтсутствуют" стал равен 'Корректируемые экземпляры отчетов отсутствуют'
		И элемент формы с именем "КорректируемыйЭкземплярОтчета" стал равен ''
		И таблица "ОперацииБюджетов" стала равной:
			| 'N' | 'Вид бюджета'                      | 'Приход расход' | 'Объект планирования' | 'Сумма'     | 'Аналитика партнеров'                          | 'Источник версии' | 'Состояние' | 'Курс планирования' | 'Аналитика потребностей' | 'Сумма исполнено' | 'Аналитика структуры'             | 'Лимит исполнено' | 'Аналитика поставки' | 'Количество' | 'Лимит'     | 'Валюта' | 'Количество исполнено' | 'Аналитика номенклатуры' | 'Валюта лимитирования' | 'Кратность планирования' | 'Курс задан в операции' | 'Курс лимитирования' | 'Аналитика статей бюджетов'                                   | 'Корректировка документа' |
			| '1' | 'Бюджет движения денежных средств' | 'Расход'        | '$ЗаголовокОкнаЗнО$'  | '-3 000,00' | 'ВА - ООО Тест; ВА - Поставщик1; Без договора' | ''                | ''          | '1,0000'            | ''                       | '3 000,00'        | 'ВА - ЦФО 1 (АХО); ВА - ООО Тест' | '3 000,00'        | ''                   | ''           | '-3 000,00' | 'RUB'    | ''                     | ''                       | 'RUB'                  | '1'                      | 'Нет'                   | '1,0000'             | 'ВА - Статья 1 (ВА - Здания;  - ;  - ;  - ;  - ;  - ) Расход' | ''                        |
	
	* Закрыть все окна
		И я закрываю все окна клиентского приложения	

Сценарий: 04.08 Проверяем факт оплаты в Отчете по лимитам
	* Сформировать отчет по БДДС за 2024
		И Я формирую Отчет по лимитам по виду бюджета 'БДДС' за период с "01.01.2024" по  "31.12.2024" в валюте 'RUB'	
		И Я добавляю отбор в Отчете по лимитам 'ЦФО' 'Равно' 'ВА - ЦФО 1 (АХО)'
        И я нажимаю на кнопку с именем 'СформироватьОтчет'
		И в табличном документе 'ОтчетТабличныйДокумент' ячейка с адресом 'R134C10' равна '$СуммаЗнО$'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Examples\ОтчетПоЛимитамФакт" по шаблону
		И Я закрываю окно 'Отчет по лимитам (период в строках)'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'
