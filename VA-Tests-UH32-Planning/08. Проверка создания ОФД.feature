﻿#language: ru

@tree

Функционал: 08. Проверить создание ОФД

Как Администратор я хочу
создать и провести документы движения денежных средств и документы поступления и реализации
чтобы проверить, что автоматически создается документ Отражение фактических данных  

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Переменные:
	ВАПроект = 'ВА - Проект 1'
	ВАЦФО = 'ВА - ЦФО 4 (ДП)'
	ВАСтатья = 'ВА - Статья 4'
	ВАОрганизация = 'ВА - ООО Тест'

Сценарий: 08.00 Определеняем тип приложения

	Пусть Инициализация переменных			

Сценарий: 08.01 Поступление на расчетный счет
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Банк и касса' 'Банковские выписки'
		Тогда открылось окно 'Банковские выписки'
		И я нажимаю на кнопку с именем 'ФормаСоздатьПоступлениеНаРасчетныйСчет'
		Тогда открылось окно 'Поступление на расчетный счет (создание)'
		
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Покупатель1'
		И в поле с именем 'СуммаДокумента' я ввожу текст '1 000,00'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаДоговорКонтрагента"
		И в таблице "РасшифровкаПлатежа" я выбираю текущую строку
		И в таблице "РасшифровкаПлатежа" из выпадающего списка с именем "РасшифровкаПлатежаДоговорКонтрагента" я выбираю по строке 'Без договора'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаЦФО"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаПроект"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И я запоминаю значение поля с именем 'РасшифровкаПлатежаДокументПланирования' таблицы 'РасшифровкаПлатежа' как 'ДокПланирования'		
		И в таблице "РасшифровкаПлатежа" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' как '$Сумма$'

        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'		
        И я жду закрытия окна 'Поступление на расчетный счет *' в течение 20 секунд
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Поступление на расчетный счет"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД

Сценарий: 08.02 Списание с расчетного счета
	
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Банк и касса' 'Банковские выписки'
		Тогда открылось окно 'Банковские выписки'
		И я нажимаю на кнопку с именем 'ФормаСоздатьСписаниеСРасчетногоСчета'
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Поставщик1'
		И в поле с именем 'СуммаДокумента' я ввожу текст '1 000,00'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаДоговорКонтрагента"
		И в таблице "РасшифровкаПлатежа" я выбираю текущую строку
		И в таблице "РасшифровкаПлатежа" из выпадающего списка с именем "РасшифровкаПлатежаДоговорКонтрагента" я выбираю по строке 'Без договора'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаЦФО"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаПроект"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И я запоминаю значение поля с именем 'РасшифровкаПлатежаДокументПланирования' таблицы 'РасшифровкаПлатежа' как 'ДокПланирования'		
		И в таблице "РасшифровкаПлатежа" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' как '$Сумма$'

        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'		
        И я жду закрытия окна 'Списание с расчетного счета *' в течение 20 секунд
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Списание с расчетного счета"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД			
			
Сценарий: 08.03 Поступление наличных
	
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Банк и касса' 'Кассовые документы'
		Тогда открылось окно 'Кассовые документы'
		И я нажимаю на кнопку с именем 'СоздатьПриходныйКассовыйОрдер'
		Тогда открылось окно 'Поступление наличных (создание)'
		
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Покупатель1'
		И в поле с именем 'СуммаДокумента' я ввожу текст '1 000,00'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаДоговорКонтрагента"
		И в таблице "РасшифровкаПлатежа" я выбираю текущую строку
		И в таблице "РасшифровкаПлатежа" из выпадающего списка с именем "РасшифровкаПлатежаДоговорКонтрагента" я выбираю по строке 'Без договора'
		И я перехожу к следующему реквизиту				
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаЦФО"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаПроект"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И я запоминаю значение поля с именем 'РасшифровкаПлатежаДокументПланирования' таблицы 'РасшифровкаПлатежа' как 'ДокПланирования'		
		И в таблице "РасшифровкаПлатежа" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' как '$Сумма$'

        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'		
        И я жду закрытия окна 'Поступление наличных *' в течение 20 секунд
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Поступление наличных"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД		

