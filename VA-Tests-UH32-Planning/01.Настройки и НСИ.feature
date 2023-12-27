﻿#language: ru

@tree

Функционал: 01.Первоначальные настройки и ввод НСИ

Как Администратор я хочу
Осуществить ввод первоначальных настроек планирования и ввод НСИ 

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 01.00 Определеняем тип приложения

	Пусть Инициализация переменных

Сценарий: 01.01 Настройка информационной базы

	* Настройка прав доступа
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Настройки пользователей и прав"
			Тогда открылось окно "Настройки пользователей и прав"
		Иначе			
			И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
			Тогда открылось окно "Настройки пользователей и прав"
			Если 'НЕ $$ЭтоPerform$$' Тогда
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоОтветственных'
		И я устанавливаю флаг с именем 'ИспользоватьГруппыПользователей'
		И я устанавливаю флаг с именем 'ОграничиватьДоступНаУровнеЗаписей'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Настройки пользователей и прав"
		Если '$$ЭтоPerform$$' Тогда
			* Включаем производительный режим работы
				И Я включаю производительный режим работы ограничений на уровне записей
		Иначе
			* Включаем стандартный режим работы
				И из выпадающего списка с именем 'ОграничиватьДоступНаУровнеЗаписейУниверсально' я выбираю точное значение "Стандартный"
				Если открылось окно "1С:Предприятие" Тогда
					И я нажимаю на кнопку с именем 'Button0'

	* Настройка даты запрета редактирования
		Тогда открылось окно "Настройки пользователей и прав"
		И я разворачиваю группу с именем 'ГруппаПерсональныеНастройкиПользователей'
		И я разворачиваю группу с именем 'ГруппаДатыЗапретаИзменения'
		И я устанавливаю флаг с именем 'ИспользоватьДатыЗапретаИзменения'
		И я нажимаю на кнопку с именем 'НастроитьДатыЗапретаИзменения'
		Тогда открылось окно "Даты запрета изменения данных"
		И в поле с именем 'ДатаЗапретаПростойРежим' я ввожу текст '31.12.2000'
		И я перехожу к закладке с именем 'ГруппаРасширенныеВозможности'
		И из выпадающего списка с именем 'СпособУказанияДатыЗапрета' я выбираю точное значение "Общая дата"
		И Я закрываю окно "Даты запрета изменения данных"
		И я закрываю окно "Настройки пользователей и прав"

	* Настройка программы
		Если '$$ЭтоЕРПУХ$$' Тогда
			* Предприятие
				И В командном интерфейсе я выбираю "НСИ и администрирование" "Предприятие"
				Тогда открылось окно "Предприятие"
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоОрганизаций'
				И я разворачиваю группу с именем 'ГруппаНастройкиВалют'
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоВалют'
				Тогда открылось окно "Предприятие"
				И Я закрываю окно "Предприятие"
			* CRM и маркетинг
				И В командном интерфейсе я выбираю "НСИ и администрирование" "CRM и маркетинг"
				Тогда открылось окно "CRM и маркетинг"
				И я разворачиваю группу с именем "ГруппаНастройкиCRM"
				И я устанавливаю флаг с именем 'ИспользоватьПартнеровИКонтрагентов'								
				И я разворачиваю группу с именем 'ГруппаМаркетинг'
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоВидовЦен'
				Тогда открылось окно "CRM и маркетинг"	
				И Я закрываю окно "CRM и маркетинг"	
			* Склад и доставка
				И В командном интерфейсе я выбираю "НСИ и администрирование" "Склад и доставка"
				Тогда открылось окно "Склад и доставка"
				И я устанавливаю флаг с именем 'ИспользоватьНесколькоСкладов'
				Тогда открылось окно "Склад и доставка"
				И Я закрываю окно "Склад и доставка"																

		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Администрирование' 'Функциональность'
			Тогда открылось окно 'Функциональность программы'
			И в таблице "СписокРазделов" я перехожу к строке:
				| 'Представление' |
				| 'Организация'   |
			И в таблице "СписокРазделов" я активизирую поле с именем "СписокРазделовПредставление"
			И я устанавливаю флаг с именем 'ВестиУчетПоОрганизациям'
					
					
	И Я создаю единицу измерения с кодом '796' если ее нет, наименование "шт", наименование полное "Штука"

	* Установка констант и ФО
		И Я устанавливаю в константу 'ИспользоватьРежимТрассировкиПересчетаПоказателей' значение 'Истина'
		Если '$$ЭтоЕРПУХ$$' Тогда
			И Я устанавливаю в константу 'ИспользоватьТоварныеКатегории' значение 'Истина'	

	* Добавим валюты, если их нет
		* RUB
			И Я создаю валюту с цифровым кодом '643' символьным кодом 'RUB' и наименованием "Российский рубль" если ее нет
	
	* Устанавливаем валюту регламентированного учета для ЕРПУХ
		Если '$$ЭтоУХ$$' Тогда
			Если '$$ЭтоPerform$$' Тогда
				И В командном интерфейсе я выбираю "Учет по МСФО" "Настройки МСФО"
				Тогда открылось окно "Настройки МСФО"
				И я разворачиваю группу с именем 'ГруппаЗначенияПоУмолчанию'								
				И из выпадающего списка с именем 'ВалютаУправленческогоУчета' я выбираю точное значение 'RUB'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Настройки МСФО *" в течение 20 секунд							
			Иначе
				И я выполняю код встроенного языка на сервере без контекста
				"""bsl
					Константы.ВалютаУправленческогоУчета.Установить(Справочники.Валюты.НайтиПоКоду("643"));
				"""	
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "НСИ и администрирование" "Предприятие"
			Тогда открылось окно "Предприятие"
			И я разворачиваю группу с именем 'ГруппаНастройкиВалют'
			И из выпадающего списка с именем 'ВалютаУправленческогоУчета' я выбираю точное значение 'RUB'
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Предприятие"			
			И Я закрываю окно "Предприятие"

	Если '$$ЭтоPerform$$' Тогда
		И Я создаю страну с кодом1 '643' кодом2 'RU' кодом3 'RUS' именем1 "РОССИЯ" именем2 "Российская Федерация" именем3 "The Russian Federation" если ее нет в 1C:CPMWE

	* Отключаем работу с новостями
		Если '$$ЭтоЕРПУХ$$' Тогда
			И я устанавливаю в константу 'РазрешенаРаботаСНовостями' значение 'Ложь'
			И я устанавливаю в константу 'РазрешенаРаботаСНовостямиЧерезИнтернет' значение 'Ложь'

	* Отключаем ненужные контроли
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Виды контроля документов'
		Тогда открылось окно 'Виды контроля документов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                       |
			| 'Контроль задолженности по договору' |
		И в таблице "Список" я активизирую поле с именем "Наименование"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Контроль задолженности по договору (Вид контроля документов)'
		И из выпадающего списка с именем "РежимКонтроля" я выбираю точное значение 'Не контролировать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Контроль задолженности по договору (Вид контроля документов) *' в течение 20 секунд
		Тогда открылось окно 'Виды контроля документов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                          |
			| 'Контроль задолженности по контрагенту' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Контроль задолженности по контрагенту (Вид контроля документов)'
		И из выпадающего списка с именем "РежимКонтроля" я выбираю точное значение 'Не контролировать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Контроль задолженности по контрагенту (Вид контроля документов) *' в течение 20 секунд
		Тогда открылось окно 'Виды контроля документов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                            |
			| 'Контроль подтвержденного объема закупок' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Контроль подтвержденного объема закупок (Вид контроля документов)'
		И из выпадающего списка с именем "РежимКонтроля" я выбираю точное значение 'Не контролировать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Контроль подтвержденного объема закупок (Вид контроля документов) *' в течение 20 секунд
		Тогда открылось окно 'Виды контроля документов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                  |
			| 'Контроль расходов по договору' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Контроль расходов по договору (Вид контроля документов)'
		И из выпадающего списка с именем "РежимКонтроля" я выбираю точное значение 'Не контролировать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Контроль расходов по договору (Вид контроля документов) *' в течение 20 секунд
								
