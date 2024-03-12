﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для управлением НСИ - Статьи движения денежных средств

Как Тестировщик я хочу
иметь экспортные сценарии по статьям ДДС
чтобы было проще писать и поддерживать тесты

Контекст:
	   И Я запускаю сценарий открытия TestClient или подключаю уже существующий
	   И я закрываю все окна клиентского приложения

Сценарий: Я создаю группу статей ДДС с именем 'TheNameGroup'	

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДвиженияДенежныхСредств'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи движения денежных средств"

	* Удаляем элемент	
		И Я в списке "Статьи движения денежных средств" по полю "Наименование" ищу элемент '[TheNameGroup]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheNameGroup] (Статьи движения денежных средств)" очищая

	* Создаем элемент
		Тогда открылось окно "Статьи движения денежных средств"
		И я нажимаю на кнопку с именем 'ФормаСоздатьГруппу'
		Тогда открылось окно "Статьи движения денежных средств (создание группы)"
		И в поле с именем 'Наименование' я ввожу текст '[TheNameGroup]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Статьи движения денежных средств (создание группы) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Статьи движения денежных средств"
		И Я закрываю окно "Статьи движения денежных средств"

Сценарий: Я создаю статью ДДС с именем 'TheName' родителем 'TheNameGroup'

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДвиженияДенежныхСредств'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи движения денежных средств"
	
	* Удаляем элемент
		И Я в списке "Статьи движения денежных средств" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheName] (Статья движения денежных средств)" очищая
		
	* Создаем элемент
		Когда открылось окно "Статьи движения денежных средств"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Статья движения денежных средств (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И из выпадающего списка с именем 'Родитель' я выбираю по строке '[TheNameGroup]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Статья движения денежных средств (создание) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Статьи движения денежных средств"
		И Я закрываю окно "Статьи движения денежных средств"	

Сценарий: Я для статьи ДДС с именем 'TheName' определяю группу раскрытия 'TheAnalyticsGroup'
	
	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДвиженияДенежныхСредств'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи движения денежных средств"

	* Находим и заполняем элемент
		И Я в списке "Статьи движения денежных средств" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '[TheName] (Статья движения денежных средств)'
		Если элемент формы с именем "ГруппаРаскрытия" стал равен '[TheAnalyticsGroup]' тогда
			И я жду закрытия окна '[TheName] (Статья движения денежных средств) *' в течение 20 секунд
		Иначе 
			И я меняю значение переключателя с именем 'ГруппаРаскрытияПереключатель' на ' '
			И из выпадающего списка с именем "ГруппаРаскрытия" я выбираю по строке '[TheAnalyticsGroup]'	
			
	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья движения денежных средств) *' в течение 20 секунд
		И Я закрываю окно "Статьи движения денежных средств"

Сценарий: Я для статьи ДДС с именем 'TheName' определяю виды аналитики 'TheAnalytics1', 'TheAnalytics2', 'TheAnalytics3', 'TheAnalytics4', 'TheAnalytics5', 'TheAnalytics6'
	
	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДвиженияДенежныхСредств'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи движения денежных средств"

	* Находим и заполняем элемент
		И Я в списке "Статьи движения денежных средств" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '[TheName] (Статья движения денежных средств)'

		Если элемент формы с именем "ГруппаРаскрытия" стал равен '' тогда
			И Я заполняю виды аналитики 'TheAnalytics1', 'TheAnalytics2', 'TheAnalytics3', 'TheAnalytics4', 'TheAnalytics5', 'TheAnalytics6'
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Иначе 
			И я жду закрытия окна '[TheName] (Статья движения денежных средств) *' в течение 20 секунд
	
	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья движения денежных средств) *' в течение 20 секунд
		И Я закрываю окно "Статьи движения денежных средств"

Сценарий: Я для статьи ДДС с именем 'TheName' определяю тип движения статьи 'TheTypeDirection'

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДвиженияДенежныхСредств'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи движения денежных средств"

	* Находим и заполняем элемент
		И Я в списке "Статьи движения денежных средств" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		И я меняю значение переключателя с именем 'ПриходРасход' на '[TheTypeDirection]'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
			
	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья движения денежных средств) *' в течение 20 секунд
		И Я закрываю окно "Статьи движения денежных средств"

Сценарий: Я для статьи ДДС с именем 'TheName' устанавливаю контрольные аналитики по виду аналитики 'TheAnalytics1', 'TheAnalytics2', 'TheAnalytics3', 'TheAnalytics4', 'TheAnalytics5', 'TheAnalytics6'
	
	* Открываем форму АРМ Управление лимитами
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда элемент формы с именем "ВидБюджета" стал равен 'Бюджет движения денежных средств'				
		И я перехожу к закладке с именем "НастройкиЛимитированияСтатейБюджета"			

	* Находим статью АРМ Управление лимитами
		И Я в таблице статей "СписокСтатей" по полю "Статья бюджета" ищу и выбираю элемент '[TheName]' "По точному совпадению"

		Если 'НЕ ПустаяСтрока("[TheAnalytics1]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику1"
			И в таблице "СписокСтатей" я выбираю текущую строку
		Если 'НЕ ПустаяСтрока("[TheAnalytics2]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику2"
			И в таблице "СписокСтатей" я выбираю текущую строку
		Если 'НЕ ПустаяСтрока("[TheAnalytics3]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику3"
			И в таблице "СписокСтатей" я выбираю текущую строку
		Если 'НЕ ПустаяСтрока("[TheAnalytics4]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику4"
			И в таблице "СписокСтатей" я выбираю текущую строку
		Если 'НЕ ПустаяСтрока("[TheAnalytics5]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику5"
			И в таблице "СписокСтатей" я выбираю текущую строку
		Если 'НЕ ПустаяСтрока("[TheAnalytics6]")' Тогда
			И в таблице "СписокСтатей" я активизирую поле с именем "СписокСтатейКонтролироватьАналитику6"
			И в таблице "СписокСтатей" я выбираю текущую строку
			
	* Закрываем форму АРМ Управление лимитами
		И Я закрываю окно 'Управление планами и лимитами'
				