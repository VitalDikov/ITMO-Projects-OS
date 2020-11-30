# Manual по Bash-скриптам
* Объявление shell, для которого написан скрипт: `!#<path to interpreter>`  
(example: `#!/bin/bash`)
* Сделать файл исполняемым: `chmod +x ./<name of script>`  
(example: `chmod +x ./myscript`)
* Вывод: `echo <list of parameters to output>`  
(example: `echo "Hi"`, `echo ~/*`)
  + `-n` - ключ для вывода информации без "\n"
* Переменные среды: $<name>  
  (example: `$HOME`)
* Управляющий символ: `\`  
  (example: `\$`, `\\`)
* Создание переменных: `<name>=<value>`  
  (example: `name=Yarik`, `age=18`, `echo "$name is $age years old"`)
* Извлечение информации из вывода команд: `<name>=$(<command>)`  
  (example: `iam=$(whoami)`)
* Мат. операции: `<name>=$((a+b))`  
  (example: `sum=$((2+4*6))`)
* Конструкция if-then-elif-else-fi (if/then/elif/else/fi - все пишется на новой строке):  
  + `if [<expression>] then <solution> fi`  
  (example: `if grep $user /etc/passwd then echo "The user $user Exists" fi`)
  + `if [<expression>] then <solution> else <another solution> fi`
  + `if [<expression>] then <solution> elif [<another expression>] then <another solution> fi`
* Сравнение чисел:  
  + `-eq` is `==` (equal)
  + `-ge` is `>=` (greater-equal)
  + `-gt` is `>` (strictly greater)
  + `-le` is `<=` (less-equal)
  + `-lt` is `<` (strictly less)
  + `-ne` is `!=` (not equal)
* Работа со строками:
  + Сравнение строк:
  + `s1 = s2` -> `if (s1 == s2) return true;`
  + `s1 != s2` -> `if (s1 != s2) return true;`
  + `s1 \< s2` -> `if (s1 < s2) return true;`
  + `s1 \> s2` -> `if (s1 > s2) return true;`
  + `-n s1` -> `if (s1.length() > 0) return true;`
  + `-z s1` -> `if (s1.length() == 0) return true;`
  + Если сравнивается переменная, объявленная статичной строкой, ее надо дополнительно заключать в двойные кавычки  
  (example: `s1 = $USER s2 = "SmartOven" if [$s1 \< "$s2"]) then echo "OK" fi`)
  + Несостыковочка: команда `sort` считает, что A < a, оператор сравнения считает наоборот :/  
  + Определение длины строки: `expr length $<var>`
* Работа с файлами:  
  + Существует ли файл: `-e <file>`
  + Существует ли файл и является ли он директорией: `-d <file>`
  + Существует ли файл, и является ли он обычным файлом: `-f <file>`
  + Существует ли файл, и доступен ли он для чтения: `-r <file>`
  + Существует ли файл, и доступен ли он для записи: `-w <file>`
  + Существует ли файл, и не является ли он пустым: `-s <file>`
  + Существует ли файл, и является ли он исполняемым: `-x <file>`
  + Новее ли <file1>, чем <file2>: `file1 -nt file2`
  + Старше ли <file1>, чем <file2>: `<file1> -ot <file2>`
  + Существует ли файл, и является ли его владельцем текущий пользователь: `-O <file>`
  + Существует ли файл, и соответствует ли его идентификатор группы идентификатору группы текущего пользователя: `-G <file>`
* Separator (разделитель): изначально `bash` считает сепараторами пробел, табуляцию и перенос строки, но список сепараторов можно изменить, изменив переменную IFS: `IFS=$'\n'` или `IFS=:`
* Циклы:
  + Цикл может быть вложенным (похож на **Pascal**)
  + Существуют операции `break` и `continue`
  + В цикле можно перенаправить вывод (вместо консоли выводить в файл): для этого надо после `done` добавить `> <file>`  
  (example: `done > output.txt`)
* Цикл while:
  + Простой цикл bash: `while [<expression>] do <another expression> done`  
  (example: `var1=5 while [ $var1 -gt 0 ] do echo $var1 var1=$[ $var1 - 1 ] done`)
* Цикл for:
  + Простой цикл bash: `for <var> in <list> do <list of commands> done`  
  (simple example: `for var in first second third fourth fifth do echo The $var item done`)  
  (real example: `file="myfile" for var in $(cat $file) do echo " $var" done`)
  + С-подобный цикл: `for (( a = 1; a < 10; a++ ))`  
* Чтение параметров командной строки:  
  + bash назначает им имена `$1`, `$2`, ... (`$0` - название скрипта)  
    (example: `./myscript 10 25` -> `$0=./myscript` `$1=10` `$2=25`)
  + Количество параметров содержится в переменной `$#`
  + Все параметры разом можно захватить: `$*`=строка, содержащая все параметры или `$@`=список, содержащий все параметры
  + Последний параметр можно получить, написав `${!#}`
  + Если требуется больше 9 параметров, параметры начиная с 10-ого идут как `${10}`, `${11}`, ...
  + Если требуется обработать несколько параметров, разделенных пробелом, как один - надо изменить сепаратор
  + Пример проверки на существование параметра: `if [ -n "$1" ] then echo Hello $1. else echo "No parameters found. " fi`
  + Чтобы сдвинуть влево все параметры (каждый `i-ый` становится `(i-1)-ым`), используется команда `shift`, но говорят, что надо быть с ней поосторожнее