Сценарий: 01.02 Создание НСИ

	* Статья ДДС
		И Я создаю группу статей ДДС с именем 'Группа автотест БДДС'
		И Я создаю статью ДДС с именем 'Статья автотест БДДС' родителем 'Группа автотест БДДС'
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Статьи движения денежных средств'
		Тогда открылось окно 'Статьи движения денежных средств'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Статья автотест БДДС'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Статьи движения денежных средств'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Статья автотест БДДС (Статья движения денежных средств)'
		И в таблице "ВидыАналитик" я активизирую поле с именем "ВидыАналитикВидАналитики"
		И в таблице "ВидыАналитик" я выбираю текущую строку
		И в таблице "ВидыАналитик" из выпадающего списка с именем "ВидыАналитикВидАналитики" я выбираю по строке 'УХ00000160'
		И в таблице "ВидыАналитик" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Статья автотест БДДС (Статья движения денежных средств) *' в течение 20 секунд	
	
	* Статья ДиР		
		И Я создаю группу статей ДиР с именем 'Группа автотест БДР'
		И Я создаю статью ДиР с именем 'Статья автотест БДР' родителем 'Группа автотест БДР'
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Статьи доходов и расходов'
		Тогда открылось окно 'Статьи доходов и расходов'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Статья автотест БДР'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Статья автотест БДР (Статья доходов и расходов)'
		И в таблице "ВидыАналитик" я активизирую поле с именем "ВидыАналитикВидАналитики"
		И в таблице "ВидыАналитик" я выбираю текущую строку
		И в таблице "ВидыАналитик" из выпадающего списка с именем "ВидыАналитикВидАналитики" я выбираю по строке 'НГ00000000'
		И в таблице "ВидыАналитик" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Статья автотест БДР (Статья доходов и расходов) *' в течение 20 секунд

	Если '$$ЭтоУХ$$' Тогда
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		Тогда открылось окно 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Организация'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
		И я нажимаю на кнопку с именем 'Find'								
		И для каждой строки таблицы "Список" я выполняю
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
		И Я закрываю окно 'Заявки на оплату'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда 	
		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		Тогда открылось окно 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Получатель'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'Автотест Контрагент'
		И я нажимаю на кнопку с именем 'Find'								
		И для каждой строки таблицы "Список" я выполняю
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
		И Я закрываю окно 'Заявки на оплату'

	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Операционные планы'
	Тогда открылось окно 'Операционные планы'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
	Тогда открылось окно 'Найти'
	И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'ЦФО'
	И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
	И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
	И я нажимаю на кнопку с именем 'Find'
	И для каждой строки таблицы "Список" я выполняю
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
	И Я закрываю окно 'Операционные планы'

	И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'	
	Тогда открылось окно 'Резервирования планов и лимитов'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
	Тогда открылось окно 'Найти'
	И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'ЦФО'
	И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
	И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
	И я нажимаю на кнопку с именем 'Find'
	И для каждой строки таблицы "Список" я выполняю
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
	И Я закрываю окно 'Резервирования планов и лимитов'

	И Я создаю проект с именем 'Автотест проект'
	И Я создаю организацию с именем 'Автотест Организация' типом 'ВыбратьРФ' видом 'ВыбратьЮЛ' налогооблажением 'СистемаНалогообложенияУСНДоходыЮЛ'

	Если '$$ЭтоЕРПУХ$$' Тогда
		И Я для организации 'Автотест Организация' создаю подразделение с именем 'Автотест Подразделение' в 1C:ERPУХ

	Если '$$ЭтоУХ$$' Тогда
		И Я создаю вид номенклатуры с именем 'Товары'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Я создаю вид номенклатуры с именем 'Товары' тип 'Товар' в 1C:ERPУХ

	* Номенклатура 
		* Открываем список 
			Если '$$ЭтоPerform$$' Тогда
				И В командном интерфейсе я выбираю "Главное" "Номенклатура"		
			ИначеЕсли '$$ЭтоУХ$$' Тогда
				И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И В командном интерфейсе я выбираю "Главное" "Номенклатура"
				И я снимаю флаг с именем 'ИспользоватьФильтры'		
			Тогда открылось окно "Номенклатура"

		* Удаляем текущий элемент
			Если '$$ЭтоУХ$$' Тогда
				И Я в списке "Номенклатура" по полю "Наименование" ищу элемент 'Автотест номенклатура' "По началу строки"		
				И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
					И в таблице 'Список' я выбираю текущую строку
					И Я удаляю текущий элемент в окне "* (Номенклатура)" очищая 'Артикул'
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И пауза 1
				И я нажимаю кнопку очистить у поля с именем 'СтрокаПоискаНоменклатура'					
				И в поле с именем 'СтрокаПоискаНоменклатура' я ввожу текст 'Автотест номенклатура'
				И я нажимаю на кнопку с именем 'Найти'				
				Если появилось окно с заголовком 'Поиск' в течение 1 секунд Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "Номенклатура"
				И Пока в таблице 'СписокРасширенныйПоискНоменклатура' количество строк 'больше' 0 Тогда
					* Ставим пометку на удаление
						Если в таблице 'СписокРасширенныйПоискНоменклатура' текущая строка не помечена на удаление Тогда
							И я выбираю пункт контекстного меню с именем 'СписокРасширенныйПоискНоменклатураКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'СписокРасширенныйПоискНоменклатура'
							Тогда открылось окно "1С:Предприятие"
							И я нажимаю на кнопку с именем 'Button0'
					* Переименовываем
						И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
						И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
						Когда открылось окно "* (Номенклатура)"
						И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
						Если появилось окно с заголовком 'Полезный совет' в течение 1 секунд Тогда
							И я нажимаю на кнопку с именем 'Button0'
						Когда открылось окно "* (Номенклатура)"								
						Тогда в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
						И в поле с именем 'Артикул' я ввожу текст ' '	
						И я нажимаю на кнопку с именем 'ЗаполнитьНаименованиеДляПечатиПоШаблону'
						И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
						И я жду закрытия окна "* (Номенклатура)" в течение 20 секунд
						Если появилось окно с заголовком 'Поиск' в течение 1 секунд Тогда
							И я нажимаю на кнопку с именем 'Button0'

		* Создаем новый элемент
			Когда открылось окно "Номенклатура"
			Если '$$ЭтоУХ$$' Тогда			
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Номенклатура (создание)"
				И в поле с именем 'Наименование' я ввожу текст 'Автотест номенклатура'
				И в поле с именем 'Артикул' я ввожу текст '123'
				И из выпадающего списка с именем 'ЕдиницаИзмерения' я выбираю по строке "шт"
				Если 'НЕ $$ЭтоPerform$$' Тогда
					И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'Товары'
			ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
				И я нажимаю на кнопку с именем 'СписокРасширенныйПоискНоменклатураСоздать'
				Тогда открылось окно "Номенклатура (создание)"
				И из выпадающего списка с именем 'ВидНоменклатурыОбязательныеПоля' я выбираю по строке 'Товары'
				И я меняю значение переключателя с именем 'НастройкаВидимостиФормы' на 'Показать все'
				И в поле с именем 'Наименование' я ввожу текст 'Автотест номенклатура'
				И в поле с именем 'Артикул' я ввожу текст '123'	
				Когда открылось окно 'Номенклатура (создание) *'
				И из выпадающего списка с именем "ЕдиницаИзмерения" я выбираю по строке 'шт'			
									
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Номенклатура (создание) *" в течение 20 секунд

		* Закрываем список
			Когда открылось окно "Номенклатура"
			Если '$$ЭтоЕРПУХ$$' Тогда
				И я устанавливаю флаг с именем 'ИспользоватьФильтры'
			И Я закрываю окно "Номенклатура"	
	
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю группу контрагентов с именем 'Клиенты'
		И Я создаю контрагента с именем 'Автотест контрагент' родителем 'Клиенты' страной регистрации 'РОССИЯ'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда					
		И Я создаю партнера с именем 'Автотест контрагент' тип 'Поставщик' в 1C:ERPУХ
		И Для партнера 'Автотест контрагент' я создаю контрагента с именем 'Автотест контрагент' вид 'Юридическое лицо' в 1C:ERPУХ

	И Я создаю условие оплаты с именем 'Автотест условие оплаты'
	Если '$$ЭтоУХ$$' Тогда
		И Я создаю договор для контрагента 'Автотест контрагент' номер '12345' дата '01.01.2023' валюта 'RUB' организация 'Автотест Организация' вид 'С поставщиком' сумма '500000' условие оплаты 'Автотест условие оплаты'
		И Я создаю договор для контрагента 'Автотест контрагент' номер '56789' дата '01.01.2023' валюта 'RUB' организация 'Автотест Организация' вид 'С поставщиком' сумма '500000' условие оплаты 'Автотест условие оплаты'
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Для партнера 'Автотест контрагент' контрагента 'Автотест контрагент' я создаю договор с видом 'С поставщиком' номер '12345' от '01.01.2023' организация 'Автотест Организация' валюта 'RUB' сумма '500000' соглашение 'Соглашение' в 1C:ERPУХ
		И Для партнера 'Автотест контрагент' контрагента 'Автотест контрагент' я создаю договор с видом 'С поставщиком' номер '56789' от '01.01.2023' организация 'Автотест Организация' валюта 'RUB' сумма '500000' соглашение 'Соглашение' в 1C:ERPУХ

	Если '$$ЭтоУХ$$' Тогда
		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Банки'
		Тогда открылось окно 'Банки'
		И в таблице "Список" я активизирую поле с именем "Код"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст '047567567'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'Список' количество строк 'равно' 0 Тогда			
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button1'
			Тогда открылось окно 'Банк (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Автотест банк организации'
			И из выпадающего списка с именем "Страна" я выбираю по строке 'Россия'
			И в поле с именем 'Код' я ввожу текст '047567567'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банк (создание) *' в течение 20 секунд
		И Я закрываю окно 'Банки'
					

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Банки'
		Тогда открылось окно 'Банки'
		И в таблице "Список" я активизирую поле с именем "Код"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст '044525148'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'Список' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button1'
			Тогда открылось окно 'Банк (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Автотест банк контрагента'
			И из выпадающего списка с именем "Страна" я выбираю по строке 'Россия'
			И в поле с именем 'Код' я ввожу текст '044525148'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банк (создание) *' в течение 20 секунд
		И Я закрываю окно 'Банки'	
				
