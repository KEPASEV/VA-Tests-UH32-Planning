﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для управлением НСИ - Статьи доходов и расходов

Как Тестировщик я хочу
иметь экспортные сценарии по статьям ДДС
чтобы было проще писать и поддерживать тесты

Контекст:
	   И Я запускаю сценарий открытия TestClient или подключаю уже существующий
	   И я закрываю все окна клиентского приложения

Сценарий: Я создаю группу статей ДиР с именем 'TheNameGroup'

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДоходовИРасходов'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи доходов и расходов"
	
	* Удаляем группу

		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу элемент '[TheNameGroup]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheNameGroup] (Статьи доходов и расходов)" очищая

	* Создаем группу
		Тогда открылось окно "Статьи доходов и расходов"
		И я нажимаю на кнопку с именем 'ФормаСоздатьГруппу'
		Тогда открылось окно "Статьи доходов и расходов (создание группы)"
		И в поле с именем 'Наименование' я ввожу текст '[TheNameGroup]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Статьи доходов и расходов (создание группы) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Статьи доходов и расходов"
		И Я закрываю окно "Статьи доходов и расходов"

Сценарий: Я создаю статью ДиР с именем 'TheName' родителем 'TheNameGroup'

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДоходовИРасходов'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи доходов и расходов"
	
	* Удаляем элемент
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheName] (Статья доходов и расходов)" очищая

	* Создаем элемент
		Тогда открылось окно "Статьи доходов и расходов"'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Статья доходов и расходов (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И из выпадающего списка с именем 'Родитель' я выбираю по строке '[TheNameGroup]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Статья доходов и расходов (создание) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Статьи доходов и расходов"'
		И Я закрываю окно "Статьи доходов и расходов"'

Сценарий: Я для статьи ДиР с именем 'TheName' определяю группу раскрытия 'TheAnalyticsGroup'
	
	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДоходовИРасходов'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи доходов и расходов"

	* Находим и заполняем элемент
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '[TheName] (Статья доходов и расходов)'
		Если элемент формы с именем "ГруппаРаскрытия" стал равен '[TheAnalyticsGroup]' тогда
			И я жду закрытия окна '[TheName] (Статья доходов и расходов) *' в течение 20 секунд
		Иначе 
			И я меняю значение переключателя с именем 'ГруппаРаскрытияПереключатель' на '1'
			И из выпадающего списка с именем "ГруппаРаскрытия" я выбираю по строке '[TheAnalyticsGroup]'
			
	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья доходов и расходов) *' в течение 20 секунд
		И Я закрываю окно "Статьи доходов и расходов"'

Сценарий: Я для статьи ДиР с именем 'TheName' определяю виды аналитики 'TheAnalytics1', 'TheAnalytics2', 'TheAnalytics3', 'TheAnalytics4', 'TheAnalytics5', 'TheAnalytics6'
	
	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДоходовИРасходов'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи доходов и расходов"

	* Находим и заполняем элемент
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '[TheName] (Статья доходов и расходов)'

		Если элемент формы с именем "ГруппаРаскрытия" стал равен '' тогда
			И Я заполняю виды аналитики 'TheAnalytics1', 'TheAnalytics2', 'TheAnalytics3', 'TheAnalytics4', 'TheAnalytics5', 'TheAnalytics6'
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Иначе 
			И я жду закрытия окна '[TheName] (Статья доходов и расходов) *' в течение 20 секунд

	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья доходов и расходов) *' в течение 20 секунд
		И Я закрываю окно "Статьи доходов и расходов"'

Сценарий: Я для статьи ДиР с именем 'TheName' определяю тип движения статьи 'TheTypeDirection'
	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И я открываю основную форму списка справочника 'СтатьиДоходовИРасходов'
		Иначе
			И В командном интерфейсе я выбираю "Планирование и контроль" "Статьи доходов и расходов"

	* Находим и заполняем элемент
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И в таблице "Список" я выбираю текущую строку
		И я меняю значение переключателя с именем 'ПриходРасход' на '[TheTypeDirection]'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
	
	* Закрываем форму элемента
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '[TheName] (Статья доходов и расходов) *' в течение 20 секунд
		И Я закрываю окно "Статьи доходов и расходов"'