Сценарий: 08.04 Выдача наличных
	
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Банк и касса' 'Кассовые документы'
		Тогда открылось окно 'Кассовые документы'
		И я нажимаю на кнопку с именем 'СоздатьРасходныйКассовыйОрдер'
		Тогда открылось окно 'Выдача наличных (создание)'
		
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Поставщик1'
		И в поле с именем 'СуммаДокумента' я ввожу текст '1 000,00'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаДоговорКонтрагента"
		И в таблице "РасшифровкаПлатежа" я выбираю текущую строку
		И в таблице "РасшифровкаПлатежа" из выпадающего списка с именем "РасшифровкаПлатежаДоговорКонтрагента" я выбираю по строке 'Без договора'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаЦФО"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаПроект"
		И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И я запоминаю значение поля с именем 'РасшифровкаПлатежаДокументПланирования' таблицы 'РасшифровкаПлатежа' как 'ДокПланирования'		
		И в таблице "РасшифровкаПлатежа" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' как '$Сумма$'

        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'		
        И я жду закрытия окна 'Выдача наличных *' в течение 20 секунд
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Выдача наличных"
		И Я проверяю заполнение аналитик по виду бюджета 'БДДС' в ОФД
		И Я проверяю движения по виду бюджета 'БДДС' в ОФД		

Сценарий: 08.05 Поступление (акты, накладные, УПД)
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Покупки' 'Поступление (акты, накладные, УПД)'
		Тогда открылось окно 'Поступление (акты, накладные, УПД)'
		И я нажимаю на кнопку с именем 'СоздатьПоступлениеТовары'
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание)'
		
		И я устанавливаю флаг с именем 'УПД'
		И в поле с именем 'НомерВходящегоДокумента' я ввожу текст '1'
		И в поле с именем 'ДатаВходящегоДокумента' я ввожу значение выражения 'ТекущаяДата()'
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Поставщик1'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'		
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'		
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыНоменклатура'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю по строке 'ВА - Товар1'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,000'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 000,00'
		И в таблице "Товары" я завершаю редактирование строки
				
	* Создаем договор и заполнем аналитики планирования
		И я нажимаю на кнопку создать поля с именем "ДоговорКонтрагента"
		Тогда открылось окно 'Выберите вид договора'
		И Я в таблице 'ВидыДоговоров' по полю 'Вид договора' ищу значение 'С поставщиком' 
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'С поставщиком (создание)'
		И в поле с именем 'Номер' я ввожу текст '08.05'
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И в поле с именем "ОсновнойЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в поле с именем "ОсновнойПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И в поле с именем "СтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в поле с именем "ОсновнаяСтатьяИсполнение" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'С поставщиком (создание) *' в течение 20 секунд

		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '08.05'
		Если открылось окно '1С:Предприятие' тогда
			И я нажимаю на кнопку с именем 'Button1'
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'ДокПланирования'
		И в таблице "Товары" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Поступление товаров: Накладная, УПД *' в течение 20 секунд	
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' таблицы 'Список' как '$Сумма$'
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Поступление (акты, накладные, УПД)"
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

