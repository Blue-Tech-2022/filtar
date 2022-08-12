-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2022 at 01:24 AM
-- Server version: 10.5.13-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u992110970_filtar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'احمد يحيي', 'admin@admin.com', '$2y$10$r4APdO9rlyZV7TnTiATH/uca1gJMmIRkmegvafKL8FfvS51ppwCGq', 'assets/uploads/admins/36891657894983.jpg', '2022-07-15 14:04:18', '2022-07-15 14:23:03'),
(2, 'تيست', 'test@admin.com', '$2y$10$81u6OqLIDTnLaQxTzlzc0ut2vsS7dJCnebJ.uWLqCPdyQ7uwzFYB.', 'assets/uploads/admins/24791657894999.jpg', '2022-07-15 14:19:28', '2022-07-15 14:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'فلاتر', '2022-07-15 14:33:43', '2022-07-15 14:33:43'),
(2, 'شمعات', '2022-07-15 14:33:50', '2022-08-07 23:59:32'),
(3, 'قطع غيار', '2022-07-15 14:33:57', '2022-08-07 23:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `governorate_id` int(11) NOT NULL,
  `city_name_ar` varchar(200) NOT NULL,
  `city_name_en` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `governorate_id`, `city_name_ar`, `city_name_en`) VALUES
(1, 1, '15 مايو', '15 May'),
(2, 1, 'الازبكية', 'Al Azbakeyah'),
(3, 1, 'البساتين', 'Al Basatin'),
(4, 1, 'التبين', 'Tebin'),
(5, 1, 'الخليفة', 'El-Khalifa'),
(6, 1, 'الدراسة', 'El darrasa'),
(7, 1, 'الدرب الاحمر', 'Aldarb Alahmar'),
(8, 1, 'الزاوية الحمراء', 'Zawya al-Hamra'),
(9, 1, 'الزيتون', 'El-Zaytoun'),
(10, 1, 'الساحل', 'Sahel'),
(11, 1, 'السلام', 'El Salam'),
(12, 1, 'السيدة زينب', 'Sayeda Zeinab'),
(13, 1, 'الشرابية', 'El Sharabeya'),
(14, 1, 'مدينة الشروق', 'Shorouk'),
(15, 1, 'الظاهر', 'El Daher'),
(16, 1, 'العتبة', 'Ataba'),
(17, 1, 'القاهرة الجديدة', 'New Cairo'),
(18, 1, 'المرج', 'El Marg'),
(19, 1, 'عزبة النخل', 'Ezbet el Nakhl'),
(20, 1, 'المطرية', 'Matareya'),
(21, 1, 'المعادى', 'Maadi'),
(22, 1, 'المعصرة', 'Maasara'),
(23, 1, 'المقطم', 'Mokattam'),
(24, 1, 'المنيل', 'Manyal'),
(25, 1, 'الموسكى', 'Mosky'),
(26, 1, 'النزهة', 'Nozha'),
(27, 1, 'الوايلى', 'Waily'),
(28, 1, 'باب الشعرية', 'Bab al-Shereia'),
(29, 1, 'بولاق', 'Bolaq'),
(30, 1, 'جاردن سيتى', 'Garden City'),
(31, 1, 'حدائق القبة', 'Hadayek El-Kobba'),
(32, 1, 'حلوان', 'Helwan'),
(33, 1, 'دار السلام', 'Dar Al Salam'),
(34, 1, 'شبرا', 'Shubra'),
(35, 1, 'طره', 'Tura'),
(36, 1, 'عابدين', 'Abdeen'),
(37, 1, 'عباسية', 'Abaseya'),
(38, 1, 'عين شمس', 'Ain Shams'),
(39, 1, 'مدينة نصر', 'Nasr City'),
(40, 1, 'مصر الجديدة', 'New Heliopolis'),
(41, 1, 'مصر القديمة', 'Masr Al Qadima'),
(42, 1, 'منشية ناصر', 'Mansheya Nasir'),
(43, 1, 'مدينة بدر', 'Badr City'),
(44, 1, 'مدينة العبور', 'Obour City'),
(45, 1, 'وسط البلد', 'Cairo Downtown'),
(46, 1, 'الزمالك', 'Zamalek'),
(47, 1, 'قصر النيل', 'Kasr El Nile'),
(48, 1, 'الرحاب', 'Rehab'),
(49, 1, 'القطامية', 'Katameya'),
(50, 1, 'مدينتي', 'Madinty'),
(51, 1, 'روض الفرج', 'Rod Alfarag'),
(52, 1, 'شيراتون', 'Sheraton'),
(53, 1, 'الجمالية', 'El-Gamaleya'),
(54, 1, 'العاشر من رمضان', '10th of Ramadan City'),
(55, 1, 'الحلمية', 'Helmeyat Alzaytoun'),
(56, 1, 'النزهة الجديدة', 'New Nozha'),
(57, 1, 'العاصمة الإدارية', 'Capital New'),
(58, 2, 'الجيزة', 'Giza'),
(59, 2, 'السادس من أكتوبر', 'Sixth of October'),
(60, 2, 'الشيخ زايد', 'Cheikh Zayed'),
(61, 2, 'الحوامدية', 'Hawamdiyah'),
(62, 2, 'البدرشين', 'Al Badrasheen'),
(63, 2, 'الصف', 'Saf'),
(64, 2, 'أطفيح', 'Atfih'),
(65, 2, 'العياط', 'Al Ayat'),
(66, 2, 'الباويطي', 'Al-Bawaiti'),
(67, 2, 'منشأة القناطر', 'ManshiyetAl Qanater'),
(68, 2, 'أوسيم', 'Oaseem'),
(69, 2, 'كرداسة', 'Kerdasa'),
(70, 2, 'أبو النمرس', 'Abu Nomros'),
(71, 2, 'كفر غطاطي', 'Kafr Ghati'),
(72, 2, 'منشأة البكاري', 'Manshiyet Al Bakari'),
(73, 2, 'الدقى', 'Dokki'),
(74, 2, 'العجوزة', 'Agouza'),
(75, 2, 'الهرم', 'Haram'),
(76, 2, 'الوراق', 'Warraq'),
(77, 2, 'امبابة', 'Imbaba'),
(78, 2, 'بولاق الدكرور', 'Boulaq Dakrour'),
(79, 2, 'الواحات البحرية', 'Al Wahat Al Baharia'),
(80, 2, 'العمرانية', 'Omraneya'),
(81, 2, 'المنيب', 'Moneeb'),
(82, 2, 'بين السرايات', 'Bin Alsarayat'),
(83, 2, 'الكيت كات', 'Kit Kat'),
(84, 2, 'المهندسين', 'Mohandessin'),
(85, 2, 'فيصل', 'Faisal'),
(86, 2, 'أبو رواش', 'Abu Rawash'),
(87, 2, 'حدائق الأهرام', 'Hadayek Alahram'),
(88, 2, 'الحرانية', 'Haraneya'),
(89, 2, 'حدائق اكتوبر', 'Hadayek October'),
(90, 2, 'صفط اللبن', 'Saft Allaban'),
(91, 2, 'القرية الذكية', 'Smart Village'),
(92, 2, 'ارض اللواء', 'Ard Ellwaa'),
(93, 3, 'ابو قير', 'Abu Qir'),
(94, 3, 'الابراهيمية', 'Al Ibrahimeyah'),
(95, 3, 'الأزاريطة', 'Azarita'),
(96, 3, 'الانفوشى', 'Anfoushi'),
(97, 3, 'الدخيلة', 'Dekheila'),
(98, 3, 'السيوف', 'El Soyof'),
(99, 3, 'العامرية', 'Ameria'),
(100, 3, 'اللبان', 'El Labban'),
(101, 3, 'المفروزة', 'Al Mafrouza'),
(102, 3, 'المنتزه', 'El Montaza'),
(103, 3, 'المنشية', 'Mansheya'),
(104, 3, 'الناصرية', 'Naseria'),
(105, 3, 'امبروزو', 'Ambrozo'),
(106, 3, 'باب شرق', 'Bab Sharq'),
(107, 3, 'برج العرب', 'Bourj Alarab'),
(108, 3, 'ستانلى', 'Stanley'),
(109, 3, 'سموحة', 'Smouha'),
(110, 3, 'سيدى بشر', 'Sidi Bishr'),
(111, 3, 'شدس', 'Shads'),
(112, 3, 'غيط العنب', 'Gheet Alenab'),
(113, 3, 'فلمينج', 'Fleming'),
(114, 3, 'فيكتوريا', 'Victoria'),
(115, 3, 'كامب شيزار', 'Camp Shizar'),
(116, 3, 'كرموز', 'Karmooz'),
(117, 3, 'محطة الرمل', 'Mahta Alraml'),
(118, 3, 'مينا البصل', 'Mina El-Basal'),
(119, 3, 'العصافرة', 'Asafra'),
(120, 3, 'العجمي', 'Agamy'),
(121, 3, 'بكوس', 'Bakos'),
(122, 3, 'بولكلي', 'Boulkly'),
(123, 3, 'كليوباترا', 'Cleopatra'),
(124, 3, 'جليم', 'Glim'),
(125, 3, 'المعمورة', 'Al Mamurah'),
(126, 3, 'المندرة', 'Al Mandara'),
(127, 3, 'محرم بك', 'Moharam Bek'),
(128, 3, 'الشاطبي', 'Elshatby'),
(129, 3, 'سيدي جابر', 'Sidi Gaber'),
(130, 3, 'الساحل الشمالي', 'North Coast/sahel'),
(131, 3, 'الحضرة', 'Alhadra'),
(132, 3, 'العطارين', 'Alattarin'),
(133, 3, 'سيدي كرير', 'Sidi Kerir'),
(134, 3, 'الجمرك', 'Elgomrok'),
(135, 3, 'المكس', 'Al Max'),
(136, 3, 'مارينا', 'Marina'),
(137, 4, 'المنصورة', 'Mansoura'),
(138, 4, 'طلخا', 'Talkha'),
(139, 4, 'ميت غمر', 'Mitt Ghamr'),
(140, 4, 'دكرنس', 'Dekernes'),
(141, 4, 'أجا', 'Aga'),
(142, 4, 'منية النصر', 'Menia El Nasr'),
(143, 4, 'السنبلاوين', 'Sinbillawin'),
(144, 4, 'الكردي', 'El Kurdi'),
(145, 4, 'بني عبيد', 'Bani Ubaid'),
(146, 4, 'المنزلة', 'Al Manzala'),
(147, 4, 'تمي الأمديد', 'tami al\'amdid'),
(148, 4, 'الجمالية', 'aljamalia'),
(149, 4, 'شربين', 'Sherbin'),
(150, 4, 'المطرية', 'Mataria'),
(151, 4, 'بلقاس', 'Belqas'),
(152, 4, 'ميت سلسيل', 'Meet Salsil'),
(153, 4, 'جمصة', 'Gamasa'),
(154, 4, 'محلة دمنة', 'Mahalat Damana'),
(155, 4, 'نبروه', 'Nabroh'),
(156, 5, 'الغردقة', 'Hurghada'),
(157, 5, 'رأس غارب', 'Ras Ghareb'),
(158, 5, 'سفاجا', 'Safaga'),
(159, 5, 'القصير', 'El Qusiar'),
(160, 5, 'مرسى علم', 'Marsa Alam'),
(161, 5, 'الشلاتين', 'Shalatin'),
(162, 5, 'حلايب', 'Halaib'),
(163, 5, 'الدهار', 'Aldahar'),
(164, 6, 'دمنهور', 'Damanhour'),
(165, 6, 'كفر الدوار', 'Kafr El Dawar'),
(166, 6, 'رشيد', 'Rashid'),
(167, 6, 'إدكو', 'Edco'),
(168, 6, 'أبو المطامير', 'Abu al-Matamir'),
(169, 6, 'أبو حمص', 'Abu Homs'),
(170, 6, 'الدلنجات', 'Delengat'),
(171, 6, 'المحمودية', 'Mahmoudiyah'),
(172, 6, 'الرحمانية', 'Rahmaniyah'),
(173, 6, 'إيتاي البارود', 'Itai Baroud'),
(174, 6, 'حوش عيسى', 'Housh Eissa'),
(175, 6, 'شبراخيت', 'Shubrakhit'),
(176, 6, 'كوم حمادة', 'Kom Hamada'),
(177, 6, 'بدر', 'Badr'),
(178, 6, 'وادي النطرون', 'Wadi Natrun'),
(179, 6, 'النوبارية الجديدة', 'New Nubaria'),
(180, 6, 'النوبارية', 'Alnoubareya'),
(181, 7, 'الفيوم', 'Fayoum'),
(182, 7, 'الفيوم الجديدة', 'Fayoum El Gedida'),
(183, 7, 'طامية', 'Tamiya'),
(184, 7, 'سنورس', 'Snores'),
(185, 7, 'إطسا', 'Etsa'),
(186, 7, 'إبشواي', 'Epschway'),
(187, 7, 'يوسف الصديق', 'Yusuf El Sediaq'),
(188, 7, 'الحادقة', 'Hadqa'),
(189, 7, 'اطسا', 'Atsa'),
(190, 7, 'الجامعة', 'Algamaa'),
(191, 7, 'السيالة', 'Sayala'),
(192, 8, 'طنطا', 'Tanta'),
(193, 8, 'المحلة الكبرى', 'Al Mahalla Al Kobra'),
(194, 8, 'كفر الزيات', 'Kafr El Zayat'),
(195, 8, 'زفتى', 'Zefta'),
(196, 8, 'السنطة', 'El Santa'),
(197, 8, 'قطور', 'Qutour'),
(198, 8, 'بسيون', 'Basion'),
(199, 8, 'سمنود', 'Samannoud'),
(200, 9, 'الإسماعيلية', 'Ismailia'),
(201, 9, 'فايد', 'Fayed'),
(202, 9, 'القنطرة شرق', 'Qantara Sharq'),
(203, 9, 'القنطرة غرب', 'Qantara Gharb'),
(204, 9, 'التل الكبير', 'El Tal El Kabier'),
(205, 9, 'أبو صوير', 'Abu Sawir'),
(206, 9, 'القصاصين الجديدة', 'Kasasien El Gedida'),
(207, 9, 'نفيشة', 'Nefesha'),
(208, 9, 'الشيخ زايد', 'Sheikh Zayed'),
(209, 10, 'شبين الكوم', 'Shbeen El Koom'),
(210, 10, 'مدينة السادات', 'Sadat City'),
(211, 10, 'منوف', 'Menouf'),
(212, 10, 'سرس الليان', 'Sars El-Layan'),
(213, 10, 'أشمون', 'Ashmon'),
(214, 10, 'الباجور', 'Al Bagor'),
(215, 10, 'قويسنا', 'Quesna'),
(216, 10, 'بركة السبع', 'Berkat El Saba'),
(217, 10, 'تلا', 'Tala'),
(218, 10, 'الشهداء', 'Al Shohada'),
(219, 11, 'المنيا', 'Minya'),
(220, 11, 'المنيا الجديدة', 'Minya El Gedida'),
(221, 11, 'العدوة', 'El Adwa'),
(222, 11, 'مغاغة', 'Magagha'),
(223, 11, 'بني مزار', 'Bani Mazar'),
(224, 11, 'مطاي', 'Mattay'),
(225, 11, 'سمالوط', 'Samalut'),
(226, 11, 'المدينة الفكرية', 'Madinat El Fekria'),
(227, 11, 'ملوي', 'Meloy'),
(228, 11, 'دير مواس', 'Deir Mawas'),
(229, 11, 'ابو قرقاص', 'Abu Qurqas'),
(230, 11, 'ارض سلطان', 'Ard Sultan'),
(231, 12, 'بنها', 'Banha'),
(232, 12, 'قليوب', 'Qalyub'),
(233, 12, 'شبرا الخيمة', 'Shubra Al Khaimah'),
(234, 12, 'القناطر الخيرية', 'Al Qanater Charity'),
(235, 12, 'الخانكة', 'Khanka'),
(236, 12, 'كفر شكر', 'Kafr Shukr'),
(237, 12, 'طوخ', 'Tukh'),
(238, 12, 'قها', 'Qaha'),
(239, 12, 'العبور', 'Obour'),
(240, 12, 'الخصوص', 'Khosous'),
(241, 12, 'شبين القناطر', 'Shibin Al Qanater'),
(242, 12, 'مسطرد', 'Mostorod'),
(243, 13, 'الخارجة', 'El Kharga'),
(244, 13, 'باريس', 'Paris'),
(245, 13, 'موط', 'Mout'),
(246, 13, 'الفرافرة', 'Farafra'),
(247, 13, 'بلاط', 'Balat'),
(248, 13, 'الداخلة', 'Dakhla'),
(249, 14, 'السويس', 'Suez'),
(250, 14, 'الجناين', 'Alganayen'),
(251, 14, 'عتاقة', 'Ataqah'),
(252, 14, 'العين السخنة', 'Ain Sokhna'),
(253, 14, 'فيصل', 'Faysal'),
(254, 15, 'أسوان', 'Aswan'),
(255, 15, 'أسوان الجديدة', 'Aswan El Gedida'),
(256, 15, 'دراو', 'Drau'),
(257, 15, 'كوم أمبو', 'Kom Ombo'),
(258, 15, 'نصر النوبة', 'Nasr Al Nuba'),
(259, 15, 'كلابشة', 'Kalabsha'),
(260, 15, 'إدفو', 'Edfu'),
(261, 15, 'الرديسية', 'Al-Radisiyah'),
(262, 15, 'البصيلية', 'Al Basilia'),
(263, 15, 'السباعية', 'Al Sibaeia'),
(264, 15, 'ابوسمبل السياحية', 'Abo Simbl Al Siyahia'),
(265, 15, 'مرسى علم', 'Marsa Alam'),
(266, 16, 'أسيوط', 'Assiut'),
(267, 16, 'أسيوط الجديدة', 'Assiut El Gedida'),
(268, 16, 'ديروط', 'Dayrout'),
(269, 16, 'منفلوط', 'Manfalut'),
(270, 16, 'القوصية', 'Qusiya'),
(271, 16, 'أبنوب', 'Abnoub'),
(272, 16, 'أبو تيج', 'Abu Tig'),
(273, 16, 'الغنايم', 'El Ghanaim'),
(274, 16, 'ساحل سليم', 'Sahel Selim'),
(275, 16, 'البداري', 'El Badari'),
(276, 16, 'صدفا', 'Sidfa'),
(277, 17, 'بني سويف', 'Bani Sweif'),
(278, 17, 'بني سويف الجديدة', 'Beni Suef El Gedida'),
(279, 17, 'الواسطى', 'Al Wasta'),
(280, 17, 'ناصر', 'Naser'),
(281, 17, 'إهناسيا', 'Ehnasia'),
(282, 17, 'ببا', 'beba'),
(283, 17, 'الفشن', 'Fashn'),
(284, 17, 'سمسطا', 'Somasta'),
(285, 17, 'الاباصيرى', 'Alabbaseri'),
(286, 17, 'مقبل', 'Mokbel'),
(287, 18, 'بورسعيد', 'PorSaid'),
(288, 18, 'بورفؤاد', 'Port Fouad'),
(289, 18, 'العرب', 'Alarab'),
(290, 18, 'حى الزهور', 'Zohour'),
(291, 18, 'حى الشرق', 'Alsharq'),
(292, 18, 'حى الضواحى', 'Aldawahi'),
(293, 18, 'حى المناخ', 'Almanakh'),
(294, 18, 'حى مبارك', 'Mubarak'),
(295, 19, 'دمياط', 'Damietta'),
(296, 19, 'دمياط الجديدة', 'New Damietta'),
(297, 19, 'رأس البر', 'Ras El Bar'),
(298, 19, 'فارسكور', 'Faraskour'),
(299, 19, 'الزرقا', 'Zarqa'),
(300, 19, 'السرو', 'alsaru'),
(301, 19, 'الروضة', 'alruwda'),
(302, 19, 'كفر البطيخ', 'Kafr El-Batikh'),
(303, 19, 'عزبة البرج', 'Azbet Al Burg'),
(304, 19, 'ميت أبو غالب', 'Meet Abou Ghalib'),
(305, 19, 'كفر سعد', 'Kafr Saad'),
(306, 20, 'الزقازيق', 'Zagazig'),
(307, 20, 'العاشر من رمضان', 'Al Ashr Men Ramadan'),
(308, 20, 'منيا القمح', 'Minya Al Qamh'),
(309, 20, 'بلبيس', 'Belbeis'),
(310, 20, 'مشتول السوق', 'Mashtoul El Souq'),
(311, 20, 'القنايات', 'Qenaiat'),
(312, 20, 'أبو حماد', 'Abu Hammad'),
(313, 20, 'القرين', 'El Qurain'),
(314, 20, 'ههيا', 'Hehia'),
(315, 20, 'أبو كبير', 'Abu Kabir'),
(316, 20, 'فاقوس', 'Faccus'),
(317, 20, 'الصالحية الجديدة', 'El Salihia El Gedida'),
(318, 20, 'الإبراهيمية', 'Al Ibrahimiyah'),
(319, 20, 'ديرب نجم', 'Deirb Negm'),
(320, 20, 'كفر صقر', 'Kafr Saqr'),
(321, 20, 'أولاد صقر', 'Awlad Saqr'),
(322, 20, 'الحسينية', 'Husseiniya'),
(323, 20, 'صان الحجر القبلية', 'san alhajar alqablia'),
(324, 20, 'منشأة أبو عمر', 'Manshayat Abu Omar'),
(325, 21, 'الطور', 'Al Toor'),
(326, 21, 'شرم الشيخ', 'Sharm El-Shaikh'),
(327, 21, 'دهب', 'Dahab'),
(328, 21, 'نويبع', 'Nuweiba'),
(329, 21, 'طابا', 'Taba'),
(330, 21, 'سانت كاترين', 'Saint Catherine'),
(331, 21, 'أبو رديس', 'Abu Redis'),
(332, 21, 'أبو زنيمة', 'Abu Zenaima'),
(333, 21, 'رأس سدر', 'Ras Sidr'),
(334, 22, 'كفر الشيخ', 'Kafr El Sheikh'),
(335, 22, 'وسط البلد كفر الشيخ', 'Kafr El Sheikh Downtown'),
(336, 22, 'دسوق', 'Desouq'),
(337, 22, 'فوه', 'Fooh'),
(338, 22, 'مطوبس', 'Metobas'),
(339, 22, 'برج البرلس', 'Burg Al Burullus'),
(340, 22, 'بلطيم', 'Baltim'),
(341, 22, 'مصيف بلطيم', 'Masief Baltim'),
(342, 22, 'الحامول', 'Hamol'),
(343, 22, 'بيلا', 'Bella'),
(344, 22, 'الرياض', 'Riyadh'),
(345, 22, 'سيدي سالم', 'Sidi Salm'),
(346, 22, 'قلين', 'Qellen'),
(347, 22, 'سيدي غازي', 'Sidi Ghazi'),
(348, 23, 'مرسى مطروح', 'Marsa Matrouh'),
(349, 23, 'الحمام', 'El Hamam'),
(350, 23, 'العلمين', 'Alamein'),
(351, 23, 'الضبعة', 'Dabaa'),
(352, 23, 'النجيلة', 'Al-Nagila'),
(353, 23, 'سيدي براني', 'Sidi Brani'),
(354, 23, 'السلوم', 'Salloum'),
(355, 23, 'سيوة', 'Siwa'),
(356, 23, 'مارينا', 'Marina'),
(357, 23, 'الساحل الشمالى', 'North Coast'),
(358, 24, 'الأقصر', 'Luxor'),
(359, 24, 'الأقصر الجديدة', 'New Luxor'),
(360, 24, 'إسنا', 'Esna'),
(361, 24, 'طيبة الجديدة', 'New Tiba'),
(362, 24, 'الزينية', 'Al ziynia'),
(363, 24, 'البياضية', 'Al Bayadieh'),
(364, 24, 'القرنة', 'Al Qarna'),
(365, 24, 'أرمنت', 'Armant'),
(366, 24, 'الطود', 'Al Tud'),
(367, 25, 'قنا', 'Qena'),
(368, 25, 'قنا الجديدة', 'New Qena'),
(369, 25, 'ابو طشت', 'Abu Tesht'),
(370, 25, 'نجع حمادي', 'Nag Hammadi'),
(371, 25, 'دشنا', 'Deshna'),
(372, 25, 'الوقف', 'Alwaqf'),
(373, 25, 'قفط', 'Qaft'),
(374, 25, 'نقادة', 'Naqada'),
(375, 25, 'فرشوط', 'Farshout'),
(376, 25, 'قوص', 'Quos'),
(377, 26, 'العريش', 'Arish'),
(378, 26, 'الشيخ زويد', 'Sheikh Zowaid'),
(379, 26, 'نخل', 'Nakhl'),
(380, 26, 'رفح', 'Rafah'),
(381, 26, 'بئر العبد', 'Bir al-Abed'),
(382, 26, 'الحسنة', 'Al Hasana'),
(383, 27, 'سوهاج', 'Sohag'),
(384, 27, 'سوهاج الجديدة', 'Sohag El Gedida'),
(385, 27, 'أخميم', 'Akhmeem'),
(386, 27, 'أخميم الجديدة', 'Akhmim El Gedida'),
(387, 27, 'البلينا', 'Albalina'),
(388, 27, 'المراغة', 'El Maragha'),
(389, 27, 'المنشأة', 'almunsha\'a'),
(390, 27, 'دار السلام', 'Dar AISalaam'),
(391, 27, 'جرجا', 'Gerga'),
(392, 27, 'جهينة الغربية', 'Jahina Al Gharbia'),
(393, 27, 'ساقلته', 'Saqilatuh'),
(394, 27, 'طما', 'Tama'),
(395, 27, 'طهطا', 'Tahta'),
(396, 27, 'الكوثر', 'Alkawthar');

-- --------------------------------------------------------

--
-- Table structure for table `clean_time_conditions`
--

CREATE TABLE `clean_time_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `water_type` enum('good','medium','bad') COLLATE utf8mb4_unicode_ci NOT NULL,
  `candle_number` tinyint(4) NOT NULL,
  `change_after` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clean_time_conditions`
--

INSERT INTO `clean_time_conditions` (`id`, `water_type`, `candle_number`, `change_after`, `created_at`, `updated_at`) VALUES
(1, 'good', 1, 90, '2022-07-16 17:37:15', '2022-07-16 17:37:15'),
(2, 'good', 2, 180, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(3, 'good', 3, 180, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(4, 'good', 4, 1080, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(5, 'good', 5, 540, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(6, 'good', 6, 720, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(7, 'good', 7, 1080, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(8, 'medium', 1, 60, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(9, 'medium', 2, 120, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(10, 'medium', 3, 120, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(11, 'medium', 4, 720, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(12, 'medium', 5, 540, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(13, 'medium', 6, 720, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(14, 'medium', 7, 1080, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(15, 'bad', 1, 30, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(16, 'bad', 2, 90, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(17, 'bad', 3, 90, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(18, 'bad', 4, 540, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(19, 'bad', 5, 540, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(20, 'bad', 6, 720, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(21, 'bad', 7, 1080, '2022-07-16 17:37:52', '2022-07-16 17:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `provider_id`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 'تم التسجيل مع التطبيق شكرا لكم', '2022-07-25 22:15:43', '2022-07-25 22:15:43'),
(3, 24, NULL, 'ااااتااا\nهنتع', '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(5, 7, NULL, 'رساله', '2022-08-09 00:02:44', '2022-08-09 00:02:44'),
(6, NULL, 10, 'ر', '2022-08-09 00:54:02', '2022-08-09 00:54:02'),
(7, 5, NULL, 'هذوذ', '2022-08-09 02:07:00', '2022-08-09 02:07:00'),
(8, 28, NULL, 'شمعات 4', '2022-08-09 14:12:33', '2022-08-09 14:12:33'),
(10, NULL, 13, 'تيست', '2022-08-11 23:41:51', '2022-08-11 23:41:51'),
(11, 31, NULL, 'سؤال', '2022-08-12 01:21:22', '2022-08-12 01:21:22'),
(12, NULL, 10, 'سلام عليكم', '2022-08-12 02:36:00', '2022-08-12 02:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(20) NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title_ar`, `image`, `phone_code`) VALUES
(1, 'مصر', 'assets/uploads/country/53651659802677.webp', '+20'),
(2, 'السعودية', 'assets/uploads/country/65321659802797.webp', '+966'),
(3, 'اليمن', 'assets/uploads/country/201659802721.webp', '+967'),
(4, 'المغرب', 'assets/uploads/country/64211659802603.webp', '+212'),
(5, 'تونس', 'assets/uploads/country/33201659802572.webp', '+216'),
(6, 'العراق', 'assets/uploads/country/3711659986729.webp', '+964'),
(7, 'الأردن', 'assets/uploads/country/95901659987785.webp', '+962'),
(8, 'الجزائر', 'assets/uploads/country/43171659987871.webp', '+213'),
(9, 'سوريا', 'assets/uploads/country/3371659988807.webp', '+963'),
(10, 'السودان', 'assets/uploads/country/97001659988859.webp', '+249'),
(11, 'ليبيا', 'assets/uploads/country/97691659988942.webp', '+218'),
(12, 'الكويت', 'assets/uploads/country/76161659988973.webp', '+965'),
(13, 'عُمان', 'assets/uploads/country/16341659989093.webp', '+968'),
(14, 'فلسطين', 'assets/uploads/country/46291659989217.webp', '+970'),
(15, 'قطر', 'assets/uploads/country/93551659989245.webp', '+974'),
(16, 'البحرين', 'assets/uploads/country/77861659989446.webp', '+973'),
(17, 'الإمارات', 'assets/uploads/country/75541659989469.webp', '+971'),
(18, 'الصومال', 'assets/uploads/country/37251659989563.webp', '+252'),
(19, 'تركيا', 'assets/uploads/country/28151659989596.webp', '+90'),
(20, 'الولايات المتحدة الأمريكيه', 'assets/uploads/country/22751659989848.webp', '+1'),
(21, 'المانيا', 'assets/uploads/country/32351659989956.webp', '+49'),
(22, 'فرنسا', 'assets/uploads/country/2061659989992.webp', '+33');

-- --------------------------------------------------------

--
-- Table structure for table `explanations`
--

CREATE TABLE `explanations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `explanations`
--

INSERT INTO `explanations` (`id`, `link`, `title`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'https://www.youtube.com/embed/pj1GWd-kyRo', 'انطلاق شركة نقاء السلسبيل', 'مما لا شك فيه أن فلاتر المياه من مؤسسه نقاء السلسبيل أصبحت لا غني عنها في زمننا الحالي وذلك بسبب كثرة الملوثات الصناعيه حولنا , ولأن الماء هو شريان الحياه يجب علي كل انسان أ يأمن هذا الشريان سواء لنفسه أو لعائلته أو لاي شخص ', '2022-07-25 22:31:41', '2022-07-25 22:31:41'),
(2, 'https://www.youtube.com/embed/B36iAN4qlug', 'تغيير شمعات فلتر المياه', 'علامات تدل على أنه يجب عليك تغيير فلتر المياه لحماية صحتك قد لا يكون المنزل دون فلتر مياه في مراحله المختلفة، من أجل شرب مياه أنقى وأنظف', '2022-07-25 22:38:00', '2022-07-25 22:38:00'),
(4, 'https://www.youtube.com/embed/WGusZyeX058', 'مواصفات فلتر اكوا ترك ٥ مراحل', 'جميع المواصفات', '2022-08-08 00:21:55', '2022-08-08 00:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `explanation_tags`
--

CREATE TABLE `explanation_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `explanation_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `explanation_tags`
--

INSERT INTO `explanation_tags` (`id`, `explanation_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'صيانة', '2022-07-25 22:36:30', '2022-07-25 22:36:30'),
(2, 1, 'تركيبات ', '2022-07-25 22:36:30', '2022-07-25 22:36:30'),
(3, 2, 'مراجعات', '2022-07-25 22:39:27', '2022-07-25 22:39:27'),
(6, 4, 'مراجعات', '2022-08-08 00:21:55', '2022-08-08 00:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `id` int(11) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `governorate_name_ar` varchar(50) NOT NULL,
  `governorate_name_en` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `governorates`
--

INSERT INTO `governorates` (`id`, `country_id`, `governorate_name_ar`, `governorate_name_en`) VALUES
(1, 1, 'القاهرة', 'Cairo'),
(2, 1, 'الجيزة', 'Giza'),
(3, 1, 'الأسكندرية', 'Alexandria'),
(4, 1, 'الدقهلية', 'Dakahlia'),
(5, 1, 'البحر الأحمر', 'Red Sea'),
(6, 1, 'البحيرة', 'Beheira'),
(7, 1, 'الفيوم', 'Fayoum'),
(8, 1, 'الغربية', 'Gharbiya'),
(9, 1, 'الإسماعلية', 'Ismailia'),
(10, 1, 'المنوفية', 'Menofia'),
(11, 1, 'المنيا', 'Minya'),
(12, 1, 'القليوبية', 'Qaliubiya'),
(13, 1, 'الوادي الجديد', 'New Valley'),
(14, 1, 'السويس', 'Suez'),
(15, 1, 'اسوان', 'Aswan'),
(16, 1, 'اسيوط', 'Assiut'),
(17, 1, 'بني سويف', 'Beni Suef'),
(18, 1, 'بورسعيد', 'Port Said'),
(19, 1, 'دمياط', 'Damietta'),
(20, 1, 'الشرقية', 'Sharkia'),
(21, 1, 'جنوب سيناء', 'South Sinai'),
(22, 1, 'كفر الشيخ', 'Kafr Al sheikh'),
(23, 1, 'مطروح', 'Matrouh'),
(24, 1, 'الأقصر', 'Luxor'),
(25, 1, 'قنا', 'Qena'),
(26, 1, 'شمال سيناء', 'North Sinai'),
(27, 1, 'سوهاج', 'Sohag'),
(28, 2, 'الرياض', NULL),
(29, 2, 'مكة المكرمة', NULL),
(30, 2, 'المدينة المنورة', NULL),
(31, 2, 'القصيم', NULL),
(32, 2, 'المنطقة الشرقية', NULL),
(33, 2, 'عسير', NULL),
(34, 2, 'تبوك', NULL),
(35, 2, 'حائل', NULL),
(36, 2, 'الحدود الشمالية', NULL),
(37, 2, 'جازان', NULL),
(38, 2, 'نجران', NULL),
(39, 2, 'الباحه', NULL),
(40, 2, 'الجوف', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_15_002159_create_providers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_03_20_121123_create_categories_table', 1),
(7, '2022_03_20_121202_create_products_table', 1),
(8, '2022_03_20_121243_create_sliders_table', 1),
(9, '2022_03_20_123415_create_admins_table', 1),
(10, '2022_03_20_134518_create_settings_table', 1),
(11, '2022_07_15_165820_create_product_images_table', 2),
(12, '2022_07_16_193305_create_clean_time_conditions_table', 3),
(13, '2022_07_16_225902_create_user_filter_clean_times_table', 4),
(14, '2022_07_17_165935_create_tokens_table', 5),
(15, '2022_07_25_230017_create_orders_table', 6),
(16, '2022_07_25_230614_create_order_details_table', 6),
(17, '2022_07_26_000647_create_contacts_table', 7),
(18, '2022_07_26_002032_create_explanations_table', 8),
(19, '2022_07_26_002252_create_explanation_tags_table', 8),
(20, '2022_07_26_011210_create_notifications_table', 9),
(21, '2022_08_08_024435_create_permission_tables', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 2),
(2, 'App\\Models\\Admin', 2),
(5, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '100 قبل اسبوع و 200 قبل يوم و 300 بعد 15 يوم',
  `candle_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` date DEFAULT NULL,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `provider_id`, `order_id`, `title`, `message`, `type`, `candle_number`, `day`, `is_read`, `created_at`, `updated_at`) VALUES
(591, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:14', '2022-08-09 20:47:14'),
(592, 4, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:14', '2022-08-09 20:47:14'),
(594, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:14', '2022-08-09 20:47:14'),
(596, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(597, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(598, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(599, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(600, 6, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(601, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(603, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:15', '2022-08-09 20:47:15'),
(604, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(605, 7, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(606, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(607, 8, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(610, 10, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(611, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(612, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(613, 22, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(614, 7, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(615, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(616, 23, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:16', '2022-08-09 20:47:16'),
(621, 24, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:17', '2022-08-09 20:47:17'),
(626, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:17', '2022-08-09 20:47:17'),
(627, 3, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:17', '2022-08-09 20:47:17'),
(628, 8, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:17', '2022-08-09 20:47:17'),
(635, 24, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:18', '2022-08-09 20:47:18'),
(636, 26, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:18', '2022-08-09 20:47:18'),
(640, NULL, 4, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:18', '2022-08-09 20:47:18'),
(641, 28, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '1', '2022-08-09 20:47:18', '2022-08-11 10:22:02'),
(644, 7, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '0', '2022-08-09 20:47:19', '2022-08-09 20:47:19'),
(648, 28, NULL, NULL, '', '🥰🌹🥰 Test', '500', NULL, NULL, '1', '2022-08-09 20:47:19', '2022-08-11 10:22:02'),
(649, 8, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 1 بعد يوم', '200', '1', NULL, '0', '2022-08-10 02:00:04', '2022-08-10 02:00:04'),
(650, 24, NULL, NULL, '', 'نذكرك بأن ميعاد تغيير الشمعة رقم 1 كان يوم 2022-08-05 هل تريد تأكيد التغيير ؟', '300', '1', '2022-08-05', '0', '2022-08-10 02:00:04', '2022-08-10 02:00:04'),
(651, 28, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 1 بعد يوم', '200', '1', NULL, '1', '2022-08-10 02:00:04', '2022-08-11 10:22:02'),
(652, 28, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 2 بعد يوم', '200', '2', NULL, '1', '2022-08-10 02:00:05', '2022-08-11 10:22:02'),
(653, 28, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 3 بعد يوم', '200', '3', NULL, '1', '2022-08-10 02:00:05', '2022-08-11 10:22:02'),
(654, 28, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 5 بعد يوم', '200', '5', NULL, '1', '2022-08-10 02:00:05', '2022-08-11 10:22:02'),
(655, 28, NULL, NULL, '', 'يرجي الانتباه بأن موعد تغيير الشمعة رقم 6 بعد يوم', '200', '6', NULL, '1', '2022-08-10 02:00:05', '2022-08-11 10:22:02'),
(663, NULL, 9, 25, '', 'هناك طلب جديد لك', '0', NULL, NULL, '1', '2022-08-11 11:29:49', '2022-08-11 17:27:44'),
(666, NULL, 9, 26, '', 'هناك طلب جديد لك', '0', NULL, NULL, '1', '2022-08-12 00:32:45', '2022-08-12 00:33:45'),
(667, NULL, 16, NULL, '', 'تم الموافقة علي المنتج وهو الان متاح في المتجر', '500', NULL, NULL, '1', '2022-08-12 00:56:08', '2022-08-12 01:01:03'),
(668, NULL, 16, 27, '', 'هناك طلب جديد لك', '0', NULL, NULL, '1', '2022-08-12 00:58:39', '2022-08-12 01:01:03'),
(669, 31, NULL, 27, '', 'تم قبول طلبك المسجل برقم #27 بواسطة بيور ووتر', '0', NULL, NULL, '1', '2022-08-12 01:00:38', '2022-08-12 01:03:39'),
(670, 31, NULL, NULL, '', 'جواب', '500', NULL, NULL, '0', '2022-08-12 01:21:35', '2022-08-12 01:21:35'),
(671, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(672, 4, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(673, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(674, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(675, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(676, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(677, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(678, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(679, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(680, 6, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(681, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(682, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(683, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(684, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:05', '2022-08-12 02:27:05'),
(685, 7, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(686, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(687, 8, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(688, 10, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(689, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(690, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(691, 22, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(692, 7, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(693, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(694, 23, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(695, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(696, 24, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(697, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(698, 3, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(699, 8, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(700, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(701, 24, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(702, 26, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(703, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(704, NULL, 4, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:06', '2022-08-12 02:27:06'),
(705, 28, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(706, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(707, 7, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(708, 5, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(709, 28, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(710, 7, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(711, 30, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '1', '2022-08-12 02:27:07', '2022-08-12 02:27:21'),
(712, 31, NULL, NULL, '', 'مرحبا بالعملاء والتجار', '500', NULL, NULL, '0', '2022-08-12 02:27:07', '2022-08-12 02:27:07'),
(713, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:58', '2022-08-12 02:28:58'),
(714, 4, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:58', '2022-08-12 02:28:58'),
(715, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:58', '2022-08-12 02:28:58'),
(716, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(717, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(718, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(719, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(720, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(721, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(722, 6, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(723, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(724, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(725, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(726, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(727, 7, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(728, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(729, 8, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(730, 10, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(731, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(732, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(733, 22, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(734, 7, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(735, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:28:59', '2022-08-12 02:28:59'),
(736, 23, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(737, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(738, 24, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(739, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(740, 3, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(741, 8, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(742, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(743, 24, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(744, 26, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(745, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(746, NULL, 4, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(747, 28, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(748, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(749, 7, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(750, 5, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(751, 28, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(752, 7, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(753, 31, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:00', '2022-08-12 02:29:00'),
(754, 10, NULL, NULL, '', 'هلا بكم', '500', NULL, NULL, '0', '2022-08-12 02:29:01', '2022-08-12 02:29:01'),
(755, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(756, 4, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(757, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(758, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(759, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(760, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(761, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(762, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(763, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(764, 6, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(765, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(766, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(767, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(768, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(769, 7, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:04', '2022-08-12 02:32:04'),
(770, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(771, 8, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(772, 10, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(773, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(774, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(775, 22, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(776, 7, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(777, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(778, 23, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(779, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(780, 24, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(781, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(782, 3, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(783, 8, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(784, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(785, 24, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(786, 26, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(787, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:05', '2022-08-12 02:32:05'),
(788, NULL, 4, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(789, 28, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(790, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(791, 7, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(792, 5, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(793, 28, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(794, 7, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(795, 31, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(796, 10, NULL, NULL, '', 'تم', '500', NULL, NULL, '0', '2022-08-12 02:32:06', '2022-08-12 02:32:06'),
(797, NULL, 5, 29, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 02:39:20', '2022-08-12 02:39:20'),
(798, NULL, 4, 30, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 02:40:25', '2022-08-12 02:40:25'),
(799, NULL, 4, 31, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 02:40:37', '2022-08-12 02:40:37'),
(800, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(801, 4, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(802, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(803, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(804, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(805, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(806, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(807, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(808, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(809, 6, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(810, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(811, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(812, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(813, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(814, 7, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(815, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(816, 8, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:43', '2022-08-12 02:41:43'),
(817, 10, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(818, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(819, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(820, 22, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(821, 7, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(822, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(823, 23, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(824, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(825, 24, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(826, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(827, 3, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(828, 8, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(829, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(830, 24, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(831, 26, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(832, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(833, NULL, 4, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(834, 28, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(835, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(836, 7, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:44', '2022-08-12 02:41:44'),
(837, 5, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:45', '2022-08-12 02:41:45'),
(838, 28, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:45', '2022-08-12 02:41:45'),
(839, 7, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:45', '2022-08-12 02:41:45'),
(840, 31, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:45', '2022-08-12 02:41:45'),
(841, 10, NULL, NULL, '', 'high', '500', NULL, NULL, '0', '2022-08-12 02:41:45', '2022-08-12 02:41:45'),
(842, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(843, 4, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(844, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(845, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(846, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(847, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(848, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(849, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(850, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:28', '2022-08-12 02:43:28'),
(851, 6, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(852, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(853, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(854, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(855, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(856, 7, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(857, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(858, 8, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(859, 10, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(860, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(861, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(862, 22, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(863, 7, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(864, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(865, 23, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(866, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(867, 24, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(868, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(869, 3, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(870, 8, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(871, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(872, 24, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:29', '2022-08-12 02:43:29'),
(873, 26, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(874, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(875, NULL, 4, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(876, 28, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(877, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(878, 7, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(879, 5, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(880, 28, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(881, 7, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(882, 31, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(883, 10, NULL, NULL, '', '1222', '500', NULL, NULL, '0', '2022-08-12 02:43:30', '2022-08-12 02:43:30'),
(884, NULL, 4, 32, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 02:50:30', '2022-08-12 02:50:30'),
(885, NULL, 10, 33, '', 'هناك طلب جديد لك', '0', NULL, NULL, '1', '2022-08-12 02:58:34', '2022-08-12 03:00:29'),
(886, NULL, 10, 34, '', 'هناك طلب جديد لك', '0', NULL, NULL, '1', '2022-08-12 03:00:15', '2022-08-12 03:00:29'),
(887, NULL, 10, 37, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 03:03:21', '2022-08-12 03:03:21'),
(888, NULL, 10, 38, '', 'هناك طلب جديد لك', '0', NULL, NULL, '0', '2022-08-12 03:03:36', '2022-08-12 03:03:36'),
(889, NULL, 10, NULL, '', 'عليكم السلام', '500', NULL, NULL, '0', '2022-08-12 03:09:17', '2022-08-12 03:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double NOT NULL,
  `status` enum('new','accepted_by_admin','accepted_by_provider','refused_by_provider','refused_by_admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `provider_id`, `phone`, `address`, `total`, `status`, `created_at`, `updated_at`) VALUES
(9, 10, 5, NULL, NULL, 1250, 'accepted_by_provider', '2022-07-27 20:13:41', '2022-07-27 20:13:41'),
(10, 5, 5, NULL, NULL, 1250, 'accepted_by_admin', '2022-07-28 02:00:47', '2022-07-28 02:00:47'),
(11, 3, 5, NULL, NULL, 1300, 'new', '2022-07-30 00:07:40', '2022-07-30 00:07:40'),
(14, 5, 5, NULL, NULL, 1950, 'new', '2022-08-03 04:51:56', '2022-08-03 04:51:56'),
(15, 7, 2, NULL, NULL, 1650, 'new', '2022-08-05 22:15:03', '2022-08-05 22:15:03'),
(16, 7, 10, NULL, NULL, 400, 'accepted_by_provider', '2022-08-05 22:18:15', '2022-08-06 05:20:05'),
(17, 7, 2, NULL, NULL, 1000, 'new', '2022-08-06 05:45:19', '2022-08-06 05:45:19'),
(18, 7, 10, NULL, NULL, 200, 'accepted_by_provider', '2022-08-06 05:59:09', '2022-08-06 06:00:03'),
(20, 28, 10, NULL, NULL, 200, 'new', '2022-08-06 21:59:00', '2022-08-06 21:59:00'),
(23, 5, 4, NULL, NULL, 200, 'new', '2022-08-09 02:03:21', '2022-08-09 02:03:21'),
(24, 5, 11, NULL, NULL, 1055, 'accepted_by_provider', '2022-08-09 02:18:50', '2022-08-09 02:19:29'),
(27, 31, 16, NULL, NULL, 5000, 'accepted_by_provider', '2022-08-12 00:58:39', '2022-08-12 01:00:38'),
(28, 5, 5, NULL, NULL, 1250, 'new', '2022-08-12 02:38:43', '2022-08-12 02:38:43'),
(29, 5, 5, NULL, NULL, 1250, 'new', '2022-08-12 02:39:20', '2022-08-12 02:39:20'),
(30, 5, 4, NULL, NULL, 1250, 'new', '2022-08-12 02:40:25', '2022-08-12 02:40:25'),
(31, 3, 4, NULL, NULL, 1250, 'new', '2022-08-12 02:40:37', '2022-08-12 02:40:37'),
(32, 3, 4, NULL, NULL, 1250, 'new', '2022-08-12 02:50:30', '2022-08-12 02:50:30'),
(33, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 02:58:34', '2022-08-12 02:58:34'),
(34, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 03:00:15', '2022-08-12 03:00:15'),
(35, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 03:00:51', '2022-08-12 03:00:51'),
(36, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 03:03:11', '2022-08-12 03:03:11'),
(37, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 03:03:21', '2022-08-12 03:03:21'),
(38, 3, 10, NULL, NULL, 1250, 'new', '2022-08-12 03:03:36', '2022-08-12 03:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `total_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `qty`, `total_price`, `created_at`, `updated_at`) VALUES
(5, 9, 1, 500, 2, 1000, '2022-07-27 20:13:41', '2022-07-27 20:13:41'),
(7, 10, 1, 650, 2, 1300, '2022-07-28 02:00:47', '2022-07-28 02:00:47'),
(8, 11, 1, 650, 2, 1300, '2022-07-30 00:07:40', '2022-07-30 00:07:40'),
(11, 14, 1, 650, 3, 1950, '2022-08-03 04:51:56', '2022-08-03 04:51:56'),
(12, 15, 5, 500, 1, 500, '2022-08-05 22:15:03', '2022-08-05 22:15:03'),
(13, 15, 1, 650, 1, 650, '2022-08-05 22:15:03', '2022-08-05 22:15:03'),
(14, 15, 4, 500, 1, 500, '2022-08-05 22:15:03', '2022-08-05 22:15:03'),
(15, 16, 8, 200, 2, 400, '2022-08-05 22:18:15', '2022-08-05 22:18:15'),
(16, 17, 5, 500, 1, 500, '2022-08-06 05:45:19', '2022-08-06 05:45:19'),
(17, 17, 4, 500, 1, 500, '2022-08-06 05:45:19', '2022-08-06 05:45:19'),
(18, 18, 8, 200, 1, 200, '2022-08-06 05:59:09', '2022-08-06 05:59:09'),
(21, 20, 8, 200, 1, 200, '2022-08-06 21:59:00', '2022-08-06 21:59:00'),
(24, 23, 6, 200, 1, 200, '2022-08-09 02:03:21', '2022-08-09 02:03:21'),
(25, 24, 12, 1055, 1, 1055, '2022-08-09 02:18:50', '2022-08-09 02:18:50'),
(28, 27, 15, 5000, 1, 5000, '2022-08-12 00:58:39', '2022-08-12 00:58:39'),
(29, 28, 1, 650, 2, 1300, '2022-08-12 02:38:43', '2022-08-12 02:38:43'),
(30, 29, 1, 650, 2, 1300, '2022-08-12 02:39:20', '2022-08-12 02:39:20'),
(31, 30, 1, 650, 2, 1300, '2022-08-12 02:40:25', '2022-08-12 02:40:25'),
(32, 31, 1, 650, 2, 1300, '2022-08-12 02:40:37', '2022-08-12 02:40:37'),
(33, 32, 1, 650, 2, 1300, '2022-08-12 02:50:30', '2022-08-12 02:50:30'),
(34, 33, 1, 650, 2, 1300, '2022-08-12 02:58:34', '2022-08-12 02:58:34'),
(35, 34, 1, 650, 2, 1300, '2022-08-12 03:00:15', '2022-08-12 03:00:15'),
(36, 35, 1, 650, 2, 1300, '2022-08-12 03:00:51', '2022-08-12 03:00:51'),
(37, 36, 1, 650, 2, 1300, '2022-08-12 03:03:11', '2022-08-12 03:03:11'),
(38, 37, 1, 650, 2, 1300, '2022-08-12 03:03:21', '2022-08-12 03:03:21'),
(39, 38, 1, 650, 2, 1300, '2022-08-12 03:03:36', '2022-08-12 03:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'عرض المشرفين', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(2, 'حذف المشرفين', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(3, 'تعديل المشرفين', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(4, 'اضافة مشرف', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(5, 'عرض البانر', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(6, 'تعديل البانر', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(7, 'اضافة البانر', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(8, 'حذف البانر', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(9, 'عرض التجار', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(10, 'تعديل التجار', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(11, 'حذف التجار', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(12, 'عرض العملاء', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(13, 'حذف العملاء', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(14, 'عرض التصنيفات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(15, 'تعديل التصنيفات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(16, 'حذف التصنيفات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(17, 'اضافة تصنيفات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(18, 'عرض الطلبات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(19, 'عرض المنتجات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(20, 'تعديل المنتجات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(21, 'حذف المنتجات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(22, 'الاشعارات العامة', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(23, 'عرض التقارير', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(27, 'عرض الشروحات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(29, 'حذف شروحات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(30, 'اضافة شروحات', 'admin', '2022-08-08 00:48:43', '2022-08-08 00:48:43'),
(31, 'عرض اعدادت الفلتر', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(32, 'عرض تواصل معنا', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(33, 'الرد علي تواصل معنا', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(34, 'حذف تواصل معنا', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(35, 'عرض الدول', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(36, 'تعديل الدول', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(37, 'اضافة الدول', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(38, 'حذف الدول', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(39, 'عرض الصلاحيات', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(40, 'تعديل الصلاحيات', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(41, 'اضافة الصلاحيات', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(42, 'حذف صلاحيات', 'admin', '2022-08-08 00:57:19', '2022-08-08 00:57:19'),
(43, 'محتوي الرئيسية', 'admin', '2022-08-08 01:07:51', '2022-08-08 01:07:51'),
(44, 'حذف الطلبات', 'admin', '2022-08-08 06:12:27', '2022-08-08 06:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0 means not approved yet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `main_image`, `title`, `provider_id`, `category_id`, `price`, `details`, `created_at`, `updated_at`, `status`) VALUES
(1, '1.png', 'فلتر جديد', 5, 3, 650, 'فلتر جديد 4 شمعة سعة 6 لتر', '2022-07-15 15:04:54', '2022-07-31 02:07:08', '1'),
(3, 'assets/uploads/products/95001659384741.webp', 'منتج 2', 2, 2, 500, 'تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيلتفاصيل تفاصيل تفاصيل', '2022-08-01 22:12:21', '2022-08-01 22:12:21', '0'),
(4, 'assets/uploads/products/72851659384959.webp', 'منتج 2', 2, 2, 500, 'تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيلتفاصيل تفاصيل تفاصيل', '2022-08-01 22:15:59', '2022-08-03 06:58:35', '1'),
(5, 'assets/uploads/products/77791659385055.webp', 'منتج 2', 2, 2, 500, 'تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيلتفاصيل تفاصيل تفاصيل', '2022-08-01 22:17:35', '2022-08-03 06:58:37', '1'),
(6, 'assets/uploads/products/8841659706201.webp', 'منتج', 4, 3, 200, 'منتج', '2022-08-05 15:30:01', '2022-08-05 18:23:55', '1'),
(7, 'assets/uploads/products/20151659716804.webp', 'منتج', 6, 2, 258, 'منتج', '2022-08-05 18:26:44', '2022-08-05 18:26:58', '1'),
(8, 'assets/uploads/products/91531659729018.webp', 'منتج', 10, 1, 200, 'منتج', '2022-08-05 21:50:18', '2022-08-05 22:00:46', '1'),
(10, 'assets/uploads/products/35131659796522.webp', 'فلتر ٥ مراحل', 9, 1, 550, 'فلتر ٥ مراحل بخاصية التعقيم', '2022-08-06 16:35:22', '2022-08-08 00:11:47', '1'),
(11, 'assets/uploads/products/30381659988996.webp', 'منتج', 10, 2, 200, 'منتج', '2022-08-08 22:03:16', '2022-08-09 02:13:21', '1'),
(12, 'assets/uploads/products/38811660003968.webp', 'تيتي', 11, 1, 1055, 'ايتيت', '2022-08-09 02:12:48', '2022-08-09 02:13:19', '1'),
(13, 'assets/uploads/products/56461660004826.webp', 'وبب', 12, 2, 15800, 'رذوذوذ', '2022-08-09 02:27:07', '2022-08-09 02:27:19', '1'),
(14, 'assets/uploads/products/2141660254159.webp', 'تيست منتج', 13, 2, 1500, 'اي خصائص', '2022-08-11 23:42:39', '2022-08-11 23:42:39', '0'),
(15, 'assets/uploads/products/53311660258335.webp', 'محطه ٥م', 16, 1, 5000, 'محطه ٥م', '2022-08-12 00:52:15', '2022-08-12 00:56:08', '1');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(2, '6.png', 1, '2022-07-16 17:37:52', '2022-07-16 17:37:52'),
(3, 'assets/uploads/products/19771659384959.webp', 4, '2022-08-01 22:15:59', '2022-08-01 22:15:59'),
(4, 'assets/uploads/products/21131659385055.webp', 5, '2022-08-01 22:17:35', '2022-08-01 22:17:35'),
(5, 'assets/uploads/products/34201659385055.webp', 5, '2022-08-01 22:17:35', '2022-08-01 22:17:35'),
(6, 'assets/uploads/products/71021659706201.webp', 6, '2022-08-05 15:30:01', '2022-08-05 15:30:01'),
(7, 'assets/uploads/products/31911659716804.webp', 7, '2022-08-05 18:26:44', '2022-08-05 18:26:44'),
(8, 'assets/uploads/products/7891659729018.webp', 8, '2022-08-05 21:50:18', '2022-08-05 21:50:18'),
(10, 'assets/uploads/products/23071659796522.webp', 10, '2022-08-06 16:35:22', '2022-08-06 16:35:22'),
(11, 'assets/uploads/products/43071659988996.webp', 11, '2022-08-08 22:03:16', '2022-08-08 22:03:16'),
(12, 'assets/uploads/products/381660003968.webp', 12, '2022-08-09 02:12:48', '2022-08-09 02:12:48'),
(13, 'assets/uploads/products/171660004827.webp', 13, '2022-08-09 02:27:08', '2022-08-09 02:27:08'),
(14, 'assets/uploads/products/71891660254159.webp', 14, '2022-08-11 23:42:39', '2022-08-11 23:42:39'),
(15, 'assets/uploads/products/84031660258335.webp', 15, '2022-08-12 00:52:15', '2022-08-12 00:52:15'),
(16, 'assets/uploads/products/2141660258335.webp', 15, '2022-08-12 00:52:15', '2022-08-12 00:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `governorate_id` bigint(20) DEFAULT NULL,
  `nationality_id_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_number_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `logo`, `first_name`, `last_name`, `store_name`, `phone_code`, `phone`, `country_id`, `governorate_id`, `nationality_id_image`, `vat_number`, `vat_number_image`, `commercial_number`, `commercial_number_image`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'احمد', 'محمد', 'متجر السعادة', '+20', '1099999999', 1, 20, '1.png', '123456', '2.png', '123456789', '3.png', 'الثاهرة شارع الجامعة', '1', '2022-07-15 15:03:30', '2022-07-15 15:03:30'),
(2, 'assets/uploads/providers/56681657941523.webp', 'محمد', 'خالد', 'متجر السعادة', '+20', '1098712354', 1, 2, 'assets/uploads/providers/61461657941523.webp', '12300', 'assets/uploads/providers/65061657941523.webp', '10245', 'assets/uploads/providers/92961657941523.webp', NULL, '1', '2022-07-16 03:18:43', '2022-07-16 03:18:43'),
(3, NULL, 'خالد', 'ياسر', 'متجر السعادة', '+20', '1154784758', 1, 5, 'assets/uploads/providers/4621657941746.webp', '54989', 'assets/uploads/providers/79171657941746.webp', '20554', 'assets/uploads/providers/28971657941746.webp', NULL, '1', '2022-07-16 03:22:27', '2022-07-16 03:22:27'),
(4, 'assets/uploads/providers/44111657941850.webp', 'محمد', 'منصور', 'متجر جديد', '+20', '1098747414', 1, 14, 'assets/uploads/providers/91171657941850.webp', '0144889', 'assets/uploads/providers/80071657941850.webp', '654789', 'assets/uploads/providers/52881657941850.webp', NULL, '1', '2022-07-16 03:24:10', '2022-08-08 00:09:41'),
(5, 'assets/uploads/providers/65141658966521.webp', 'ابراهيم', 'محمد', 'متجر السعادة', '+20', '10101145574', 1, 27, 'assets/uploads/providers/28081658779534.webp', '1212354', 'assets/uploads/providers/38241658779534.webp', '55124', 'assets/uploads/providers/52991658779534.webp', NULL, '1', '2022-07-25 22:05:34', '2022-08-12 02:31:26'),
(6, NULL, 'محمد', 'منصور', 'متجر جديد', '+20', '10101145577', 1, 12, 'assets/uploads/providers/96201659180239.webp', '12123547', 'assets/uploads/providers/81341659180239.webp', '551247', 'assets/uploads/providers/31361659180239.webp', NULL, '1', '2022-07-30 13:23:59', '2022-08-07 23:56:25'),
(7, NULL, 'محمد', 'احمد', 'تاجر', '+20', '1066174066', 1, 1, 'assets/uploads/providers/55441659180780.webp', '36588888', 'assets/uploads/providers/7481659180780.webp', '3368888', 'assets/uploads/providers/82421659180780.webp', 'عنوان', '1', '2022-07-30 13:33:01', '2022-07-30 13:33:01'),
(8, NULL, 'محمد', 'منصور', 'متجر جديد', '+20', '10987477845', 1, 12, 'assets/uploads/providers/8841659385497.webp', '454', 'assets/uploads/providers/46951659385497.webp', '54', 'assets/uploads/providers/50671659385497.webp', NULL, '1', '2022-08-01 22:24:57', '2022-08-04 13:16:11'),
(9, NULL, 'محمد', 'محمد', 'بيوركم', '+20', '1111111111', 1, 1, 'assets/uploads/providers/86691659682114.webp', '66666', 'assets/uploads/providers/62631659682114.webp', '666666', 'assets/uploads/providers/2381659682115.webp', 'بنها', '1', '2022-08-05 08:48:35', '2022-08-11 21:28:57'),
(10, NULL, 'محمد', 'احمد', 'تاجر', '+20', '1066174022', 1, 1, 'assets/uploads/providers/13621659703019.webp', '٧٣٧٣٧٧٣٧٧', 'assets/uploads/providers/44381659703019.webp', '٨٨٢٨٧٧٢٧٢٧٧', 'assets/uploads/providers/10221659703019.webp', 'عنوان', '1', '2022-08-05 14:36:59', '2022-08-05 14:36:59'),
(11, NULL, 'تر', 'ور', 'bx', '+20', '1096861418', 1, 1, 'assets/uploads/providers/59391660003100.webp', 'jddh', 'assets/uploads/providers/34381660003101.webp', 'rir9', 'assets/uploads/providers/68431660003101.webp', 'bfc', '1', '2022-08-09 01:58:21', '2022-08-09 01:58:21'),
(12, 'assets/uploads/providers/83311660004785.webp', 'ربر', 'ذوذوذ', 'nxnx', '+20', '12390215', 1, 1, 'assets/uploads/providers/48291660004785.webp', 'jdjdj', 'assets/uploads/providers/18581660004786.webp', 'bcb', 'assets/uploads/providers/26701660004787.webp', NULL, '1', '2022-08-09 02:26:27', '2022-08-09 02:26:27'),
(13, NULL, 'احمد', 'ابراهيم', 'blue', '+20', '1012390216', 1, 1, 'assets/uploads/providers/45021660254075.webp', 'dbxhdh', 'assets/uploads/providers/76401660254075.webp', 'gdhdh', 'assets/uploads/providers/33421660254076.webp', NULL, '1', '2022-08-11 23:41:16', '2022-08-11 23:41:16'),
(14, NULL, 'ورو', 'ورور', 'bcnc', '+20', '1060568810', 1, 1, 'assets/uploads/providers/24581660255116.webp', 'ggf', 'assets/uploads/providers/33751660255116.webp', 'hhd', 'assets/uploads/providers/13131660255117.webp', NULL, '1', '2022-08-11 23:58:37', '2022-08-11 23:58:37'),
(15, NULL, 'رزد', 'اال', 'vvcc', '+20', '1090123215', 1, 1, 'assets/uploads/providers/27111660255542.webp', 'gfd', 'assets/uploads/providers/77271660255543.webp', 'gfd', 'assets/uploads/providers/91391660255543.webp', NULL, '1', '2022-08-12 00:05:43', '2022-08-12 00:05:43'),
(16, NULL, 'ميدو', 'ميدو', 'بيور ووتر', '+20', '2222222222', 1, 3, 'assets/uploads/providers/74801660258102.webp', '8888888', 'assets/uploads/providers/79811660258102.webp', '888888', 'assets/uploads/providers/2171660258103.webp', 'اول الطريق', '1', '2022-08-12 00:48:23', '2022-08-12 00:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'الدعم الفني', 'admin', '2022-08-08 01:12:07', '2022-08-08 01:12:07'),
(2, 'مدخل الصلاحيات', 'admin', '2022-08-08 02:23:35', '2022-08-08 02:23:35'),
(3, 'اضافة الادمنز', 'admin', '2022-08-08 03:13:16', '2022-08-08 03:13:16'),
(4, 'تحكم كامل للادمنز', 'admin', '2022-08-08 03:33:57', '2022-08-08 03:33:57'),
(5, 'سوبر ادمن', 'admin', '2022-08-08 03:56:35', '2022-08-08 03:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(1, 4),
(1, 5),
(2, 4),
(2, 5),
(3, 4),
(3, 5),
(4, 3),
(4, 4),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
(23, 5),
(27, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 1),
(32, 5),
(33, 1),
(33, 5),
(34, 1),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 2),
(39, 5),
(40, 2),
(40, 5),
(41, 2),
(41, 5),
(42, 2),
(42, 5),
(43, 5),
(44, 5);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snap_chat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `logo`, `about_us`, `terms`, `privacy`, `facebook`, `insta`, `twitter`, `snap_chat`, `whatsapp`, `created_at`, `updated_at`) VALUES
(1, 'تطبيق الفلتر', 'assets/uploads/logo.png', 'مرحبا بك في الإصدار الأول من تطبيق الفلتر\r\n* نبذه عن التطبيق *\r\nتطبيق الفلتر يتيح لك متابعة الصيانات الدوريه الخاصه بالفلتر لديكم عن طريق ارسال اشعارات بمواعيد تغيير الشمعات وفقا لآليه اتوماتيكيه \r\n** بالاضافه الى توفر مكتبه ضخمه من الاعطال والشروحات التي سوف تساعدك على تحديد الاعطال والمشاكل في الفلتر ومساعدتك في حلها\r\n** ايضا يوجد في التطبيق متجر الكتروني يحتوي على اجهزة فلاتر ماركات متنوعه وجوده ممتازه تناسب كل الفئات ويشمل المتجر ايضا على قطع الغيار والشمعات الخاصه بالفلتر \r\nشكرا لاختيارك تطبيق الفلتر \r\n\r\nلا تتاخر في التواصل معنا في اي وقت .. فنحن يهمنا راحتك', 'أن يكون المستخدم ذا أهلية قانونية كاملة للتعاقد والتعامل. اذا كان المستخدم عمره يقل عن 18 عاما يستوجب عليه ان يقوم بالحصول على موافقة والديه أو وصيه للقيام بذلك. ان يقر ويتعهد المستخدم بانه يتمتع بالحق والقدرة القانونية على استخدام موقع وتطبيق معاك حسب ما هو منصوص عليه في هذه الشروط والأحكام.', 'نحن سعداء بكونكم احد عملائنا ، الأمر الذي يستدعي قبولكم الضمني لسياسه الخصوصية الخاصة بتطبيق الفلتر.\r\n\r\nهذا الإشعار بالإضافة إلى سياسه الخصوصية الخاصّين بتطبيق الفلتر، يُحددان نوع المعلومات اللازم جمعها عن مستخدمين التطبيق من اجل تقديم الخدمة وتنفيذ طلبات عملائنا بالشكل المناسب .\r\n\r\nتنظم هذه الوثيقة مُعالجه بيانات العملاء من نواحي الجمع ، و التخزين ، والولوج ، والاستخدام ، و أخيراً الإهلاك ، بجانب أي صوره اخرى مستلزمة لتقديم الخدمة.\r\n\r\nالغرض من جمع أي معلومات عن العميل هو إدارة العمل اليومي بقطاعاتنا من أجل تقديم الخدمة ، بالإضافة إلى تحسين تجربة المستخدمين  ،  ، فضلاً عن الإدارة السليمة للحجم الهائل من المعلومات الشخصية. نحن مستمرون في تعزيز ثقة المستخدم في طريقة تعاملنا مع المعلومات الشخصية الخاصة بهم وتقديم الخدمات بشكل متميز.\r\n\r\nمتى نقوم بجمع معلومات الشخصيه ؟\r\nعلى سبيل المثال، نجمع معلوماتك الشخصية عند:\r\n\r\nشراء أو استخدام أي من منتجاتنا وخدماتنا.\r\n\r\nالاتصال بنا من خلال قنوات الاتصال المختلفة، أو طلب معلومات حول منتج أو خدمة ما.\r\n\r\nما هي المعلومات التي نجمعها عنك ؟\r\n\r\n\r\nعند الضرورة، قد نجمع:\r\n\r\nاسمك وعنوانك و / أو رقم هاتفك و / أو رقم هاتفك المحمول وعنوان بريدك الإلكتروني \r\n\r\nبيانات الاتصال الخاصة بك. وهي البيانات التي نتعرض لها كمتطلب من متطلبات اتمام عملية الشراء', 'https://www.facebook.com/elfiltar/', 'https://www.instagram.com/', 'https://www.twitter.com/', 'https://youtube.com/channel/UCAYPCiff9B8Yjlk74yRF7cQ', '+201098877778', '2022-07-12 14:16:58', '2022-07-12 14:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(2, 1, 'assets/uploads/sliders/74241659542078.webp', '2022-08-01 23:44:05', '2022-08-03 17:54:38'),
(3, 1, 'assets/uploads/sliders/11611659542208.webp', '2022-08-03 17:56:48', '2022-08-08 00:28:46'),
(4, 10, 'assets/uploads/sliders/91021660246247.webp', '2022-08-11 21:30:48', '2022-08-11 21:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `software_type` enum('ios','android') COLLATE utf8mb4_unicode_ci DEFAULT 'android',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `provider_id`, `phone_token`, `software_type`, `created_at`, `updated_at`) VALUES
(4, 3, NULL, 'eHfYPI22TR6hNae9HpNz88:APA91bGBWD9y_4O_fNOUSOAaOPmqgpyiwU_wKSkQzNl_uY7Goblp5L_1dRFob5D1AqqE81N_SKxtfQVhFbGIUZjmM72Srix4yAv13wChPBrnXpujrHfbpWVKfGxQ4bShZ_cG9UPacgs7', 'android', '2022-07-17 20:37:36', '2022-07-17 20:37:36'),
(7, 4, NULL, 'fqYfIeRFSDeE8-tDBHrR7S:APA91bEo6PU2bzc5VPbcvFNXufhijrb1A06q1kDZHcaQUqVp0dHhGy31Qk6ivclI72bwrbxoNZeXVO6X0kkL0iYEPeEgISypMna8Meib26u9GlyqNgi5qNUi8vDm1pdzYL2ajS1hXA4U', 'android', '2022-07-17 23:37:32', '2022-07-17 23:37:32'),
(8, 5, NULL, 'cnb4H5-xQ8up-L25X4d4M9:APA91bHwgjEgPU1aUzABBwV7ezOrhXzspWPsJBivz0dTczQVCeZ12dxns9yL3xNHiFJk-vsYgBaLknISME892S4PtX64tKtbinochPNJD-mR5t3zncUfQO-A3vGQ1MI7bcSBLEInQ6jo', 'android', '2022-07-17 23:54:56', '2022-07-17 23:54:56'),
(9, 3, NULL, 'dJGGcyMTTpiFVQMLPZm-iE:APA91bF1gxqDlZOz_v0RNvkaBJZkYZnjO8GoVLJNJVVc6oAxCXIwIj7-duNdcGvbv7kqTmP-QXKmkTh6wEvpbub0Lr9tElBxZgJcMPnRrjavsBNJucdC_3tz1vfcFl31b2LAPMl0Rbd0', 'android', '2022-07-18 11:26:53', '2022-07-18 11:26:53'),
(10, 5, NULL, 'd_kBF1DXQjO19WQL61dJXX:APA91bEJQtVPThCwtfJbD_a717WByOsjOeiglrjU0MAnZOf4sHu_eIJObox2rfr0CwMogBdR1r800TW-iBaskvHDpRjyH2U4M8rSzhCx62ZN4pNhyOThzA72njJQt7V3DJ-_jhYPvr4S', 'android', '2022-07-18 13:44:43', '2022-07-18 13:44:43'),
(11, 3, NULL, 'eOQWRRFYRdK9Y3XEbC-pp8:APA91bHbJlWwRfJr4XCizFklwk7sbfo9JGcFxVrafyjOOCoqDO7Db8kQGGxwq7ZUxE5lCvqKxYV8j-oeZGP3D6qR1w6pABjgilSJrPVhmZU5mg-9wFMZbeT2El5q9AhTaG8qIEuYftNd', 'android', '2022-07-18 14:09:24', '2022-07-18 14:09:24'),
(12, 3, NULL, 'dp3LE2sqSVideEQt2Q4Mb5:APA91bGt-EiVYN1VLqqSC1IwcPZzTuVshnDdTFlwzMoq9_wKNwPPG8ORiAe7EeZ2OQF--0j_NL27dpZLZf_NDL-8jlUfNzfbASWZDP7lHDO1FAGs9sl2FRIhUeWROlSXM6tkAL2RV8kt', 'android', '2022-07-18 18:58:01', '2022-07-18 18:58:01'),
(13, 3, NULL, 'dp3LE2sqSVideEQt2Q4Mb5:APA91bGt-EiVYN1VLqqSC1IwcPZzTuVshnDdTFlwzMoq9_wKNwPPG8ORiAe7EeZ2OQF--0j_NL27dpZLZf_NDL-8jlUfNzfbASWZDP7lHDO1FAGs9sl2FRIhUeWROlSXM6tkAL2RV8kt', 'android', '2022-07-18 18:58:01', '2022-07-18 18:58:01'),
(14, 3, NULL, 'fRs-4r2NTWeRpfu9uBF1vS:APA91bF7M65DmIAQUKjzMUOn7X2zZMmrVdQ98csInWC0Z1VIOwfowiuNA4mtkK_1lhawF_yKe_n-YQEFPdVQ2_M9YuA8laftcN7DrEjoL_G9IHLXd9aloqYe_0SA3_6WAYHw8AdajkeX', 'android', '2022-07-18 18:59:10', '2022-07-18 18:59:10'),
(15, 6, NULL, 'dihCVj1xQ5OTxVztWnm5l8:APA91bExWmY2IcJQ3WtsI3WzUlfVqlrr8l-FXmWMp4hnbZ26EfIrrOMflrt3heAbT-owbhRJLi7rlU4g4aIV2Sz93JcrImHKURSY0M11WYPyIsXC_oKsRLbgu5TwrvurEwYsGH9CTeZd', 'android', '2022-07-18 21:16:13', '2022-07-18 21:16:13'),
(16, 3, NULL, 'fZoDe22BTFyuE6m725ryp4:APA91bH3aMRvWu-0QmJbluvl59Hz2CxYdkywsG8MWJFakA06sT0x58iT1b0bPfxMMSM4H2RHK-3N2nkuAS9C6U1Q2Vxt_3ndK7q1Xs6DLz_IiuSuO1h1TrPj9Gatn9mH0xFY9kS-nzLR', 'android', '2022-07-18 21:17:31', '2022-07-18 21:17:31'),
(17, 5, NULL, 'ea-0uSPHS_ihcSXRoWArYL:APA91bG65_sYH8C8ggwuKrgh2mO82vwNc10eAnIAgSVVNMzxD-MMxeXGCop5s1Wu9nPp7oDgrY-aR7dIW0WJJLUUB3tJUGDeTAZzEsbRYvNCBT7sIVC-WAlcf9cnYxr3tda3UJH4Eh18', 'android', '2022-07-18 22:03:18', '2022-07-18 22:03:18'),
(18, 3, NULL, 'dE3uV4-ESz-mjocRc5XWpJ:APA91bHhzQy__I89SfXRrA-0hS6i3fiu34da3wLkQ2PmP0Uz_rUFkKXtH1XH1TYIxcXFSASZHJgEavudzftSliDfSgyJ7xz2FVka21nQQ5MlYfpnMqGCrydh7P866jDFqPiEQM_IirXz', 'android', '2022-07-18 22:05:17', '2022-07-18 22:05:17'),
(19, 3, NULL, 'djw5nLwIRL-emHy2IpBQyc:APA91bH7gmV6skvezTuCPzJbfZT3EPSQz9qKZgFHFc5OfJWkn7TOMKbEmcQj1s_aaUFImv-YzbwID2H_hso9LN2-CNqKOGaWpUwbPj4XG-F0nUIC6FILnCzW9NURaFnYhlO9EOqxHut6', 'android', '2022-07-18 22:10:15', '2022-07-18 22:10:15'),
(20, 7, NULL, 'eUn80xpRTdCuLeSPp9yi45:APA91bHTLklGJbv1_56ckDwH5b8I-fpnmH6acM66M1beQqdnz2MKfpzFurOg_s_BG5ERx-MCq1hUqFfq0B5SvrFNCKf9IrMjjod_Od1fHZYByDEY3kKIL9ChfXIWljBT6NeOIExU3QER', 'android', '2022-07-18 22:49:11', '2022-07-18 22:49:11'),
(21, 3, NULL, 'cd3OzGHzQ9yUCmTKcheB6g:APA91bGITq6J-jrZcoKHUx5rA4xmd6-Xe1KNsBWX6MOkCd2PBJg-J_rbi4ooempplvPY5nVMJI9ub_3YIDlZhrucR3-UG_2pizhlfgy8lfDJqKNhqIlOx2HVmTok8b1ATwwnoyHlXHA6', 'android', '2022-07-18 22:53:26', '2022-07-18 22:53:26'),
(22, 8, NULL, 'elZVqsGKS3elJZsJUFIB5y:APA91bH8bTdB46F0UNVRbym4owssgVoVYExoM1DROglKKPNESkYgAytvo29H04stOeNwTf9jnQpGOF_6RPTde_A3hR_VqJjvpzelHzM-Fai7acyd_wB_ZyxybZxfeIKoF9BHF4v071ng', 'android', '2022-07-19 00:21:36', '2022-07-19 00:21:36'),
(25, 10, NULL, 'cwkcXOHSTJKrk6dbPSfNP_:APA91bFDaY2-JnY3u94nioqxOvfbm0lETBiZHyr5cx-YUgti0XiRu0dIJsduPpi0lqWBrBTv4p0M9O4GAIQNrEw08n-nZ7C2l6rMDbbJ4qi-C-Mo9hpJW3Hu0ZGboKqnmkXKkfQ3a5T_', 'android', '2022-07-22 00:43:39', '2022-07-22 00:43:39'),
(26, 3, NULL, 'cd3OzGHzQ9yUCmTKcheB6g:APA91bHsfPZ3Vx7exBS-qTN6TK1ALop6qgMxbR83QinhfNuNxvGnoWv_JAnwUyq7ttY2ZLYJC0TGbt0DwmpA0frt1odG1dDan5-sbszec8oI-jiC_KMFDAcYfl3geo_RI1VNlTg4SrMr', 'android', '2022-07-30 12:41:21', '2022-07-30 12:41:21'),
(27, 3, NULL, 'cd3OzGHzQ9yUCmTKcheB6g:APA91bF7y_x5f0827BYrGQN_sCYnRo8WPHA7vdC21n9tvmWY5jYyRuGqCFoZeA7ahgRD4IeLsjGXK-svc0A8Cabz9k2PVM6gGXiMQq9SOlh4vyIIizWh2yFMiSAY5S-x5DduRQE8y1ng', 'android', '2022-07-30 12:52:33', '2022-07-30 12:52:33'),
(28, 22, NULL, 'fT9P7K73TrmqnS7rGJQK19:APA91bFaejijPyK4f5XD6qZNjNmM-Gq7dY3mU9cU-3omGuKaopsbWLgMEIqF0YmfrJXlCucaxRAYsRKThWFRgFqM_tDQy25ARUlCM0lkQjSKIqGOS2n9CSK0dib30GKEjNMzxBEAd7eW', 'android', '2022-07-30 13:28:00', '2022-07-30 13:28:00'),
(29, 7, NULL, 'deCxOyHQRqCpOvetJ4bY_d:APA91bEFoXv9aThm8W5xT7qoHo5FpTxRHArAYksmtEAbyifrTBpL1IYos6lER-DnTLHYNH9PnEqp1g8BCXpaFl9O2Yr9s5_uXr3nLtSGcyEWZILulz4nWgT7ugGAMYmguwkKkP0qE0f0', 'android', '2022-07-30 13:33:52', '2022-07-30 13:33:52'),
(30, 3, NULL, 'fYfuRT3VTFa8bjn63wnYqK:APA91bFhuGE7bo3p6eIy-3YB8UOJm5CIzVwm-aCXGAHRK02yeNAXTYMhIKC4l9BuPOoQu3bpPuggP4S764_lbbBVcI5DL2rTWpsHD8GB1XjW-wTLlTre4Jfm1UdkEuFsuSawFuQfZa1p', 'android', '2022-07-30 17:36:33', '2022-07-30 17:36:33'),
(31, 23, NULL, 'd3FGWySvTQyscgXMt3nscz:APA91bGXOvctLoWC1V8URQiSzit0-RPSz2LBLJl_CmmfsukxZDMv2cXgUp6whkM0ANMjv4eWlX_sh-NCeDOuZ-QjlcoT7d4YrYOV0Jyad-0vW0ciphWYs_EY7VKENNIP8taHILAjBvuz', 'android', '2022-07-30 17:39:52', '2022-07-30 17:39:52'),
(33, 5, NULL, 'cxmJibFDSM-4FEWprEV5Lc:APA91bEAzgU5yVSNYpitsTcFRH6w7O9nUW36CMVk7nF8jI0XdgHOLao9GRDB38fwrP1a6TlHUTLwb3X9uIRXob7s7qysNalzKsSuzwnJ7Dxpyr5zPMHAkuojsJq_kXrbz1qtRqXzbFTb', 'android', '2022-07-30 20:33:39', '2022-07-30 20:33:39'),
(36, 24, NULL, 'eiJy8qYcToCAAw7egNUIPw:APA91bEUsZo0EKPDCqLmaNQvKbKj_U9F-sOoF7Vp2ciUf6qMWIYJmuExGKqshE_OLpraSraqlNiL25MMoUqc5CJnO8wQvXqgsgAjyHHMZNGw_cyEnWs_oO11dllrDM6Gn29pN2gydlIG', 'android', '2022-07-30 20:55:29', '2022-07-30 20:55:29'),
(41, 3, NULL, 'cd3OzGHzQ9yUCmTKcheB6g:APA91bGyK1kuh3H-vSjQ_do5QVcnT8AWdl2lAkJwhx_bP9E1moSMGtDJCUAzdkXY1-edFNiYTtxqOi6rWMLUy06Q_FFevFxU_wLLXSUvDaTJa2bmzoAFOrzRNNMVm9AfsB05E93k-qsV', 'android', '2022-07-31 20:07:08', '2022-07-31 20:07:08'),
(42, 3, NULL, 'cd3OzGHzQ9yUCmTKcheB6g:APA91bGyK1kuh3H-vSjQ_do5QVcnT8AWdl2lAkJwhx_bP9E1moSMGtDJCUAzdkXY1-edFNiYTtxqOi6rWMLUy06Q_FFevFxU_wLLXSUvDaTJa2bmzoAFOrzRNNMVm9AfsB05E93k-qsV', 'android', '2022-07-31 20:07:08', '2022-07-31 20:07:08'),
(44, 8, NULL, 'elZVqsGKS3elJZsJUFIB5y:APA91bGTUn91i1S-WHEYBWQEpa9xc5f5pu0emhGIWJkBtOjK_tA2GTrW8JYixM3HLn-bQZwbsT9wm45QqR8lZd1hKxv-Mg5JpCJtFZJkPlNoaYb3cchW419bSxmI7hhG72C1_TqI_5M8', 'android', '2022-08-01 12:24:11', '2022-08-01 12:24:11'),
(46, 5, NULL, 'frR1RHQaQGu2C7H6dzeBFJ:APA91bFCS7SsVKxIyGnI740w-XXuMMxUM3CLNjBqIFXKc6T_9IhtKkvsSyqJ-R-n1-fQ8r3xMRk2laF9RCuHaGouLC0TarCW0ZirLIVg33j8BJTnlMRFAWkqmhG4S4S7jkZ4g6CAqgm7', 'android', '2022-08-01 13:33:50', '2022-08-01 13:33:50'),
(52, 24, NULL, 'eUHbsGzWT56iQNwCG0Ny-n:APA91bGC1RnNzWUp0Beg_jQR4VQAYKXpf5PLfglPUyHPZfCopjIAY2_zdlvey9-I0I-3ly4gmPXLq0wDYPBStz7razk--c0o2qYhcATAqwaSng8C8yzXgzA4dUDhr-iieAu12WqqvmTW', 'android', '2022-08-01 16:15:30', '2022-08-01 16:15:30'),
(65, 26, NULL, 'egmy-vI7R5ekDcDOlffkFW:APA91bEif9kgOsoCFa_V0ju7GTHWNZ8tKrDBwj_DIXFH57bhKhkc0kjVnRScV-lU__bev8xx7V-qBCME0NZEZAz4xMB9me8Ml4U7JVAtVGKbvmA5q7wyeGCrtl1v_WuvDtQUdf8fZ41T', 'android', '2022-08-04 16:57:23', '2022-08-04 16:57:23'),
(84, 5, NULL, 'evYoa-iKSI2Za9MKaS7lqG:APA91bF4SJnOmLZShD5gc3xF1BNVMU4h8SHG_YuV1DZYWDWtRvkwTswUdkCQ2P8p5vtsfbftkwPM9GEhqR0aIvWWA2L05wlJO3VgGy6FWn7MY_w6rNnexvLLAaEy4wuy1f6DBXAFeG3Y', 'android', '2022-08-06 07:58:01', '2022-08-06 07:58:01'),
(88, NULL, 4, 'dtCXPnugSUuGZgOfx1k53p:APA91bFPhf-n9HhqI9xF04pvweT1mvmXree7Ab1Opd8MjDmmIz9YMoHV4duP9VLn0dvPAiHmhiSYOZqwlYh44C_92JBlw2jVW5oAk9FLiU3E5pFM4TrGCl0dwG6_rwJM2Tscx2VKLoK3', 'android', '2022-08-06 16:51:26', '2022-08-06 16:51:26'),
(89, 28, NULL, 'fQpKErqAQMKmPeVwkfO1kl:APA91bEyRgYkxPCHz8o7PXSKhWKj-dfBJRjGkzLFng4IJ2pBOu-uMU3lHyR9DmN63STl_os0_x71igZad2VTeLy7cL14uk2G79K2d54fkU54ZXNqXqLIAQAxci4CmZWkyYdmx3uUG5Xr', 'android', '2022-08-06 18:01:33', '2022-08-06 18:01:33'),
(97, 5, NULL, 'dO6XawyxTS69kFqj5angi9:APA91bH5N5Wh-ZWismik0XtawIyWQg1ZnIXKW2IHF8tBb1fN6cAerl8MZycJxNM1nNZYPM0QafNhckRrZOqHXfpjBQf1kSJTOwWATS8mPCbNQHPGrJlJonKXHv_BXeFUTTLEgDVJvyQE', 'android', '2022-08-07 23:36:18', '2022-08-07 23:36:18'),
(98, 7, NULL, 'fItL2JzCR4Sj6khqr0Nw1F:APA91bGqEDVsNnrePNPETAaQ1bvL7fa_A-ZNU5z0ksgTOx0B4ge4sONZm9SU23Rvl8LHd0_fkPmJoaha_Ve-FCVuhcAo98yr9kQLgr3APIYCJ8Qg4JQbKKkM-BwG4Wrcxu3873bD7jCb', 'android', '2022-08-08 00:15:37', '2022-08-08 00:15:37'),
(116, 5, NULL, 'e2DlsRiITxeXsbEk_ETpBe:APA91bFM_1IuymgoDq_11AG6eaHuC6D6eDgrk7vYK7ZOsJ5yibp2cSe97qfUv9wxgaXPDQZMFWAtCEHZqnq8gjhRSd7r_qTqiQFg8P64zvDJJPxhrrXCDKN_C0qcoI9FPdQgZlr58lAJ', 'android', '2022-08-09 02:11:57', '2022-08-09 02:11:57'),
(119, 28, NULL, 'fmFfGvxmSMuNEIAS9SVwlo:APA91bF9sSWLFyD3LhDdcM89U-ofvHFBLfkmnXy7ewOh772vVTaFnCKNLnP3dUisZybk4DOwKxPr2oEk0C6uo8HrW1M8yMRprraFZLeUlhrDoImY1wWXkZ4KsHUnlvo4rrASlXSRjngm', 'android', '2022-08-09 14:10:41', '2022-08-09 14:10:41'),
(126, 7, NULL, 'dw1VxQp-SwKnHT5NLTtPgk:APA91bE85MZ3wsNLn8l6YAM1s73Lh7upgVY-HPorp2pr7nZOvYQuqMdXJDSyc7Mbp6W2TiqI4CNAoIet23eLMcHm5AkDsu0xmHqGeGBXoNSy1A3MVZ7lMl6KPoeVCdzcMvDGCJqkWIMg', 'android', '2022-08-11 13:22:51', '2022-08-11 13:22:51'),
(144, 31, NULL, 'cW30oBdzStanvxqo8ELM0E:APA91bGtqWFN6JC4MsNSgje7SCV5v8Ya3eN2jZaPR9aV3gVd1JLibEK-CSNoAD9GF31mIPPBayyvB4lc3EC_YECJ9gxMbNaLvB02OxfAQ23i_Hyb1wGulM95gsqbQTKBCnyuN880yUqA', 'android', '2022-08-12 01:02:01', '2022-08-12 01:02:01'),
(153, 32, NULL, 'fItL2JzCR4Sj6khqr0Nw1F:APA91bH38fS5_3oQ8_wsnmN7fsAHEnguTS9uCwGz_PMLSHwbgonhiu2yS3b0FUVXGmwlnf9ihrzW_wx5t_DiHeVU9n70xu9KUP79pbMGVYO0g8bM3KdHYXjDHLtupYKlPUtNIjmTdhPh', 'android', '2022-08-12 03:08:21', '2022-08-12 03:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `governorate_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `candle_number` int(11) DEFAULT NULL,
  `water_type` enum('good','medium','bad') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `image`, `phone_code`, `phone`, `country_id`, `governorate_id`, `city_id`, `address`, `candle_number`, `water_type`, `created_at`, `updated_at`) VALUES
(2, 'محمد', 'سعيد', 'assets/uploads/users/3581658966483.webp', '+20', '1098745632', NULL, NULL, NULL, 'تيسيسي', 3, 'good', '2022-07-16 02:58:16', '2022-08-12 03:19:22'),
(3, 'محمد', 'احمد', NULL, '+20', '1062477474', NULL, NULL, NULL, 'شيين الكوم', 3, 'medium', '2022-07-17 19:07:45', '2022-07-29 01:39:27'),
(4, 'محمود', 'الكومي', NULL, '+20', '1015783713', NULL, NULL, NULL, 'شبين الكوم', 3, 'bad', '2022-07-17 23:36:19', '2022-07-17 23:37:27'),
(5, 'احمد', 'ابراهيم', 'assets/uploads/users/84451658094729.webp', '+20', '1097555011', NULL, NULL, NULL, 'شبين الكوم', 7, 'bad', '2022-07-17 23:52:09', '2022-08-12 03:07:19'),
(6, 'محمد', 'احمد', NULL, '+20', '1099055211', NULL, NULL, NULL, 'شنوان', 3, 'bad', '2022-07-18 21:13:20', '2022-07-18 21:25:52'),
(7, 'محمد', 'احمد', NULL, '+20', '1066174087', NULL, NULL, NULL, 'شنوان', 3, 'bad', '2022-07-18 22:47:27', '2022-08-08 23:28:18'),
(8, 'سمر', 'حلمي', NULL, '+20', '1027024171', NULL, NULL, NULL, 'شنوان', 3, 'bad', '2022-07-19 00:16:36', '2022-07-19 00:26:02'),
(10, 'احمد', 'يحيي', NULL, '+20', '1098380656', NULL, NULL, NULL, 'عنوان تيست', 3, 'bad', '2022-07-22 00:42:09', '2022-07-22 00:43:30'),
(21, 'خالد', 'تيست', NULL, '+20', '10101448789', 1, 15, NULL, 'شنوان', NULL, NULL, '2022-07-28 01:59:02', '2022-07-28 01:59:02'),
(22, 'محمد', 'احمد', NULL, '+20', '1066174077', 1, 1, 1, 'ع', 3, 'bad', '2022-07-30 12:31:59', '2022-07-30 12:32:06'),
(23, 'محمود', 'احمد', NULL, '+20', '1066174055', 1, 1, 1, 'عنوان', 3, 'bad', '2022-07-30 17:39:40', '2022-07-30 17:47:07'),
(24, 'ماجد', 'جنش', 'assets/uploads/users/65021659212446.webp', '+20', '1110518080', 1, 12, 231, 'بنها', 7, 'bad', '2022-07-30 20:54:59', '2022-08-01 16:17:19'),
(25, 'رذ', 'رذذ', NULL, '+20', '1097555015', 1, 1, 1, 'gxhx', NULL, NULL, '2022-08-04 16:53:58', '2022-08-04 16:53:58'),
(26, '‘ذوذ', 'نيني', NULL, '+20', '1064378757', 1, 1, 1, 'hxhx', 3, 'bad', '2022-08-04 16:57:01', '2022-08-04 16:57:22'),
(27, 'محمد', 'احمد', NULL, '+20', '1066174033', 1, 1, 1, 'عنوان', NULL, NULL, '2022-08-05 14:27:49', '2022-08-05 14:27:49'),
(28, 'محمد', 'عبدالله', NULL, '+20', '1066385766', 1, 12, 231, 'جمجرة', 7, 'bad', '2022-08-06 17:59:13', '2022-08-07 10:20:09'),
(29, 'مبؤنر', 'نبلنؤن', NULL, '+20', '1094899599', 1, 1, NULL, 'ملرور', 3, 'bad', '2022-08-09 15:13:32', '2022-08-09 15:13:41'),
(30, 'نىة', 'تىتت', NULL, '+20', '85888888888888888888', 1, 1, NULL, 'تتت', NULL, NULL, '2022-08-11 01:08:54', '2022-08-11 01:08:54'),
(31, 'محمد', 'ماجد', 'assets/uploads/users/67961660257638.webp', '+20', '1110464040', 1, 12, NULL, 'بنها', 7, 'bad', '2022-08-12 00:40:39', '2022-08-12 00:42:00'),
(32, 'محمد', 'احمد', NULL, '+20', '1066174011', 1, 1, NULL, 'عنوان', 5, 'bad', '2022-08-12 03:08:09', '2022-08-12 03:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_filter_clean_times`
--

CREATE TABLE `user_filter_clean_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `candle_number` int(11) DEFAULT NULL,
  `last_clean_time` date DEFAULT NULL,
  `coming_clean_time` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_filter_clean_times`
--

INSERT INTO `user_filter_clean_times` (`id`, `user_id`, `candle_number`, `last_clean_time`, `coming_clean_time`, `created_at`, `updated_at`) VALUES
(60, 4, 1, '2022-07-09', '2022-08-08', '2022-07-17 23:37:27', '2022-08-08 23:46:11'),
(61, 4, 2, '2022-08-05', '2022-11-03', '2022-07-17 23:37:27', '2022-08-08 23:46:35'),
(62, 4, 3, '2022-08-08', '2022-11-06', '2022-07-17 23:37:27', '2022-08-08 23:51:07'),
(164, 6, 1, '2022-06-20', '2022-07-20', '2022-07-18 21:30:44', '2022-07-18 21:30:44'),
(165, 6, 2, '2022-04-21', '2022-07-20', '2022-07-18 21:30:44', '2022-07-18 21:30:44'),
(166, 6, 3, '2022-04-21', '2022-07-20', '2022-07-18 21:30:44', '2022-07-18 21:30:44'),
(297, 8, 1, '2022-07-12', '2022-08-11', '2022-07-21 18:14:28', '2022-07-21 18:14:28'),
(298, 8, 2, '2022-07-12', '2022-10-10', '2022-07-21 18:14:28', '2022-07-21 18:14:28'),
(299, 8, 3, '2022-04-20', '2022-07-19', '2022-07-21 18:14:28', '2022-07-21 18:14:28'),
(300, 10, 1, '2022-06-08', '2022-07-08', '2022-07-22 00:43:30', '2022-07-22 00:43:30'),
(301, 10, 2, '2022-06-04', '2022-09-02', '2022-07-22 00:43:30', '2022-07-22 00:43:30'),
(302, 10, 3, '2022-06-06', '2022-09-04', '2022-07-22 00:43:30', '2022-07-22 00:43:30'),
(306, 3, 1, '2022-07-28', '2022-09-26', '2022-07-29 01:39:27', '2022-07-29 01:39:27'),
(307, 3, 2, '2022-07-28', '2022-11-25', '2022-07-29 01:39:27', '2022-07-29 01:39:27'),
(308, 3, 3, '2022-07-28', '2022-11-25', '2022-07-29 01:39:27', '2022-07-29 01:39:27'),
(309, 22, 1, '2022-07-30', '2022-08-29', '2022-07-30 12:32:06', '2022-07-30 12:32:06'),
(310, 22, 2, '2022-07-30', '2022-10-28', '2022-07-30 12:32:06', '2022-07-30 12:32:06'),
(311, 22, 3, '2022-07-30', '2022-10-28', '2022-07-30 12:32:06', '2022-07-30 12:32:06'),
(312, 23, 1, '2022-07-30', '2022-08-29', '2022-07-30 17:39:48', '2022-07-30 17:39:48'),
(313, 23, 2, '2022-07-30', '2022-10-28', '2022-07-30 17:39:48', '2022-07-30 17:39:48'),
(314, 23, 3, '2022-07-30', '2022-10-28', '2022-07-30 17:39:48', '2022-07-30 17:39:48'),
(397, 24, 1, '2022-07-06', '2022-08-05', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(398, 24, 2, '2022-05-06', '2022-08-04', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(399, 24, 3, '2022-05-06', '2022-08-04', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(400, 24, 4, '2021-01-07', '2022-07-01', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(401, 24, 5, '2020-12-16', '2022-06-09', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(402, 24, 6, '2020-12-16', '2022-12-06', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(403, 24, 7, '2020-12-16', '2023-12-01', '2022-08-01 16:17:19', '2022-08-01 16:17:19'),
(404, 26, 1, '2022-08-04', '2022-09-03', '2022-08-04 16:57:22', '2022-08-04 16:57:22'),
(405, 26, 2, '2022-08-04', '2022-11-02', '2022-08-04 16:57:22', '2022-08-04 16:57:22'),
(406, 26, 3, '2022-08-04', '2022-11-02', '2022-08-04 16:57:22', '2022-08-04 16:57:22'),
(862, 7, 1, '2022-08-08', '2022-09-07', '2022-08-08 23:47:38', '2022-08-08 23:47:44'),
(863, 7, 2, '2022-08-08', '2022-11-06', '2022-08-08 23:47:38', '2022-08-08 23:47:38'),
(864, 7, 3, '2022-08-08', '2022-11-06', '2022-08-08 23:47:38', '2022-08-08 23:47:38'),
(1008, 28, 1, '2022-08-11', '2022-09-10', '2022-08-09 14:29:35', '2022-08-11 10:21:47'),
(1009, 28, 2, '2022-08-11', '2022-11-09', '2022-08-09 14:29:35', '2022-08-11 10:21:47'),
(1010, 28, 3, '2022-08-11', '2022-11-09', '2022-08-09 14:29:35', '2022-08-11 10:21:47'),
(1011, 28, 4, '2022-02-12', '2023-08-06', '2022-08-09 14:29:35', '2022-08-09 14:29:35'),
(1012, 28, 5, '2022-08-11', '2024-02-02', '2022-08-09 14:29:35', '2022-08-11 10:21:47'),
(1013, 28, 6, '2022-08-11', '2024-07-31', '2022-08-09 14:29:35', '2022-08-11 10:21:47'),
(1014, 28, 7, '2020-08-21', '2023-08-06', '2022-08-09 14:29:35', '2022-08-09 14:29:35'),
(1022, 29, 1, '2022-08-09', '2022-09-08', '2022-08-09 15:13:41', '2022-08-09 15:13:41'),
(1023, 29, 2, '2022-08-09', '2022-11-07', '2022-08-09 15:13:41', '2022-08-09 15:13:41'),
(1024, 29, 3, '2022-08-09', '2022-11-07', '2022-08-09 15:13:41', '2022-08-09 15:13:41'),
(1081, 31, 1, '2022-07-15', '2022-08-14', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1082, 31, 2, '2022-08-12', '2022-11-10', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1083, 31, 3, '2022-08-12', '2022-11-10', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1084, 31, 4, '2022-08-12', '2024-02-03', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1085, 31, 5, '2022-08-12', '2024-02-03', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1086, 31, 6, '2022-08-12', '2024-08-01', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1087, 31, 7, '2022-08-12', '2025-07-27', '2022-08-12 01:19:01', '2022-08-12 01:19:01'),
(1088, 5, 1, '2022-08-12', '2022-09-11', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1089, 5, 2, '2022-08-12', '2022-11-10', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1090, 5, 3, '2022-08-12', '2022-11-10', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1091, 5, 4, '2022-08-12', '2024-02-03', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1092, 5, 5, '2022-08-12', '2024-02-03', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1093, 5, 6, '2022-08-12', '2024-08-01', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1094, 5, 7, '2022-08-12', '2025-07-27', '2022-08-12 03:07:19', '2022-08-12 03:07:19'),
(1109, 32, 1, '2022-08-12', '2022-09-11', '2022-08-12 03:14:39', '2022-08-12 03:14:39'),
(1110, 32, 2, '2022-08-12', '2022-11-10', '2022-08-12 03:14:39', '2022-08-12 03:14:39'),
(1111, 32, 3, '2022-08-12', '2022-11-10', '2022-08-12 03:14:39', '2022-08-12 03:14:39'),
(1112, 32, 4, '2022-08-12', '2024-02-03', '2022-08-12 03:14:39', '2022-08-12 03:14:39'),
(1113, 32, 5, '2022-08-12', '2024-02-03', '2022-08-12 03:14:39', '2022-08-12 03:14:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clean_time_conditions`
--
ALTER TABLE `clean_time_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_user_id_foreign` (`user_id`),
  ADD KEY `contacts_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `explanations`
--
ALTER TABLE `explanations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `explanation_tags`
--
ALTER TABLE `explanation_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `explanation_tags_explanation_id_foreign` (`explanation_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_provider_id_foreign` (`provider_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_unique` (`phone`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_product_id_foreign` (`product_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_filter_clean_times`
--
ALTER TABLE `user_filter_clean_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_filter_clean_times_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `clean_time_conditions`
--
ALTER TABLE `clean_time_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `explanations`
--
ALTER TABLE `explanations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `explanation_tags`
--
ALTER TABLE `explanation_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=890;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_filter_clean_times`
--
ALTER TABLE `user_filter_clean_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `explanation_tags`
--
ALTER TABLE `explanation_tags`
  ADD CONSTRAINT `explanation_tags_explanation_id_foreign` FOREIGN KEY (`explanation_id`) REFERENCES `explanations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_filter_clean_times`
--
ALTER TABLE `user_filter_clean_times`
  ADD CONSTRAINT `user_filter_clean_times_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
