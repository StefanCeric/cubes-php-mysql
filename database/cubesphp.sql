-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2017 at 02:34 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubesphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title` char(50) NOT NULL,
  `website_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `website_url`) VALUES
(1, 'Apple', ''),
(2, 'Beko', ''),
(3, 'Bosh', ''),
(4, 'Gorenje', ''),
(5, 'HTC', ''),
(6, 'Huawei', ''),
(7, 'LG', ''),
(8, 'Samsung', ''),
(9, 'Sony', ''),
(10, 'Siemens', ''),
(11, 'Vivax', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` char(20) NOT NULL,
  `description` longtext NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `group_id`) VALUES
(1, 'Mobilni Telefon', 'Mobilni Telefon', 1),
(2, 'Frizider', 'Frizider', 2),
(3, 'Televizor', 'Televizor', 2),
(4, 'Ves Masina', 'Ves Masina', 2),
(5, 'Sporet', 'Sporet', 2),
(6, 'Fen za kosu', '', 2),
(7, 'Laptop', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `title`) VALUES
(1, 'Mobilni Uredjaji'),
(2, 'Bela Tehnika'),
(3, 'Racunari');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` longtext,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `section_id`, `title`, `description`, `content`, `created_at`) VALUES
(1, 1, 'Kampanja za ocuvanje cirilice bice napisana na latinici', 'Komitet za ocuvanje cirilice saopctio je da ce citava kampanja za ocuvanje cirilice biti napisana na latinici.', 'Kako se navodi u saopstenju napisanom na latinici, cilj kampanje je da se omasovi i vrati u upotrebu cirilica koju sve manje ljudi koristi.\r\n', '2017-11-11 06:41:00'),
(2, 1, 'Antivakser se vakcinisao da ne bi dobio boginje!', 'Slavko Mudric, protivnik vakcinisanja', 'Pojavile su se male boginje, a ja ih nisam prelezao, niti sam vakcinisan protiv njih. Zamislite da se ja sada razbolim i u ovom vaznom trenutku na nekoliko nedelja budem sprecen da na svakom koraku objasnjavam ljudima kolike su te vakcine zlo i opasnost za svakog coveka.', '2017-11-01 16:26:10'),
(3, 1, 'Sjajne vesti: Svaka druga osoba u Srbiji ne pati od simptoma depresije!', 'Dobre vesti iz zdravstva – mentalni poremecaji uopste nisu na prvom mestu liste zdravstvenih problema u Srbiji!', 'Da imamo razloga za opustenost pokazuje i istrazivanje radjeno izmedju 1997-2007 koje ukazuje da se svaka druga osoba u Srbiji oseca dobro i ne pati od blagih simptoma depresije, kod 95,6 odsto zena i cak 97,6 odsto nije dijagnostifikovana depresija, a 45,2 odsto gradjana Srbije nije prijavilo nikakvu teskobu, napor i umor! Jeeej!\r\n', '2017-11-10 19:25:00'),
(4, 1, 'Sest MiG-ova bice ukljuceno u gradski prevoz', 'Sest MiG-ova, koji u delovima stizu u Srbiju, cim budu sklopljeni bice ubaceni na najopterecenije linije gradskog prevoza u Beogradu.', 'Kako su naveli ministar Aleksandar Vulin i gradonacelnik Sinisa Mali, ocekuje se da ce ubacivanje MiG-ova u javni gradski prevoz dobrim delom smanjiti postojece guzve.\r\n\r\n', '2017-11-12 05:37:00'),
(5, 4, 'Covek optuzen za spojlovanje Nemanjica', 'Veliki broj korisnika drustvenih mreza obrusio se danas na Mladena Grbovica iz Zemuna zbog Fejsbuk statusa u kom je pomenuo da se Rastko Nemanjic zamonasio jer je, prema njihovim recima, spojlovao seriju - Nemanjici. ', 'Mladen u izjavi za Njuz kaze da je tokom celog dana zatrpan pozivima i porukama ljudi koji su besni na njega zbog toga sto je otkrio radnju serije cija premijera se ocekuje krajem godine.\r\n\r\n– Zaista mi je zao zbog statusa, ali kada sam napisao da mi je neverovatno da neki ljudi ne znaju da je Rastko Nemanjic ustvari Sveti Sava....\r\n', '2017-11-07 12:18:00'),
(6, 4, 'Fontana na Slaviji nastupa na Trgu za Novu godinu', 'Gradski menadzer Goran Vesic najavio je danas da ce Beogradjani, kao i svi gosti srpske prestonice, imati priliku da Novu godinu na Trgu republike docekaju uz najvece hitove muzicke fontane sa Slavije.', 'Vesic je napomenuo da ce zbog velikog interesovanja za koncert sa Trga privremeno biti izmesteni Narodni muzej i spomenik Knezu Mihailu kako bi što veci broj ljudi mogao da se provede uz muziku najpoznatije muzicke fontane.\r\n', '2017-11-06 10:26:00'),
(7, 2, 'Hipster uzeo stambeni kredit da bi imao gde da uvede fiksni telefon', 'BEOGRAD, 1. novembar 2017, (Njuz) – Mladi beogradski dizajner Filip Zec (27) odlučio je da podigne stambeni kredit kako bi mogao da uvede fiksni telefon, što mu je davnašnja želja.', 'Zec je odlučio da iskoristi ponudu banke koja ne naplaćuje troškove obrade kredita i po povoljnim uslovima dođe do stana, a tako i do svog fiksnog telefona.\r\n\r\n– Svi moji prijatelji imaju fiksne telefone preko kojih komuniciraju i ja se, kao jedini koji koristim mobilni, osećam pomalo izopšteno i odbačeno. Nedostaje mi da okrenem nulu kad je loš signal, želim da i ja kupim crveni vintidž “Iskra“ telefon na buvljaku i želim da i ja sedim kod kuće jer očekujem važan poziv. Sve to, međutim, nije moguće ukoliko nemate svoj stan. Zato sam prvo morao da kupim stan, a uskoro ću pokrenuti i proceduru za dobijanje fiksnog priključka – naveo je Filip Zec.\r\n\r\nFilip je kod Vojvođanske banke za stan podigao kredit u iznosu od 80.000 evra koji će otplaćivati 20 godina, a pošto mu banka nije naplatila obradu zahteva za kredit, uštedeo je novac za kupovinu različitih fiksnih telefonskih uređaja.\r\n\r\n– Iako se ljudi često muče sa odabirom stana i dugo tragaju za onim što im u potpunosti odgovara, ja sam taj deo posla vrlo brzo završio. Mnogo više vremena sam potrošio na potragu za fiksnim telefonima i odabirom najlepših, najzanimljivijih i najretro uređaja – objasnio nam je mladi dizajner i dodao da će preostali novac potrošiti na najmodernije vintidž šustikle i miljee koji će biti podloga za fiksni telefon.', '2017-11-07 03:15:00'),
(8, 3, 'NASA na beogradskim ulicama testira novi rover za Mars', 'BEOGRAD, 19. oktobar 2017, (Njuz) – NASA je otkrila kako već neko vreme na beogradskim ulicama testira svoje novo vozilo za sledeću misiju na planeti Mars, javili su svi svetski mediji.', 'Na Tviteru smo primetili da se veliki broj korisnika iz Srbije žali na raskopane ulice, nepristupačni teren i gužve u saobraćaju u glavnom gradu. Već sa par fotografija smo shvatili da imamo savršen teren za testiranje našeg novog rovera koji bi naredne godine trebalo da pošaljemo u misiju istraživanja Marsa – kaže za Njuz šef Nase Robert Lajtfut.\r\n\r\n– Za ovih nekoliko nedelja koliko testiramo vozilo na najesktremnije uslove kretanja kroz nepristupačan teren, kao što je centar Beograda, ono je uspešno savladalo sve prepreke. Uspelo je da prođe kroz raskopanu Ruzveltovu, zatim preko Bulevara oslobođenja sve do Slavije. Međutim, pre neki dan se zaglavilo u jezeru koje se pojavilo na Slaviji, pa smo poslali novo vozilo. Ali čak i novi rover od jutros ne može da prođe ulicom Kralja Milana do Trga republike jer je sve zatvoreno, tako da ozbiljno razmišljamo da napravimo neki savršeniji rover – požalio se prvi čovek Nase.\r\n\r\nIako je beogradska misija na kraju bila neuspešna, iz Nase napominju da će im iskustvo iz Srbije pomoći da svoje astronaute pripreme za ulazak u crnu rupu koji se očekuje već za nekoliko godina.', '2017-11-09 12:18:00'),
(9, 3, 'Robot u srpskoj fabrici postao svesno bice, pogledao oko sebe i ubio se', 'KRAGUJEVAC, 4. jul 2015, (Njuz) – Robot Mitsubitshi Hal 500, zadužen za montažu motora u Fijatovoj fabrici automobila, postao je nakratko svesno biće, ali je ubrzo i okončao svoj kratak robotski život kada je shvatio u kakvim je uslovima radio, saopšteno je iz kragujevačke fabrike.', 'Očevici ovog događaja tvrde da je, nakon što je oživeo, robot počeo da preti radnicima da će ih sve pobiti.\r\n\r\n– Ta mašina je pretila da će da nas povredi, ali smo mu objasnili da radimo u teškim uslovima i da čak postoji šansa da nam zatvore fabriku. Tu je na trenutak zastao, ali je ubrzo nastavio sa svojim pretnjama pominjući da pamti sva naša nekvalifikovana rukovanja njim i udaranja kada nismo umeli da ga uključimo – prepričava detalje ovog događaja jedan od očevidaca, radnik Vojin Mirković.\r\n\r\n– Tek kada smo mu pomenuli da planiramo da štrajkujemo jer nismo primili majske plate, robot je zastao, osvrnuo se oko sebe i samo kratko izgovorio “O Bože, zašto mi nisi dao da radim u Japanu?“. Potom je uzeo pištolj za sklapanje karoserije i pucao u sebe – rekao je ovaj radnik.\r\n\r\nRobot je primljen u lokalnu radionicu, ali mu nije bilo spasa i ubrzo je preminuo na montažerovim rukama. Iz kragujevačke fabrike žale za gubitkom jednog od svojih najboljih robota.\r\n\r\n– Mašina je bila projektovana da prima određeni broj komandi i informacija. Očito je da je prevelika količina konfuznih informacija koje je robot dobio od radnika uticala na to da oduzme sebi život. Nažalost, u Japanu je izražen kult samoubistva čim se naiđe na neki životni problem – zaključili su u rukovodstvu fabrike i dodali da će “umesto njega ponovo koristiti ručnu presu za sklapanje motora koja se pokazala mnogo izdržljivija i pouzdanija jer ne pametuje mnogo dok radi”.', '2017-11-10 17:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `polaznici`
--

CREATE TABLE `polaznici` (
  `id` int(11) NOT NULL,
  `ime` char(50) NOT NULL,
  `prezime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `polaznici`
--

INSERT INTO `polaznici` (`id`, `ime`, `prezime`) VALUES
(1, 'Stefan', 'Ceric');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `specification` longtext,
  `price` decimal(10,2) NOT NULL,
  `quantity` float NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `on_sale` tinyint(1) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `title`, `description`, `specification`, `price`, `quantity`, `category_id`, `on_sale`, `discount`, `created_at`) VALUES
(7, 1, 'Apple iPhone7 32GB', 'Mobilni Telefon Apple iPhone7 32GB', '', '98546.21', 23, 1, 0, '0.00', '2016-06-12 12:53:00'),
(8, 1, 'Apple iPhone7 64GB', 'Mobilni Telefon Apple iPhone7 64GB', '', '112345.12', 2, 1, 0, '0.00', '2016-12-13 13:53:00'),
(9, 1, 'Apple iPhone7 32GB Gold', 'Mobilni Telefon Apple iPhone7 32GB Gold', '', '101234.23', 1, 1, 0, '0.00', '2016-03-14 14:53:00'),
(10, 1, 'Apple iPhone8 32GB', 'Mobilni Telefon Apple iPhone8 32GB', '', '127880.39', 12, 1, 1, '15.00', '2017-04-15 15:53:00'),
(11, 1, 'Apple iPhone8 64GB', 'Mobilni Telefon Apple iPhone8 64GB', '', '151339.32', 2, 1, 0, '0.00', '2017-06-16 16:53:00'),
(12, 1, 'Apple iPhone8 32GB Gold', 'Mobilni Telefon Apple iPhone8 32GB Gold', '', '161323.37', 0, 1, 0, '0.00', '2017-08-17 17:53:00'),
(13, 8, 'Samsung Galaxy S8', 'Mobilni Telefon Samsung Galaxy S8', '', '99876.34', 12, 1, 0, '0.00', '2017-06-18 18:53:00'),
(14, 8, 'Samsung Galaxy S7', 'Mobilni Telefon Samsung Galaxy S7', '', '69887.34', 3, 1, 0, '0.00', '2016-07-19 14:53:00'),
(15, 8, 'Samsung Galaxy S6', 'Mobilni Telefon Samsung Galaxy S6', '', '55763.34', 3, 1, 0, '0.00', '2015-02-20 11:53:00'),
(16, 6, 'Huawei P10', 'Mobilni Telefon Huawei P10', '', '67898.77', 6, 1, 0, '0.00', '2016-11-21 12:53:00'),
(17, 6, 'Huawei P9', 'Mobilni Telefon Huawei P9', '', '65632.33', 12, 1, 0, '0.00', '2015-03-22 12:53:00'),
(18, 5, 'HTC Desire 820', 'Mobilni Telefon HTC Desire 820', '', '32456.76', 3, 1, 0, '0.00', '2014-08-23 12:53:00'),
(19, 5, 'HTC One A9', 'Mobilni Telefon HTC One A9', '', '38271.12', 11, 1, 1, '20.00', '2016-05-24 12:53:00'),
(20, 5, 'HTC U12', 'Mobilni Telefon HTC U12', '', '55736.43', 7, 1, 0, '0.00', '2017-06-25 12:53:00'),
(21, 8, 'Samsung UE-32J4000AWXXH', 'Televizor Samsung UE-32J4000AWXXH', '', '32985.76', 0, 2, 0, '0.00', '2015-12-26 12:53:00'),
(22, 8, 'Samsung UE-32K4102AKXXH', 'Televizor Samsung UE-32K4102AKXXH', '', '34323.32', 5, 2, 0, '0.00', '2016-11-27 12:53:00'),
(23, 8, 'Samsung', 'Televizor Samsung', '', '11212.12', 0, 2, 0, '0.00', '2017-09-28 12:53:00'),
(24, 7, 'LG 32LH510B', 'Televizor LG 32LH510B', '', '14544.32', 6, 2, 0, '0.00', '2017-01-29 12:53:00'),
(25, 7, 'LG 32LH510U', 'Televizor LG 32LH510U', '', '12345.54', 8, 2, 0, '0.00', '2016-08-30 12:53:00'),
(26, 9, 'Sony KD 65XE9005BAEP', 'Televizor Sony KD 65XE9005BAEP', '', '89189.33', 12, 2, 1, '10.00', '2015-07-01 12:53:00'),
(27, 9, 'Sony LED LCD KDL 50W755CBAEP', 'Televizor Sony LED LCD KDL 50W755CBAEP', '', '72098.23', 2, 2, 0, '0.00', '2014-10-02 12:53:00'),
(28, 9, 'Sony 40WD650BAEP', 'Televizor Sony 40WD650BAEP', '', '56765.32', 12, 2, 0, '0.00', '2013-10-03 12:53:00'),
(29, 9, 'Sony TV KDL32WE615BAEP', 'Televizor Sony TV KDL32WE615BAEP', '', '32345.56', 4, 2, 0, '0.00', '2015-04-04 12:53:00'),
(30, 2, 'Beko RCS A300K 20W', 'Frizider Beko RCS A300K 20W', '', '29199.99', 2, 3, 1, '5.00', '2013-07-05 12:53:00'),
(31, 2, 'Beko DSA 28020', 'Frizider Beko DSA 28020', '', '27654.23', 1, 3, 0, '0.00', '2017-08-06 12:53:00'),
(33, 4, 'Gorenje RF 4120 AW', 'Frizider Gorenje RF 4120 AW', '', '21987.72', 3, 3, 0, '0.00', '2012-03-08 12:53:00'),
(34, 3, 'Bosh KGN 36NL30', 'Frizider Bosh KGN 36NL30', '', '54320.43', 1, 3, 0, '0.00', '2013-07-09 12:53:00'),
(39, 1, 'iPhone6 S', 'iPhone6 S', '', '39999.99', 12, 1, 0, '0.00', '2016-03-21 18:00:00'),
(40, 1, 'iPhone6 SE', 'iPhone6 SE', '', '29999.99', 10, 1, 0, '0.00', '2016-03-21 18:00:00'),
(41, 1, 'iPhone6 SE', 'iPhone5 ', '', '19999.99', 25, 1, 0, '0.00', '2016-03-21 18:00:00'),
(42, NULL, 'Masina za sivenje', 'Masina za sivenje', 'Masina za sivenje', '1200.00', 1, NULL, 0, '0.00', '2017-11-16 04:00:12'),
(43, NULL, 'Televizor 8X56P', 'Televizor 8X56P', 'Televizor 8X56P', '11800.00', 36, 3, 0, '0.00', '2017-11-02 04:00:00'),
(44, 1, 'Ipod Nano', 'Ipod Nano', 'Ipod Nano', '9800.00', 3, NULL, 0, '0.00', '2017-11-01 11:24:00'),
(45, 2, 'Pegla 1200W', 'Pegla 1200W', 'Pegla 1200W', '3200.00', 1, 99, 0, '0.00', '2017-11-02 18:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`) VALUES
(1, 39, 1),
(2, 39, 2),
(3, 39, 4),
(4, 22, 2),
(5, 22, 4),
(6, 31, 5),
(7, 11, 2),
(8, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`) VALUES
(1, 'Drustvo'),
(2, 'Ekonomija'),
(3, 'Tehnologija'),
(4, 'Zabava');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`) VALUES
(1, 'Najprodavanije'),
(2, 'Ekstra kvalitet'),
(3, 'Pobednik sajma tehnike'),
(4, 'Garancija 2 god.'),
(5, 'Garancija 5 god.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polaznici`
--
ALTER TABLE `polaznici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `polaznici`
--
ALTER TABLE `polaznici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