* `Case` в `bash`:  
  `case "$<var>" in`  
  `<key1>) echo "$<key1>" ;;`  
  `<key2>) echo "$<key2>" ;;`  
  `<key3>) echo "$<key3>" ;;`  
  `*) echo "default" ;;`  
  `esac`
* Стандартизированные названия ключей, которых стоит придерживаться
  + `-a` - Вывести все объекты.
  + `-c` - Произвести подсчёт.
  + `-d` - Указать директорию.
  + `-e` - Развернуть объект.
  + `-f` - Указать файл, из которого нужно прочитать данные.
  + `-h` - Вывести справку по команде.
  + `-i` - Игнорировать регистр символов.
  + `-l` - Выполнить полноформатный вывод данных.
  + `-n` - Использовать неинтерактивный (пакетный) режим.
  + `-o` - Позволяет указать файл, в который нужно перенаправить вывод.
  + `-q` - Выполнить скрипт в quiet-режиме.
  + `-r` - Обрабатывать папки и файлы рекурсивно.
  + `-s` - Выполнить скрипт в silent-режиме.
  + `-v` - Выполнить многословный вывод.
  + `-x` - Исключить объект.
  + `-y` - Ответить «yes» на все вопросы.
* Чтение данных из консоли: `read <var>`  
  (example: `read name`, `read name age info`)
  + Команда `read` возвращает `true` если пользователь ввел данные, иначе `false`
  + Если вызвать `read` без указания переменной, информация запишется в `$REPLY`
  + `-p` - ключ для вывода сообщения перед вводом пользователя
  + `-t <sec>` - ключ для ожидания <sec> секунд ввода пользователя, если по истечении <sec> пользователь ничего не введет - работа скрипта продолжится не дожидаясь ввода
  + `-s` - ключ для скрытия ввода пользователя (делает цвет текста таким же как и цвет фона консоли), используется для ввода паролей
* Чтение из файла
  + `cat <file> | while read <var>` - построчное чтение из файла в переменную <var>, которую обычно называют line
* Ввод/вывод в `bash` и его перенаправление:
  + Перенаправление ввода делается символом `<`, а вывода - символом `>`  
  При этом перед ним стоит аргумент - то, что надо перенаправить, а после - то, куда надо перенаправить
  Наглядно это выглядит так: **место, куда должен был быть направлен вывод** `>` **место, куда он теперь направлен**  
  С вводом то же самое, только знак с `>` меняется на `<`  
  Постоянное перенаправление чаще всего используется для вызова скрипта в консоли, чтобы:  
  а) ввод в скрипт осуществлялся из файла  
  (example: `./myscript 0< input.txt`);  
  б) вывод скрипта оказался в файле  
  (example: `./myscript 1> output.txt`);  
  в) ввести/вывести несколько строк подряд (или даже все) в скрипте без написания `>`/`<` каждый раз  
  В таком случае используется команда `exec`  
  (example: `exec 1> output.txt`)  
  (example: `exec 0< input.txt`)  
  Временное перенаправление чаще всего используется в строках скрипта, чтобы разделить вывод, например, на:  
  {ошибки, ответ, результат выполнения} -> {err_log_file, output, STDOUT}
  + `STDIN`:  
  Постоянное перенаправление - `0< <file>`;  
  (example: `read -p "Read from file" 0< input.txt`)  
  Временное перенаправление - `0< &<file>`;  
  (example: `read -p "Read from file" 0< &input.txt`)
  + `STDOUT`:  
  Постоянное перенаправление - `1> <file>`;  
  (example: `echo "Write in file" 1> output.txt`)  
  Временное перенаправление - `1> &<file>`;  
  (example: `echo "Write in file" 1> &output.txt`)
  + `STDERR`:  
  Постоянное перенаправление - `2> <file>`;  
  (example: `ls $(pwd)/unexistfolder 2> err_log_file.txt` - выведет ошибку о несуществовании директории в файл)  
  Временное перенаправление - `2> &<file>`;  
  (example: `ls $(pwd)/unexistfolder 2> &err_log_file.txt` - выведет ошибку о несуществовании директории в файл)
  + `&> <file>` - постоянное перенаправление вывода `STDOUT` и `STDERR` в один и тот же файл
  + Свои собственные дескрипторы перенаправления ввода/вывода:  
  Помимо 0=STDIN, 1=STDOUT, 2=STDERR существуют еще 6 (от 3-его до 8-ого) открытых дескриптора,  
  которые можно назначить для перенаправления ввода/вывода в свои файлы (чтобы не писать много раз `>reallylongfilename`)
  (example: `exec 3> reallylongfilenamethatyouneed; echo "I writed it in file" 1>&3`)  
  (example: `exec 3> reallylongfilenamethatyouneed; echo "I writed it in file" >&3`)  
  + Создание дескриптора ввода/вывода данных:  
  Чтобы можно было использовать в программе несколько вариантов ввода (`STDIN`(!!!), file1, file2, ...),  
  нужно сохранить в отдельный дескриптор `STDIN`, а потом оттуда его вытащить.  
  (example: `exec 6< &0; exec 0< INPUT; <list of commands using INPUT file>; exec 0< &6; <list of commands using STDIN>;`)
  + Закрытие дескриптора:  
  После окончания выполнения работы скрипта дескрипторы закрываются автоматически, но,  
  если нужно использовать их повторно (вдруг вам не хватит 6-ти штук), можно их закрыть и открыть  
  уже с другим файлом для перенаправления функцией `exec` с использованием приставки `&-`  
  (это вызовет перенаправление дескриптора из <number> в `&-`, условный NULL)  
  (example: `exec 3> output; echo "Write in output file" > &3; exec 3> &-; echo "This won't work" > &3`)  
  (example: `exec 3> out1; echo "Write in out1" > &3; exec 3> &-; exec 3> out2; echo "Write in out2" > &3`,  
  но все, что было записано в out1, будет утеряно)
  + Получение информации об открытых дескрипторах:  
  Эту информацию предоставляет команда `lsof`, у которой есть три важных ключа:  
  `-p` - указать ID процесса, который использует дескрипторы;  
  `-d` - указать номер дескриптора, о котором надо получить сведения;  
  `-a` - применить логическое И (&& в С++) к результату, возвращенному указанием команде первых двух ключей.  
  (example: `lsof -a -p $$ -d 0,1,2` - `$$`=this->ID="ID процесса, в котором была запущена функция")  
  + Перенаправление вывода в "чёрную дыру" (в никуда):  
  Чтобы программа, работающая в фоне, ничего никуда не выводила, надо перенаправлять ее вывод в `/dev/null`  
  (example: `ls unexistdirectory 2> /dev/null` - сообщение об ошибке никто никогда не увидит)