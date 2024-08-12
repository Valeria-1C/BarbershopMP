﻿
&НаСервере
Процедура ЗаписатьсяНаСервере()
	
	ЗаписьКлиента = Документы.ЗаписьКлиента.СоздатьДокумент();
	ЗаписьКлиента.Дата = НачалоМинуты(Объект.ДатаЗаписи);
	ЗаписьКлиента.Сотрудник = Объект.Сотрудник;
	
	СтрокаУслуги = ЗаписьКлиента.Услуги.Добавить();
	СтрокаУслуги.Услуга = Объект.Услуга;
	СтрокаУслуги.Стоимость = ЭтаФорма.Стоимость;
	
	ЗаписьКлиента.Записать();
	
	СообщениеПользователю = Новый СообщениеПользователю;
	СообщениеПользователю.Текст = СтрШаблон("Вы записаны на услугу %1 к мастеру %2 на дату %3",Объект.Услуга, Объект.Сотрудник, Формат(Объект.ДатаЗаписи, "ДФ='dd.MM.yyyy HH:mm'"));
	СообщениеПользователю.Сообщить();
	
КонецПроцедуры

&НаКлиенте
Процедура Записаться(Команда)
	ЗаписатьсяНаСервере();
КонецПроцедуры

&НаСервере
Процедура УслугаПриИзмененииНаСервере()
	
	ЭтаФорма.Стоимость = Объект.Услуга.Стоимость;
	
КонецПроцедуры

&НаКлиенте
Процедура УслугаПриИзменении(Элемент)
	УслугаПриИзмененииНаСервере();
КонецПроцедуры