Сценарий: 08.06 Реализация (акты, накладные, УПД)
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Продажи' 'Реализация (акты, накладные, УПД)'
		Тогда открылось окно 'Реализация (акты, накладные, УПД)'
		И я нажимаю на кнопку с именем 'ФормаСоздатьРеализацияТовары'
		Тогда открылось окно 'Реализация товаров: Накладная, УПД (создание)'
		
		И я устанавливаю флаг с именем 'УПД'
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Покупатель1'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'		
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'		
		И в таблице 'Товары' я активизирую поле с именем 'ТоварыНоменклатура'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю по строке 'ВА - Товар1'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,000'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 000,00'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я активизирую поле с именем "ТоварыСтавкаНДС"
		И в таблице "Товары" из выпадающего списка с именем "ТоварыСтавкаНДС" я выбираю точное значение 'Без НДС'
		И в таблице "Товары" я завершаю редактирование строки
				
	* Создаем договор и заполнем аналитики планирования
		И я нажимаю на кнопку создать поля с именем "ДоговорКонтрагента"
		Тогда открылось окно 'Выберите вид договора'
		И Я в таблице 'ВидыДоговоров' по полю 'Вид договора' ищу значение 'С покупателем' 
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'С покупателем (создание)'
		И в поле с именем 'Номер' я ввожу текст '08.06'
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И в поле с именем "ОсновнойЦФО" я ввожу значение выражения 'ВАЦФО'
		И я перехожу к следующему реквизиту
		И в поле с именем "ОсновнойПроект" я ввожу значение выражения 'ВАПроект'
		И я перехожу к следующему реквизиту
		И в поле с именем "СтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И в поле с именем "ОсновнаяСтатьяИсполнение" я ввожу значение выражения 'ВАСтатья'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'С покупателем (создание) *' в течение 20 секунд

		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '08.06'
		И я перехожу к следующему реквизиту		
		Если открылось окно '1С:Предприятие' тогда
			И я нажимаю на кнопку с именем 'Button1'
		
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'ДокПланирования'
		И в таблице "Товары" я завершаю редактирование строки					

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Реализация товаров: Накладная, УПД *' в течение 20 секунд	
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' таблицы 'Список' как '$Сумма$'
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Реализация (акты, накладные, УПД)"
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

Сценарий: 08.07 Возврат товаров от покупателя
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Продажи' 'Возвраты от покупателей'
		Тогда открылось окно 'Возвраты товаров от покупателей'
		И я нажимаю на кнопку с именем 'ФормаСоздатьТовары'
		Тогда открылось окно 'Возврат: Товары (создание)'			
		
		И я устанавливаю флаг с именем 'УКД'
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Покупатель1'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'		
		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '08.06'	
		И я перехожу к следующему реквизиту
		
	* Заполняем по документу реализации
		И я нажимаю кнопку выбора у поля с именем "Сделка"		
		И Я в таблице '' по полю '' ищу значение 'Реализация (акт, накладная, УПД)' 
		И я нажимаю на кнопку 'ОК'
		И в таблице "Список" я выбираю текущую строку
	
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'ДокПланирования'				

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Возврат: Товары *' в течение 20 секунд	
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' таблицы 'Список' как '$Сумма$'
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Возврат товаров от покупателя"
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

Сценарий: 08.08 Возврат товаров поставщику
	* Создаем и заполняем документ
		И В командном интерфейсе я выбираю 'Покупки' 'Возвраты поставщикам'
		Тогда открылось окно 'Возвраты товаров поставщикам'
		И я нажимаю на кнопку с именем 'СоздатьПокупкаКомиссия'
		Тогда открылось окно 'Возврат товаров поставщику (создание) (Покупка, комиссия)'						
		
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И из выпадающего списка с именем "Контрагент" я выбираю по строке 'ВА - Поставщик1'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'ВА - Склад1'		
		И из выпадающего списка с именем "ДоговорКонтрагента" я выбираю по строке '08.05'	
		И я перехожу к следующему реквизиту
		
	* Заполняем по документу поступления
		И я нажимаю кнопку выбора у поля с именем "Сделка"		
		И Я в таблице '' по полю '' ищу значение 'Поступление (акт, накладная, УПД)' 
		И я нажимаю на кнопку 'ОК'
		И в таблице "Список" я выбираю текущую строку
	
		И я запоминаю значение поля с именем 'ДоговорКонтрагента' как 'ДокПланирования'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ЗаполнитьПоПоступлению'								

	* Проводим и закрываем документа
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И я удаляю переменную '$НомерДок$'
        И я запоминаю значение поля с именем 'Номер' как '$НомерДок$'
        И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Возврат товаров поставщику *' в течение 20 секунд	
		И я удаляю переменную '$Сумма$'
		И я запоминаю значение поля с именем 'СуммаДокумента' таблицы 'Список' как '$Сумма$'
    
	* Проверка создания ОФД
        И Я проверяю создание ОФД 1"Возврат товаров поставщику"
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД