-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 07 2020 г., 17:09
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_task_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `histlpu`
--

CREATE TABLE `histlpu` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `lpu` varchar(6) NOT NULL,
  `lpudt` date DEFAULT NULL,
  `lpudx` date DEFAULT NULL,
  `district` varchar(10) DEFAULT NULL,
  `subdiv` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `histlpu`
--

INSERT INTO `histlpu` (`id`, `pid`, `lpu`, `lpudt`, `lpudx`, `district`, `subdiv`) VALUES
(1, 2, '750145', '2020-01-01', '2020-07-01', '5', '1'),
(2, 3, '750066', NULL, NULL, NULL, NULL),
(3, 4, '750145', '2019-01-01', '2019-12-31', '3', '3'),
(4, 4, '750145', '2020-01-01', NULL, '3', '10'),
(5, 5, '750144', '2018-03-01', NULL, '1', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `lpu`
--

CREATE TABLE `lpu` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `bossname` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lpu`
--

INSERT INTO `lpu` (`id`, `code`, `caption`, `bossname`) VALUES
(1, '750066', 'ГУЗ Читинская ЦРБ', 'Емельянов Геннадий Константинович'),
(2, '750145', 'ГУЗ КМЦ', 'Рыкова Наталья Ивановна'),
(3, '750144', 'ГУЗ ДКМЦ', 'Нардина Ирина Владимировна'),
(4, '750004', 'ГУЗ КБ №3', 'Горяев Николай Ильич'),
(5, '750001', 'ГУЗ Краевая клиническая больница', 'Шальнев Виктор Александрович');

-- --------------------------------------------------------

--
-- Структура таблицы `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `enp` varchar(16) NOT NULL,
  `fam` varchar(40) NOT NULL,
  `im` varchar(40) NOT NULL,
  `ot` varchar(40) DEFAULT NULL,
  `w` int(11) NOT NULL,
  `dr` date NOT NULL,
  `lpu` varchar(6) DEFAULT NULL,
  `lpudt` date DEFAULT NULL,
  `lpudx` date DEFAULT NULL,
  `lpuuch` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `people`
--

INSERT INTO `people` (`id`, `enp`, `fam`, `im`, `ot`, `w`, `dr`, `lpu`, `lpudt`, `lpudx`, `lpuuch`) VALUES
(1, '7594045746370284', 'ИВАНОВ', 'ИВАН', 'ИВАНОВИЧ', 1, '1960-01-01', NULL, NULL, NULL, NULL),
(2, '7594045584245684', 'ПЕТРОВ', 'ПЁТР', 'ПЕТРОВИЧ', 1, '1990-07-07', '750145', '2020-01-01', '2020-01-07', '5'),
(3, '7594045746375674', 'СЕЛИНА', 'ЛЮБОВЬ', 'ИЛЬИНИЧНА', 2, '1968-05-04', '750066', NULL, NULL, NULL),
(4, '7594045746370000', 'ТОМСКИХ', 'ИРИНА', 'СЕРГЕЕВНА', 2, '2002-12-05', '750145', '2020-01-01', NULL, '10'),
(5, '7594029345746370', 'ДОНДОКОВ', 'ТИМУР', NULL, 1, '2018-02-18', '750144', '2018-03-01', NULL, '2');

-- --------------------------------------------------------

--
-- Структура таблицы `т001`
--

CREATE TABLE `т001` (
  `id` int(11) NOT NULL,
  `mcod` varchar(6) NOT NULL,
  `nam_mo` varchar(100) NOT NULL,
  `nom_podr` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `т001`
--

INSERT INTO `т001` (`id`, `mcod`, `nam_mo`, `nom_podr`) VALUES
(1, '750066', 'Новотроицкая амбулатория', '1'),
(2, '750066', 'Участковая больница села Бургень', '2'),
(3, '750145', 'Поликлиническое подразделение №1', '1'),
(4, '750145', 'Поликлиническое подразделение №3', '3'),
(5, '750144', 'Поликлиническое подразделение №1', '1'),
(6, '750004', 'Поликлиника пгт. Первомайск', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `т007`
--

CREATE TABLE `т007` (
  `id` int(11) NOT NULL,
  `code_mo` varchar(6) NOT NULL,
  `name_depth` varchar(100) NOT NULL,
  `nom_podr` varchar(10) NOT NULL,
  `depth` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `т007`
--

INSERT INTO `т007` (`id`, `code_mo`, `name_depth`, `nom_podr`, `depth`) VALUES
(1, '750066', 'Терапевтический участок', '1', '1'),
(2, '750066', 'Педиатрический участок', '2', '2'),
(3, '750145', 'Участок №1', '1', '1'),
(4, '750145', 'Участок №3', '3', '3'),
(5, '750145', 'Участок №10', '3', '10'),
(6, '750144', 'Участок №1', '1', '2'),
(7, '750004', 'Педиатрический участок №2', '1', '4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `histlpu`
--
ALTER TABLE `histlpu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Индексы таблицы `lpu`
--
ALTER TABLE `lpu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `т001`
--
ALTER TABLE `т001`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `т007`
--
ALTER TABLE `т007`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `histlpu`
--
ALTER TABLE `histlpu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `lpu`
--
ALTER TABLE `lpu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `т001`
--
ALTER TABLE `т001`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `т007`
--
ALTER TABLE `т007`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `histlpu`
--
ALTER TABLE `histlpu`
  ADD CONSTRAINT `HISTLPU_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `people` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
