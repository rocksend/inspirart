-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2025 at 08:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inspirart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Architecture'),
(5, 'Craft'),
(1, 'Fashion Designs'),
(6, 'Floral'),
(4, 'Grafitti'),
(3, 'Mural'),
(8, 'Painting'),
(7, 'Photography');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `parent_id`, `comment`, `created_at`) VALUES
(1, 2, 3, NULL, 'artikelnya sangat bagus', '2025-11-05 19:25:54'),
(2, 2, 3, 1, 'iya betul, aku setuju', '2025-11-06 01:32:48'),
(4, 1, 4, NULL, 'gw baru tau ternyata model bangunan tuh bisa sebagus ini anjr', '2025-11-13 02:57:07'),
(11, 7, 3, NULL, 'halo', '2025-11-26 18:31:59'),
(12, 4, 1, NULL, 'halo', '2025-11-26 18:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `about_text` text NOT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `recent_posts` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footer`
--

INSERT INTO `footer` (`id`, `about_text`, `instagram`, `twitter`, `facebook`, `categories`, `recent_posts`) VALUES
(1, 'Website ini dirancang untuk pengguna yang menyukai seni dan bisa berbagi diskusi.', 'https://www.instagram.com/inspirart07?igsh=eXA0cHU2OWl2NG02', 'https://x.com/i/flow/login?lang=en-id', 'https://web.facebook.com/?locale=id_ID&_rdc=1&_rdr#', '[\r\n    {\"name\":\"Fashion Designs\",\"link\":\"catadmin.php?category=Fashion\"},\r\n    {\"name\":\"Architecture\",\"link\":\"catadmin.php?category=Architecture\"},\r\n    {\"name\":\"Mural\",\"link\":\"catadmin.php?category=Mural\"},\r\n    {\"name\":\"Grafitti\",\"link\":\"catadmin.php?category=Grafitti\"},\r\n    {\"name\":\"Craft\",\"link\":\"catadmin.php?category=Craft\"},\r\n    {\"name\":\"Floral\",\"link\":\"catadmin.php?category=Floral\"},\r\n    {\"name\":\"Photography\",\"link\":\"catadmin.php?category=Photography\"},\r\n    {\"name\":\"Painting\",\"link\":\"catadmin.php?category=Painting\"}\r\n]\r\n', '[\r\n  { \"title\":\"Beautiful Painting\", \"link\":\"singledetail.php?id=1\", \"image\":\"images/painting.jpg\", \"date\":\"2025-11-27\" },\r\n  { \"title\":\"Amazing Sculpture\", \"link\":\"singledetail.php?id=2\", \"image\":\"images/sculpture.jpg\", \"date\":\"2025-11-26\" }\r\n]\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`, `created_at`) VALUES
(6, 1, 3, '2025-11-12 04:32:44'),
(7, 1, 1, '2025-11-12 06:08:51'),
(9, 2, 3, '2025-11-12 14:54:47'),
(17, 3, 4, '2025-11-19 06:45:18'),
(23, 3, 3, '2025-11-26 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `image`, `deskripsi`, `content`, `created_at`, `date`) VALUES
(1, 1, 2, 'Arsitektur Futuristik: Harmoni Antara Bentuk, Gerak, dan Ruang', 'https://i.pinimg.com/1200x/1f/c5/78/1fc578dc185816ed09a7e3ae28b70ec2.jpg', 'Sketsa bangunan pada gambar tersebut menampilkan sebuah desain arsitektur futuristik yang sangat dinamis...', 'Sketsa ini menggunakan dominasi warna hitam dan abu-abu dengan sapuan garis halus yang tumpang tindih, menggambarkan proses eksplorasi ide sang arsitek. Setiap goresan tampak seperti pencarian bentuk terbaik yang mampu memadukan estetika dan fungsi. Melalui pendekatan seperti ini, arsitek berusaha menunjukkan bahwa desain bukan hanya tentang hasil akhir, melainkan perjalanan kreatif untuk menemukan keseimbangan antara imajinasi dan realitas teknis.\r\n        Bentuk lengkung yang dominan dalam desain ini dapat dimaknai sebagai simbol keterbukaan dan fleksibilitas. Dalam dunia arsitektur kontemporer, bentuk organik sering digunakan untuk merepresentasikan harmoni antara manusia, teknologi, dan alam. Tangga serta jalur melingkar yang tampak di sekitar bangunan menunjukkan keterhubungan antar-ruang yang cair dan dinamis, menciptakan kesan bahwa setiap bagian dari struktur memiliki alur cerita tersendiri.\r\n        Selain aspek estetika, desain seperti ini juga mencerminkan kemajuan teknologi dalam dunia arsitektur. Pemodelan digital dan teknik konstruksi modern memungkinkan terciptanya bentuk-bentuk kompleks seperti yang tampak pada gambar. Material inovatif, seperti beton cetak 3D dan baja lentur, kini memberikan kebebasan baru bagi desainer untuk mewujudkan bentuk yang dulu dianggap mustahil secara teknis.\r\n        Walaupun tampak spektakuler, desain futuristik semacam ini tetap menghadapi tantangan besar dalam hal biaya, efisiensi energi, dan keberlanjutan. Struktur melengkung memerlukan perhitungan teknik yang rumit serta material dengan spesifikasi tinggi. Oleh karena itu, setiap ide kreatif perlu disertai perencanaan matang agar dapat diwujudkan tanpa mengorbankan aspek fungsional dan kenyamanan pengguna.\r\n        Secara keseluruhan, sketsa arsitektur ini menggambarkan semangat masa depan—di mana seni, sains, dan teknologi berpadu menjadi satu kesatuan. Bentuknya yang mengalir dan visioner tidak hanya menampilkan wujud fisik sebuah bangunan, tetapi juga mencerminkan cara pandang baru terhadap ruang dan kehidupan urban yang terus berkembang.', '2025-11-06 02:18:07', '2025-11-27'),
(2, 2, 6, 'Floral: Keindahan Alam dalam Setiap Kelopak', 'https://i.pinimg.com/1200x/d5/5f/b0/d55fb0db850d8c5efeca7b8db168332a.jpg', 'Floral adalah simbol keindahan alami yang tak lekang oleh waktu. Motif dan bentuk yang terinspirasi dari bunga telah menjadi bagian penting dalam berbagai aspek kehidupan manusia....', '        Bunga memiliki bahasa tersendiri yang mampu menyampaikan makna tanpa kata. Setiap jenis bunga membawa simbol dan emosi yang berbeda — mawar melambangkan cinta, lili menandakan kemurnian, sementara lavender mencerminkan ketenangan. Makna-makna ini sering diadaptasi ke dalam karya seni atau desain untuk mengekspresikan perasaan yang sulit diungkapkan secara langsung.\r\n        Dalam dunia seni rupa, tema floral menjadi inspirasi abadi bagi banyak seniman. Lukisan bunga sering kali bukan hanya soal bentuk atau warna, melainkan juga refleksi kehidupan, harapan, dan kefanaan. Claude Monet dengan seri lukisan Water Lilies-nya, misalnya, menampilkan keindahan bunga bukan sekadar objek visual, tetapi juga simbol ketenangan dan keseimbangan batin. Melalui bunga, seniman belajar melihat keindahan dari hal-hal kecil di sekitar mereka.\r\n        Floral juga memiliki peran penting dalam dunia fashion dan desain. Motif bunga digunakan untuk menghadirkan kesan lembut, feminin, dan elegan dalam pakaian maupun interior. Tren floral terus berkembang dari masa ke masa — kadang tampil ramai dan penuh warna, kadang hadir dalam bentuk minimalis dan modern. Namun satu hal yang tak berubah adalah kemampuannya untuk memberikan kesan hidup dan menyenangkan bagi siapa pun yang melihatnya.\r\n        Selain keindahan visual, konsep floral juga mengajarkan manusia tentang filosofi kehidupan. Bunga tumbuh, mekar, lalu layu — menggambarkan siklus alami yang penuh makna. Dari proses itu, kita belajar bahwa keindahan bukanlah sesuatu yang abadi, melainkan hadir dalam setiap momen yang kita hargai. Itulah sebabnya, floral sering dianggap simbol dari perubahan, pertumbuhan, dan keikhlasan.\r\n        Pada akhirnya, floral bukan hanya sekadar motif atau hiasan, tetapi juga wujud hubungan manusia dengan alam. Ia mengingatkan kita bahwa keindahan sejati sering berasal dari kesederhanaan dan keseimbangan. Dalam setiap kelopak yang mekar, tersimpan pesan bahwa kehidupan selalu memiliki ruang untuk tumbuh, berbunga, dan memberikan warna bagi dunia.', '2025-11-05 17:24:49', '2025-11-27'),
(3, 3, 8, 'The Last Supper Karya Leonardo da Vinci', 'uploads/post_1763530357.webp', 'Lukisan The Last Supper atau Perjamuan Terakhir merupakan salah satu karya seni paling terkenal di dunia yang diciptakan oleh Leonardo da Vinci pada akhir abad ke-15. Karya ini menggambarkan momen penting dalam kisah Alkitab ketika Yesus Kristus mengumumkan bahwa salah satu dari dua belas murid-Nya akan mengkhianati-Nya. Adegan ini menjadi sangat emosional karena menunjukkan berbagai reaksi para murid yang berbeda-beda, mulai dari keterkejutan hingga kebingungan. Leonardo berhasil menangkap momen tersebut dengan detail luar biasa dan menampilkan sisi kemanusiaan dari setiap tokoh di dalamnya.', 'Pembuatan lukisan ini dimulai pada tahun 1495 dan selesai sekitar tahun 1498. Karya ini dipesan oleh Ludovico Sforza, Adipati Milan, untuk menghiasi ruang makan biara Santa Maria delle Grazie di Milan, Italia. Tidak seperti teknik fresco yang umum digunakan pada masa itu, Leonardo memilih menggunakan campuran cat tempera dan minyak di atas plester kering. Teknik ini memungkinkan penggambaran yang lebih realistis dan detail, tetapi sayangnya membuat lukisan mudah rusak karena lapisan cat tidak menempel kuat pada dinding. Akibatnya, The Last Supper mulai mengalami kerusakan hanya beberapa tahun setelah selesai dibuat.\r\nLukisan ini memiliki ukuran yang sangat besar, yaitu sekitar 4,6 meter tinggi dan 8,8 meter lebar. Komposisinya menampilkan Yesus yang duduk di tengah meja panjang dengan enam murid di sisi kanan dan enam murid di sisi kiri. Momen yang digambarkan adalah saat Yesus berkata, “Salah satu di antara kalian akan mengkhianati Aku,” yang kemudian membuat suasana menjadi tegang. Setiap murid menunjukkan ekspresi dan gestur tubuh yang berbeda, mencerminkan reaksi manusiawi terhadap pengkhianatan dan ketidakpastian. Sosok Yesus digambarkan dengan tenang, menjadi pusat keseimbangan dalam kekacauan yang terjadi di sekelilingnya.\r\nDari segi simbolisme, Leonardo menggunakan berbagai elemen untuk memperkuat makna spiritual lukisan ini. Garis perspektif seluruh ruangan mengarah ke kepala Yesus, menegaskan bahwa Ia adalah pusat perhatian dan sumber ketenangan. Cahaya yang masuk dari jendela di belakang Yesus memperkuat kesan ilahi dan menghadirkan suasana sakral. Sementara itu, Yudas Iskariot — yang mengkhianati Yesus — dapat dikenali melalui posisinya yang sedikit mundur, wajahnya yang gelap, serta tangannya yang memegang kantung berisi uang perak. Semua unsur ini menunjukkan betapa teliti Leonardo dalam menggabungkan seni, emosi, dan simbolisme.\r\nSeiring berjalannya waktu, The Last Supper mengalami banyak kerusakan akibat teknik lukis yang digunakan dan faktor lingkungan. Warna-warna pudar dan sebagian besar detail asli hilang karena kelembapan dan debu. Berbagai upaya restorasi telah dilakukan untuk menyelamatkan karya ini, salah satunya yang terbesar berlangsung antara tahun 1978 hingga 1999. Proses restorasi tersebut dilakukan dengan sangat hati-hati untuk mempertahankan keaslian bentuk dan warna sejauh mungkin. Saat ini, lukisan tersebut dilindungi secara ketat, dan hanya pengunjung dalam jumlah terbatas yang dapat melihatnya setiap hari.\r\nSecara keseluruhan, The Last Supper tidak hanya menjadi bukti kejeniusan Leonardo da Vinci sebagai seniman, tetapi juga menggambarkan kemampuannya memahami emosi manusia dan nilai spiritual kehidupan. Karya ini terus menginspirasi banyak orang di seluruh dunia dan menjadi simbol penting dari masa Renaissance. Melalui The Last Supper, Leonardo berhasil menggabungkan seni, sains, perspektif, dan religiusitas dalam satu karya yang abadi, menjadikannya salah satu lukisan paling berpengaruh dalam sejarah peradaban manusia.', '2025-09-30 10:00:00', '2025-11-27'),
(4, 4, 8, 'Cara Lukis Motif Batik Jawa', 'images/javanese batik.jpg', 'Berikut ini cara untuk membuat lukisan motif batik Jawa. Setiap pola batik memiliki makna filosofis yang dalam, mencerminkan nilai-nilai kehidupan, kesabaran, dan keharmonisan.', '         Pertama, siapkan kain polos dan alat canting untuk menggambar pola dengan malam atau lilin panas. Langkah ini membutuhkan ketelitian dan kestabilan tangan agar motif terbentuk rapi.\r\n Setelah itu, kain dicelupkan ke dalam pewarna alami seperti indigo atau soga. Warna-warna ini memiliki makna simbolis, misalnya biru melambangkan ketenangan, sedangkan coklat berarti kebijaksanaan.\r\nSetelah proses pewarnaan selesai, malam dilelehkan sehingga muncul kontras antara motif dan dasar kain. Tahapan ini menampilkan keindahan pola batik secara utuh.\r\nMelukis motif batik Jawa bukan sekadar proses artistik, tetapi juga bentuk penghormatan terhadap budaya dan tradisi yang diwariskan turun-temurun.\r\nDengan mengenalkan budaya kepada penerus bangsa, maka budaya yang telah diciptakan oleh nenek moyang kita dapat terus dilestarikan dan dikenal oleh anak bangsa dan juga bangsa luar.', '2025-09-30 10:00:00', '2025-11-27'),
(5, 5, 5, 'Projek Anak Sekolah Dasar', 'images/boneka.jpg', 'Laura, siswi SD, membuat boneka lucu dari clay yang penuh warna dan imajinasi. Dengan tangan mungilnya, ia membentuk berbagai karakter lucu seperti hewan, bunga, dan tokoh dongeng kesukaannya. Karya itu bukan hanya hasil bermain semata, tetapi bagian dari projek pembelajaran tematik di sekolah yang bertujuan mengasah kreativitas dan motorik halus anak-anak.', '        Melalui kegiatan ini, para siswa diajak untuk belajar sambil berkreasi. Mereka tidak hanya mengenal bentuk dan warna, tetapi juga belajar tentang kesabaran, ketelitian, dan kerja sama jika dilakukan dalam kelompok. Proses pembuatan boneka clay juga melatih daya imajinasi serta kemampuan berpikir kritis saat menentukan bentuk dan warna yang sesuai.\r\nGuru berperan penting dalam memberikan arahan dan memotivasi siswa agar berani bereksperimen dengan ide baru. Misalnya, beberapa siswa membuat boneka bertema lingkungan untuk menggambarkan pentingnya menjaga alam. Ada juga yang membuat karakter fabel untuk menceritakan pesan moral.\r\nProjek seperti ini menunjukkan bahwa pembelajaran di sekolah dasar tidak harus selalu menggunakan buku dan lembar kerja. Belajar melalui projek justru membantu anak memahami konsep secara nyata, karena mereka bisa melihat, menyentuh, dan menciptakan sesuatu dari ide mereka sendiri.\r\nDengan kegiatan sederhana seperti membuat boneka clay, anak-anak dapat mengekspresikan perasaan, menumbuhkan rasa percaya diri, dan belajar menghargai hasil karya sendiri maupun karya teman.\r\nProjek kreatif ini menjadi bukti bahwa pendidikan dasar bukan hanya tentang membaca dan menghitung, tetapi juga tentang membangun karakter, imajinasi, dan semangat berkarya sejak dini.', '2025-09-30 10:00:00', '2025-11-27'),
(6, 6, 8, 'Seni yang Bikin Hati Senang', 'images/poster.jpg', 'Fun Art adalah bentuk seni yang dibuat untuk bersenang-senang tanpa aturan. Siapa pun bisa melakukannya, baik dengan menggambar, melukis, atau membuat kerajinan tangan sederhana. Tujuannya bukan untuk hasil yang sempurna, tapi untuk menikmati prosesnya.', '        Biasanya, Fun Art dipenuhi warna-warna cerah, bentuk lucu, dan ide kreatif yang spontan. Banyak orang membuatnya untuk mengekspresikan perasaan, melepas stres, atau sekadar bermain dengan imajinasi.\r\nMedia yang digunakan pun bebas — bisa kertas, kanvas, digital art, atau barang bekas yang diubah jadi karya unik. Tak jarang, hasilnya malah lucu dan menyenangkan untuk dilihat.\r\nKelebihan dari Fun Art adalah memberi rasa bebas dan bahagia. Saat kamu melukis atau menggambar tanpa takut salah, kamu sedang melatih otak untuk lebih rileks dan kreatif.\r\nJadi, jangan ragu untuk mulai berkarya. Ambil pensil, kuas, atau apapun yang kamu punya, dan ciptakan Fun Art versimu sendiri — karena seni seharusnya selalu menyenangkan! 🎨\r\nYuk mulai berkaryaa!!!', '2025-09-30 10:00:00', '2025-11-27'),
(7, 7, 5, 'Kerajinan di Kota Yogyakarta', 'images/miniatur sepeda.jpg', 'Miniatur sepeda buatan tangan khas Jogjakarta ini melambangkan keindahan dan ketelitian pengrajin lokal. Setiap bagian dibuat dengan cermat menggunakan bahan logam dan kayu yang dipoles halus.', '        Kerajinan ini tidak hanya menarik secara visual, tetapi juga mencerminkan semangat kreatif masyarakat Yogyakarta yang terkenal dengan jiwa seninya. Proses pembuatannya memerlukan waktu dan keahlian tinggi.\r\nSelain miniatur sepeda, banyak pengrajin Yogyakarta juga menghasilkan karya lain seperti wayang kulit, batik, dan ukiran kayu. Semua produk itu menjadi identitas budaya yang kaya.\r\nHasil karya mereka kerap menjadi buah tangan favorit wisatawan karena mengandung nilai estetika dan makna budaya yang dalam.\r\nKerajinan tangan khas Yogyakarta membuktikan bahwa seni tradisional dapat terus hidup berdampingan dengan perkembangan zaman tanpa kehilangan jati dirinya.\r\nDengan memadupadankan seni budaya dengan peradaban zaman, tidak menutup kemungkinan bagi semua kalangan dapat menyukai keindahan khas buah tangan yang ada di Yogyakarta.', '2025-09-30 10:00:00', '2025-11-27'),
(16, 1, 8, 'ttd', 'uploads/1765215468_WhatsApp_Image_2025-12-05_at_19.14.23.jpeg', 'e', 'y', '2025-12-08 17:37:48', '2025-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `tb_komentar`
--

CREATE TABLE `tb_komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_post` int(11) DEFAULT NULL,
  `nama_user` varchar(50) DEFAULT NULL,
  `isi_komentar` text DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_postingan`
--

CREATE TABLE `tb_postingan` (
  `id_post` int(11) NOT NULL,
  `judul_post` varchar(100) DEFAULT NULL,
  `isi_post` text DEFAULT NULL,
  `jumlah_like` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_img` varchar(255) DEFAULT 'default.jpg',
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `profile_img`, `role`, `created_at`) VALUES
(1, 'Admin1234', 'admin12@gmail.com', '12345', 'uploads/profiles/user_1_1765253211.png', 'admin', '2025-11-05 12:43:58'),
(2, 'divia26', 'diviaindah26@gmail.com', '4567', 'uploads/profiles/user_2_1765986682.png', 'user', '2025-11-05 12:45:09'),
(3, 'diviaindah', 'diviacantik26@gmail.com', '$2y$10$WU6SneFN5YQwQ4IDF6wTzeVRHNyxc92GJveA77yc56vsUm6JBgWxy', 'uploads/profiles/user_3_1765215710.png', 'user', '2025-11-05 15:01:19'),
(4, 'qolbi', 'qolbi7@gmail.com', '1234', 'default.jpg', 'user', '2025-11-12 12:49:22'),
(5, 'qolbiimut', 'qolbii1@gmail.com', '1111', 'default.jpg', 'user', '2025-11-12 12:51:51'),
(6, 'rakabisa', 'rakabisangoding@gmail.com', '2222', 'default.jpg', 'user', '2025-11-12 12:52:31'),
(7, 'rakabisma', 'rakabisma@gmail.com', '3333', 'default.jpg', 'user', '2025-11-12 12:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-16 11:54:53'),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-16 11:55:10'),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-22 13:38:25'),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-22 13:39:21'),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-22 21:33:29'),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:08:11'),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:08:23'),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:08:41'),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:08:44'),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:10:17'),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 11:13:58'),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 13:31:43'),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 13:32:12'),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-23 13:33:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `id_post` (`id_post`);

--
-- Indexes for table `tb_postingan`
--
ALTER TABLE `tb_postingan`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_postingan`
--
ALTER TABLE `tb_postingan`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD CONSTRAINT `tb_komentar_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `tb_postingan` (`id_post`);
COMMIT;

