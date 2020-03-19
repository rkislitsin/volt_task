
### Тестовое задание:

Есть игроки, которые играют за команду, принимая участие в матчах.
Есть показатели ("пробежал 10+ км", "сделал 70+ % точных передач" и так далее).
Игроки в каждом матче какие-то показатели выполняют, а какие-то нет.

Задание:
Создать модели к данной предметной области.
P.S. Полный набор атрибутов в моделях не принципиален, так что можно обойтись минимально достаточным.

Реализовать методы, которые позволяют
- отметить, что игрок выполнил такой-то показатель в матче
- проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды
- выбрать Top-5 игроков по конкретному показателю в конкретной команде и по всем командам в целом

Требования к тестированию
Код покрыть функциональными тестами (rspec).

# Запуск приложения

Для того, чтобы запустить приложение, выполните следующие команды у себя в окне терминала:

Склонируйте репозиторий с GitHub и перейдите в папку приложения:
```
git clone https://github.com/rkislitsin/volt_task.git
cd volt_task
```

Установите необходимые гемы:
```
bundle install
```

Создайте базу данных, запустите миграции для базы данных и файл `seeds.rb` для создания записей в базу данных:
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

Тестирование методов через:
```
bundle exec rails console
``` 
"отметить, что игрок выполнил такой-то показатель в матче"

```ruby
player = Player.last
 => #<Player id: 55, name: "Harry Kane", command_id: 5, ...>
  
player.add_achievement(Achievement.all.sample, Match.last)
 => #<Rating id: 489, player_id: 55, achievement_id: 6, match_id: 20, ...> 

```

"проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды"

```ruby
player = Player.last
 => #<Player id: 55, name: "Harry Kane", command_id: 5, ...>
  
player.last_matches_achievements?(10)
 => true
   
player.last_matches_achievements?(11)
 => false 

```

"выбрать Top-5 игроков по конкретному показателю в конкретной команде и по всем командам в целом"

при передаче одного аргумента, выводит топ без учета комманд(по умолчанию 5 позиций)
```ruby
Player.top(10)
 => #<ActiveRecord::Relation [#<Player id: 53, name: "Mohammed Salah", command_id: 5, ...>,
                              #<Player id: 10, name: "Zlatan Ibrahimovic", command_id: 1, ...>, 
                              #<Player id: 23, name: "Delle Alli", command_id: 3, ...>, 
                              #<Player id: 32, name: "Delle Alli", command_id: 3, ...>,
                              # #<Player id: 36, name: "Gianluigi Buffon", command_id: 4, ...">]>   

```

при передаче вторым аргументом ```id```  команды, выводит топ по этой команду(по умолчанию 5 позиций)
```ruby
Player.top(10, 5)
 => #<ActiveRecord::Relation [#<Player id: 53, name: "Mohammed Salah", command_id: 5, ...>, 
                              #<Player id: 52, name: "Roberto Firmino", command_id: 5, ...>, 
                              #<Player id: 45, name: "Cesc Fabregas", command_id: 5, ...">, 
                              #<Player id: 47, name: "Gerard Pique", command_id: 5, ...">, 
                              #<Player id: 48, name: "Paul Pogba", command_id: 5, ...">]> 

```

опционально при передаче третьим аргументом количество позиций в топе, выводит указанное количество
```ruby
Player.top(10, 5, 1)
 => #<ActiveRecord::Relation [#<Player id: 53, name: "Mohammed Salah", command_id: 5, ...">]> 

```

также можно пропустить аргумент команды и указать количество позиций в топе
```ruby
Player.top(10, nil, 2)
 => #<ActiveRecord::Relation [#<Player id: 53, name: "Mohammed Salah", command_id: 5, ...">, 
                              #<Player id: 10, name: "Zlatan Ibrahimovic", command_id: 1, ...">]> 

```