Сценарий: 01.03 Создание БС Организации

	* Создание элемента
		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Организационные единицы"
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "Список" я выбираю текущую строку
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'	
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно 'Банковский счет (создание)'
			И из выпадающего списка с именем "Банк" я выбираю по строке '047567567'
			И я перехожу к следующему реквизиту
			И в поле с именем 'НомерСчета' я ввожу текст '40700810000000000011'
			И я нажимаю на кнопку с именем 'ФормаКомандаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд
		Если '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Организации"
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "Список" я выбираю текущую строку
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'	
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
			Тогда открылось окно 'Банковский счет организации (создание)'
			И в поле с именем 'НомерСчета' я ввожу текст '40700810000000000011'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет организации (создание) *' в течение 20 секунд					

Сценарий: 01.04 Создание БС Контрагента

	* Создание элемента
		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Справочники' 'Контрагенты'
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест контрагент'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Контрагенты'
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Автотест контрагент (Контрагент)'
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
			И я нажимаю на кнопку с именем 'Создать'
			Тогда открылось окно 'Банковский счет (создание)'
			И из выпадающего списка с именем "Банк" я выбираю по строке '044525148'
			И в поле с именем 'НомерСчета' я ввожу текст '40701810200010000027'
			И я нажимаю на кнопку с именем 'ФормаКомандаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Контрагенты'	
			Когда открылось окно 'Контрагенты (юридические или физические лица)'
			Когда открылось окно 'Контрагенты (юридические или физические лица)'
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'			
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест контрагент'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Контрагенты (юридические или физические лица)'
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Автотест контрагент (Контрагент (юридическое или физическое лицо)'
			И В текущем окне я нажимаю кнопку командного интерфейса 'Банковские счета'
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Банковский счет (создание)'
			И в поле с именем 'НомерСчета' я ввожу текст '40701810200010000027'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Банковский счет (создание) *' в течение 20 секунд							
												
Сценарий: 01.05 Создание варианта настроек БДДС

	* Удаление элемента
		
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда открылось окно 'Управление планами и лимитами'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ВариантыНастроек'
		Тогда открылось окно 'Варианты настроек операционного плана'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Автотест БДДС'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Варианты настроек операционного плана'
		И пока в таблице "Список" количество строк ">" 0 Тогда
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Автотест БДДС (Вариант настройки операционного плана)'
			И в поле с именем 'Наименование' я ввожу текст 'Удалить'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Автотест БДДС (Вариант настройки операционного плана) *' в течение 20 секунд			
		И Я закрываю окно 'Варианты настроек операционного плана'

	* Создание элемента
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда открылось окно 'Управление планами и лимитами'
		И из выпадающего списка с именем "СпособОпределенияВалютыЛимитирования" я выбираю точное значение 'В валюте операции'	
		И из выпадающего списка с именем "ПериодичностьПланирования" я выбираю точное значение 'Месяц'
		И из выпадающего списка с именем "ПериодичностьЛимитирования" я выбираю точное значение 'Месяц'		
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'УстановитьВидБюджетаБюджетДвиженияДенежныхСредств'
		И я нажимаю на кнопку с именем 'ВариантыНастроек'
		Тогда открылось окно 'Варианты настроек операционного плана'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Вариант настройки операционного плана (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Автотест БДДС'
		И я перехожу к закладке с именем "СтраницаГоризонтПланирования"
		И в поле с именем 'КоличествоПериодов' я ввожу текст '12'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Вариант настройки операционного плана (создание) *' в течение 20 секунд
													
	* Проверка заполнения
		Когда открылось окно 'Варианты настроек операционного плана'
		И в таблице "Список" я выбираю текущую строку
		Тогда элемент формы с именем "ВидБюджета" стал равен 'Бюджет движения денежных средств'
		И элемент формы с именем "ВидГоризонта" стал равен 'Скользящий'
		И элемент формы с именем "КолвоПослеЗапятой" стал равен '3'
		И элемент формы с именем "КолвоПослеЗапятойВвод" стал равен '3'
		И элемент формы с именем "КолвоРазрядность" стал равен 'Единицы'
		И элемент формы с именем "КолвоРазрядностьВвод" стал равен 'Единицы'
		И элемент формы с именем "КоличествоПериодов" стал равен '12'
		И элемент формы с именем "Наименование" стал равен 'Автотест БДДС'
		И таблица "НастройкаАналитик" стала равной:
			| 'N'  | 'Аналитика'            | 'Значение аналитики' | 'Использование' | 'Группа' | 'Обязательно' | 'Возможно лимитирование' |
			| '1'  | 'Вид бюджета'          | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '2'  | 'Период'               | ''                   | 'В колонке'     | ''       | 'Да'          | 'Да'                     |
			| '3'  | 'Валюта'               | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '4'  | 'ЦФО'                  | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '5'  | 'Проект'               | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Да'                     |
			| '6'  | 'Направление операции' | 'Расход'             | 'В шапке'       | ''       | 'Да'          | 'Нет'                    |
			| '7'  | 'Статья бюджета'       | ''                   | 'В строке'      | 'Г1'     | 'Да'          | 'Да'                     |
			| '8'  | 'Аналитика1'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '9'  | 'Аналитика2'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '10' | 'Аналитика3'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '11' | 'Аналитика4'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '12' | 'Аналитика5'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '13' | 'Аналитика6'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '14' | 'Контрагент'           | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Нет'                    |
			| '15' | 'Договор контрагента'  | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Нет'                    |
		
		И элемент формы с именем "НеИспользовать" стал равен 'Нет'
		И элемент формы с именем "ПВХ" стал равен ''
		И элемент формы с именем "ПериодичностьОперативногоПланирования" стал равен 'Месяц'
		И элемент формы с именем "СуммаПослеЗапятой" стал равен '2'
		И элемент формы с именем "СуммаПослеЗапятойВвод" стал равен '2'
		И элемент формы с именем "СуммаРазрядность" стал равен 'Единицы'
		И элемент формы с именем "СуммаРазрядностьВвод" стал равен 'Единицы'
											

						
