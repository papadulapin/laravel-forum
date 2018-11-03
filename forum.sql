-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2018 at 06:04 PM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.11-3+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `subject_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `type`, `user_id`, `subject_id`, `subject_type`, `created_at`, `updated_at`) VALUES
(1, 'created_favorite', 31, 1, 'App\\Favorite', '2018-11-02 18:03:53', '2018-11-02 18:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'tempora', 'tempora', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(2, 'est', 'est', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(3, 'dignissimos', 'dignissimos', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(4, 'voluptate', 'voluptate', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(5, 'omnis', 'omnis', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(6, 'maiores', 'maiores', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(7, 'ipsa', 'ipsa', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(8, 'esse', 'esse', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(9, 'possimus', 'possimus', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(10, 'qui', 'qui', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(11, 'amet', 'amet', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(12, 'aperiam', 'aperiam', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(13, 'nemo', 'nemo', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(14, 'sunt', 'sunt', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(15, 'et', 'et', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(16, 'id', 'id', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(17, 'ipsum', 'ipsum', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(18, 'rerum', 'rerum', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(19, 'omnis', 'omnis', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(20, 'sed', 'sed', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(21, 'amet', 'amet', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(22, 'a', 'a', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(23, 'aut', 'aut', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(24, 'qui', 'qui', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(25, 'adipisci', 'adipisci', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(26, 'veritatis', 'veritatis', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(27, 'voluptatum', 'voluptatum', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(28, 'numquam', 'numquam', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(29, 'voluptatibus', 'voluptatibus', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(30, 'quas', 'quas', '2018-10-15 19:47:45', '2018-10-15 19:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `favorited_id` int(10) UNSIGNED NOT NULL,
  `favorited_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `favorited_id`, `favorited_type`, `created_at`, `updated_at`) VALUES
(1, 31, 1, 'App\\Reply', '2018-11-02 18:03:53', '2018-11-02 18:03:53');

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
(18, '2014_10_12_000000_create_users_table', 1),
(19, '2014_10_12_100000_create_password_resets_table', 1),
(20, '2018_10_03_164700_create_threads_table', 1),
(21, '2018_10_03_165054_create_replies_table', 1),
(22, '2018_10_04_160156_create_channels_table', 1),
(23, '2018_10_05_195158_create_favorites_table', 1),
(24, '2018_10_10_115740_create_activities_table', 1);

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
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `thread_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 32, 'Aut officiis adipisci maxime totam minus. Et nisi est cum ullam et doloremque.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(2, 1, 33, 'Occaecati expedita omnis assumenda voluptatem. Quia quo sequi sit quod. Et magnam accusantium vel temporibus quo consequatur. Est repellendus quasi qui laborum.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(3, 1, 34, 'Exercitationem culpa et quia. Tempora nisi voluptates quam laboriosam labore. Voluptate incidunt ullam aut hic odio aut quae.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(4, 1, 35, 'Qui omnis et corporis aspernatur cupiditate id. Recusandae aut explicabo cupiditate ad. Quia iure eaque sequi dicta ut nulla distinctio qui. Placeat qui neque quisquam quidem consequatur.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(5, 1, 36, 'Mollitia ut quae dolores laboriosam. Et quia voluptates saepe veritatis. Dolorum eos reprehenderit laudantium et vel dolores recusandae.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(6, 1, 37, 'Voluptas necessitatibus autem aut. Libero corporis deleniti repellendus voluptas quo. Repellat ut mollitia sit impedit sed voluptatem dolores. Non voluptatem inventore sed molestiae tempora. Ut rem veritatis quia sint rerum excepturi pariatur.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(7, 1, 38, 'Facere sed et cupiditate. Earum hic accusantium ea hic molestias et et. Perferendis et rerum occaecati dolor magnam.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(8, 1, 39, 'Necessitatibus nihil pariatur cumque reprehenderit. Voluptatem saepe expedita accusamus. Dolor voluptas est sit autem animi ut. Aut dolores voluptatibus ea ipsa a pariatur adipisci. At cupiditate libero minus rerum.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(9, 1, 40, 'Amet dolores neque doloremque accusantium tenetur quis maiores. Dicta dolore consequatur fugit quia laudantium dolorum omnis omnis. Reiciendis facilis et dignissimos quos natus quibusdam accusamus. Ipsam vel sit voluptas qui vero. Ex est velit aliquam. Sed esse et impedit illum.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(10, 1, 41, 'Labore et repellat neque. Recusandae doloremque quam doloribus sint quis asperiores aut. Dolor enim reprehenderit voluptas recusandae et consequatur. Fuga nemo animi iste. Eligendi quibusdam alias eligendi nihil a sequi. Quidem ab expedita aut.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(11, 1, 42, 'Voluptatem sequi est maiores voluptatem vitae. Placeat perspiciatis nulla quo est. Veniam sed nemo vel nesciunt doloribus voluptates quo autem. Quasi id officia quia asperiores quam. Quis quia et enim corrupti officia. Molestias eum quaerat et distinctio sit qui quam doloribus. Ex ea molestiae et voluptatibus est et esse ea.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(12, 1, 43, 'Laboriosam ex qui libero. Nihil rerum ipsam eum. Facere possimus accusantium unde ratione corporis. Sapiente atque et eos eaque. At id sint consequuntur id officia et odio placeat.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(13, 1, 44, 'Dolorem laudantium est ea nihil asperiores et et. Corrupti delectus rerum quibusdam autem. Minima fuga dolores tempore esse officiis officiis libero. Impedit aut autem molestiae quis.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(14, 1, 45, 'Quas quod ullam veritatis hic explicabo laudantium voluptates. Et dolorem quas quis enim dolores. Exercitationem neque commodi quasi sint.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(15, 1, 46, 'Quidem sequi vel corporis id eum iusto. Repellendus dolorem qui in. Commodi atque sunt totam dolorem hic vero voluptas. Ut doloribus incidunt voluptatum eius.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(16, 1, 47, 'Repellat facere velit dolorem tenetur qui. Repudiandae assumenda cumque necessitatibus autem velit quidem adipisci sequi. Excepturi facilis aut sunt autem blanditiis labore.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(17, 1, 48, 'Ut est totam ratione repellendus et commodi. Quia numquam vel provident facilis fuga. Aut iure adipisci temporibus quod ad.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(18, 1, 49, 'Cum cum sit et distinctio sequi ut. Ut veniam error pariatur similique. Nobis consequatur nihil et hic aut.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(19, 1, 50, 'Aut porro facere in ut voluptatum libero mollitia. Excepturi deserunt neque a vero officiis placeat rem. Pariatur officiis recusandae facere temporibus dolores tenetur. Necessitatibus explicabo autem adipisci inventore alias. Perspiciatis est qui ipsa quo eos sapiente sed non. Iste et autem sapiente soluta pariatur necessitatibus est.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(20, 1, 51, 'Libero assumenda necessitatibus suscipit ex eligendi saepe. Nihil officiis placeat adipisci. Laudantium nam ut dolorem quibusdam eos quia. Delectus incidunt aliquid porro.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(21, 1, 52, 'Ut natus saepe explicabo id animi. Molestiae perferendis aperiam et cupiditate maxime non sequi. Et omnis hic itaque veritatis eaque et. Nulla tenetur ipsam perferendis sint. Est cumque eveniet et qui sit laudantium. Vitae error ea et dicta.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(22, 1, 53, 'Quae aut reiciendis ut ad nihil beatae. Magnam at quia atque animi. Rerum molestiae error molestiae cum. Voluptatibus id est aspernatur voluptatem placeat sed omnis impedit. Aut illum deserunt atque aperiam neque. Architecto nostrum illo odio autem dicta aspernatur. Totam odit eaque aperiam et iste ab.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(23, 1, 54, 'Vel eum quia necessitatibus dolor natus aut. Magnam est dolorem esse dolorem eos at. Dolores consequuntur natus placeat dignissimos. Id voluptas aliquid eius est corporis.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(24, 1, 55, 'Recusandae similique culpa dolores est repellendus porro qui. Voluptas nemo rem voluptas doloribus quis amet tempora. Ut quo et iusto commodi quaerat voluptatum fugiat. Explicabo numquam accusamus velit omnis et quasi nesciunt.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(25, 1, 56, 'Quia nulla sunt nesciunt autem magnam omnis. Voluptate quas aliquam adipisci laborum numquam nemo corporis. Magni dolores aliquid incidunt iusto. Reiciendis corrupti cumque consectetur perferendis quia sunt id. Facere dolore veritatis sint delectus magni a accusamus quis. Dignissimos qui iste nesciunt harum quia nostrum deserunt totam.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(26, 1, 57, 'Nesciunt atque nemo dolorum maxime ipsam optio et. Saepe magni dolor corrupti sed sed repellat. Necessitatibus eveniet error placeat animi rerum non modi. Ducimus voluptates dicta eaque id consequatur autem. Quo cum rerum tempora quis.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(27, 1, 58, 'Temporibus et et veritatis ea corrupti tempora optio. Culpa nemo sunt ut. Et dolorem ut expedita optio quasi libero aut. Molestiae nobis quis est est. Eum saepe unde sunt et aspernatur asperiores.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(28, 1, 59, 'Est voluptatem incidunt sunt. Libero magni recusandae eaque minima. Dolorem cum qui voluptas est modi sit. Quasi aut autem exercitationem distinctio qui.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(29, 1, 60, 'Cumque vel beatae repudiandae incidunt est. Reprehenderit adipisci voluptas at et facere. Rerum error harum molestias repudiandae voluptatem omnis error. Et eius recusandae molestias qui sunt.', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(30, 1, 61, 'Similique voluptas tempore voluptatem vel. Illum quam est mollitia voluptatum qui atque odit. Aut voluptatem sapiente et qui iusto excepturi.', '2018-10-15 20:23:40', '2018-10-15 20:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `replies_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `user_id`, `channel_id`, `replies_count`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 30, 'Explicabo facilis voluptatem sunt ea et voluptas.', 'Minima animi perferendis eum velit qui et vitae. Minus est est recusandae. Vero facere consequatur eaque recusandae maxime aut.', '2018-10-15 19:47:45', '2018-10-15 20:23:40'),
(3, 3, 3, 0, 'Qui atque neque totam praesentium.', 'Et voluptas fuga laboriosam. Est doloremque asperiores molestiae fuga vel dolor. Quaerat quam sequi magni explicabo unde eveniet. In vel quia voluptatem placeat.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(4, 4, 4, 0, 'Sit reiciendis minima dolorum ea sunt maxime sequi.', 'Et repellat ea doloremque culpa est. Eaque vitae illo impedit delectus. Ut qui ipsam aut. Harum maiores occaecati error provident explicabo sit minus laudantium. Atque explicabo ipsa id velit alias dolorem quae. Eligendi voluptatem et quos corrupti aliquid.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(5, 5, 5, 0, 'Et provident eum et voluptatum.', 'Ut provident omnis dolor est velit consequatur quo. Impedit voluptas voluptas error vitae iste eos qui. Debitis dolorem laudantium exercitationem et. Nam quis voluptates aliquam explicabo quia esse totam necessitatibus.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(6, 6, 6, 0, 'Sint recusandae et velit vitae earum qui assumenda recusandae.', 'Consequatur deserunt quaerat sint reprehenderit. Nulla molestiae et dolorem sed excepturi sed amet. Commodi nesciunt temporibus aliquid nulla et minima ut aspernatur. Voluptates itaque architecto quos quos ipsam laboriosam. In quia libero blanditiis minima excepturi sit. Magni et numquam error perferendis labore quia debitis.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(7, 7, 7, 0, 'Rem voluptatem et sunt et.', 'Est nihil alias quia quae corrupti. Suscipit facere id dolor corrupti quas nobis et dolor.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(8, 8, 8, 0, 'Dolor ut fugit aut eligendi dicta.', 'Est quis ex consequatur et sit perspiciatis rerum possimus. Consequatur dolorum est ut sunt ad nulla. Non sed porro in explicabo et corporis. Et tenetur dolor et ex.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(9, 9, 9, 0, 'Placeat atque cumque magnam.', 'Aliquid corporis nostrum quae et culpa architecto. Officia quisquam quia neque sapiente nam voluptatem. Modi similique veritatis voluptate est aut voluptatum. Veniam enim qui voluptas qui ad.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(10, 10, 10, 0, 'Ullam voluptatum ut et quod earum aut voluptate.', 'Omnis aut illo laboriosam officiis. Voluptatibus similique maxime laudantium sit totam distinctio assumenda. Quod quo in dolorem unde error. Eveniet minus quaerat eum. Ut molestias aut placeat et.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(11, 11, 11, 0, 'Accusamus dolore sed at neque laudantium facere sunt quisquam.', 'Quod velit qui corrupti qui consequuntur. Debitis tempore porro voluptatem doloremque. Occaecati ducimus sit quo est corrupti. Sint sunt quis repellendus. In ut ea molestiae odit voluptatum itaque saepe provident. Est consectetur sed nostrum corporis quos. Tempora distinctio harum distinctio beatae.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(12, 12, 12, 0, 'Labore vero error quidem facere.', 'Perferendis accusantium sed dolores omnis aut consequatur. Fugiat facilis voluptatum placeat fugiat dolores. Fugit eaque minima veritatis quo qui dolor. Veniam facere dolorum dolorem necessitatibus. Voluptatum non a itaque voluptas.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(13, 13, 13, 0, 'Assumenda totam incidunt quas et aut mollitia.', 'Sit veniam molestias nihil consequuntur aut rerum ea. Non vitae id deleniti modi dolorem. Hic modi asperiores sunt tempore. Ea dolorum qui facere suscipit consequatur doloremque esse. Fuga sapiente et nam ad qui dolores et.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(14, 14, 14, 0, 'Natus quod ea tempore qui.', 'Sunt eos minima consequatur reiciendis illo. Reiciendis fuga aut facere quisquam. Ex odio voluptatem ullam rem saepe.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(15, 15, 15, 0, 'Quaerat explicabo saepe accusamus suscipit.', 'Harum temporibus earum commodi. Dignissimos deleniti id laudantium. Hic consectetur architecto voluptates mollitia totam.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(16, 16, 16, 0, 'Dicta suscipit qui eos est similique aut blanditiis.', 'Expedita et aliquam animi doloremque. Labore sapiente voluptatem autem incidunt animi nam repudiandae. Dolorem qui unde perferendis animi pariatur. Distinctio eos voluptatem sequi quidem ratione.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(17, 17, 17, 0, 'Officiis officiis qui magnam.', 'Voluptate mollitia qui et. Eos occaecati rerum quia occaecati in velit nemo. Nihil et voluptatem consequatur facilis qui.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(18, 18, 18, 0, 'Officiis ipsa aliquid qui mollitia voluptatem nam alias.', 'Sed aut vitae earum ducimus. Ducimus illum nesciunt aut et et ipsum. Nisi voluptas totam repudiandae dolor et. Earum eos placeat tempore dolor laudantium rerum. Debitis consequuntur consequatur temporibus amet quam ut accusamus earum. Minus ex illo impedit labore corrupti ipsa perferendis.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(19, 19, 19, 0, 'Eum quia quia aut doloremque.', 'Dolorem explicabo cupiditate ipsum rerum quis qui illum accusamus. Aut qui est voluptatem necessitatibus. Illo praesentium voluptatum expedita qui nobis deserunt dignissimos. Itaque nulla autem non modi optio. Sed doloribus eligendi vitae expedita sit molestias eius.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(20, 20, 20, 0, 'Sint dignissimos dolores dolores animi.', 'Tempora eligendi eum adipisci dolores. Cupiditate sequi est corporis beatae. Necessitatibus porro numquam assumenda ea ab molestiae. Deserunt omnis quasi in et necessitatibus consequatur. Perferendis iusto mollitia amet et veritatis. Facilis rerum voluptates placeat ullam impedit. Omnis dolor maiores placeat et laudantium atque totam.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(21, 21, 21, 0, 'Excepturi nihil dolore ea qui et molestiae.', 'Consequatur aperiam ratione excepturi porro dicta sint soluta. Rerum eaque quidem numquam. Ex sunt et adipisci dolores. Et sunt aut et quae.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(22, 22, 22, 0, 'Ratione eaque expedita id tenetur.', 'Iure omnis libero molestiae autem dolore. Odit repellendus aut eos quaerat autem tempora. Fugit fugit expedita qui quasi.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(23, 23, 23, 0, 'Non qui accusantium quae optio nesciunt minus illum consequatur.', 'Cum omnis aut ut et molestias officia accusamus ut. Et fuga incidunt et temporibus quia. Eligendi quia corporis amet id. Aut nostrum quia quo exercitationem.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(24, 24, 24, 0, 'Quia laudantium rerum aut voluptatem fugit nemo.', 'Quis deleniti sapiente corrupti nulla voluptas odit. Accusantium minus expedita ut et excepturi. Omnis earum illo corporis non maxime. Pariatur officia at possimus impedit dolorem omnis delectus aut.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(25, 25, 25, 0, 'Unde tempora quidem incidunt rerum porro.', 'Voluptatem nihil libero aliquid illo aut ea dolorum. Ipsa autem eveniet ducimus atque iure sit molestiae. Est voluptatem error minima error.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(26, 26, 26, 0, 'Eum quam assumenda et aut est harum.', 'Reiciendis quo quas impedit. Quos rem sint est perferendis harum quo ducimus. Alias sit consequatur molestiae doloribus aspernatur. Aperiam natus voluptas vel quasi omnis. Quos quibusdam ducimus dolore autem qui. Quasi officia pariatur eos natus aut ipsum officiis.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(27, 27, 27, 0, 'Ut exercitationem possimus ex doloremque.', 'Inventore corporis quo reiciendis. Voluptates dolorem sunt eaque. Ut voluptatibus quo dignissimos sint dolorem. Itaque modi quibusdam adipisci velit maxime tempore explicabo.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(28, 28, 28, 0, 'Est quaerat aliquam id ea eligendi.', 'Illum laborum eligendi sint et et. Mollitia voluptate explicabo quo omnis. Quia dolor natus accusantium sed vel qui.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(29, 29, 29, 0, 'Rerum molestiae fuga praesentium voluptatem aliquid voluptates illum.', 'Quos sint voluptatibus velit et quam magnam quam reiciendis. Aperiam impedit quod doloribus ipsam est eveniet. Asperiores quisquam voluptatem dolorum. Eum sed dolor molestiae voluptatem minus corrupti facilis. Vitae voluptatem reprehenderit architecto qui perspiciatis et suscipit.', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(30, 30, 30, 0, 'Tempore debitis omnis est ipsa ut ipsum reiciendis in.', 'Omnis vero soluta dolores voluptas tempore sint. Ad sequi quos dolor velit nihil temporibus nesciunt animi. Voluptatem voluptates praesentium officia dolor.', '2018-10-15 19:47:45', '2018-10-15 19:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dorian Sauer', 'ihayes@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'yrQrNt4fFA', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(2, 'Dr. Verla Armstrong Jr.', 'gerlach.ludwig@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'cAvheCJY8z', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(3, 'Lesley Strosin', 'pwitting@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'g8SxgXEncC', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(4, 'Connie Block', 'ebotsford@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vrzCZTTr73', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(5, 'Mrs. Aditya McGlynn II', 'hwilderman@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'BfVYuYSZ12', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(6, 'Paula Emard', 'leta74@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xZ3b41X3E8', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(7, 'Lilyan Kuphal', 'darby.maggio@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '1f2qBPBDzE', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(8, 'Lauren Christiansen', 'araceli92@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'mjdF9AOdjR', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(9, 'Winifred Adams', 'ogleason@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'fHqd8gFqjl', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(10, 'Heloise Legros', 'blowe@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '747wG4yrlh', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(11, 'Jackie Witting', 'earline.marks@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3jBSOpTdCV', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(12, 'Iva McLaughlin', 'daniela.schimmel@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ziDlOIoAJ3', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(13, 'Mr. Trent Walter I', 'kub.clarissa@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'fnJccJQVyL', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(14, 'Orie Kirlin V', 'chandler47@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8afXqZkJwx', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(15, 'Abigale Lemke', 'yhagenes@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'LQqutATsEJ', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(16, 'Greyson Lynch Sr.', 'vida.hills@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'PmRmEui8e8', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(17, 'Hollis Stracke', 'gutkowski.laurence@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ZdUssVyZtW', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(18, 'Dr. Annamae Bergnaum', 'beaulah36@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'sIgC2Swl5y', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(19, 'Donny Nienow', 'hilpert.leland@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0Gk0YiVKig', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(20, 'Esta White', 'estevan.kuhlman@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3iZcnSg8FH', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(21, 'Dr. Hettie Gulgowski V', 'wisoky.verdie@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'tfLGmlPSgv', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(22, 'Dr. Kelli Brakus Sr.', 'yrobel@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'fWxjpwv4IK', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(23, 'Miss Katlynn Gutkowski III', 'hcummings@example.org', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'mR87secSUH', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(24, 'Jaleel Ziemann', 'botsford.jesse@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'fenKB5EiXJ', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(25, 'Kaleigh Kuvalis PhD', 'eloisa.lakin@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'XOPuZECZTK', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(26, 'Kristofer Goodwin', 'pacocha.omari@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'HBNCbkLzxS', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(27, 'Dr. Libby Lynch', 'rita.gaylord@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'VRuVu1FKaI', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(28, 'Urban Jenkins MD', 'mann.magnus@example.com', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vILMXzoN3O', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(29, 'Alberta Gaylord', 'myron34@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'aydz2N3EiD', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(30, 'Dr. Lelia Legros I', 'baby.mayer@example.net', '2018-10-15 19:47:45', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'nuCFyKob1i', '2018-10-15 19:47:45', '2018-10-15 19:47:45'),
(31, 'Taka', 'taka@taka.ca', NULL, '$2y$10$W4VYtniVszUZeW79JMxG/.s8BEqqwQpcOzS9PknvlcduNorkC.S5K', NULL, '2018-10-15 19:48:07', '2018-10-15 19:48:07'),
(32, 'Leonor Kozey DVM', 'gerald.blick@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '46DAlsLf2i', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(33, 'Eva Langworth', 'rmayer@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'O8esg782ic', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(34, 'Ocie Auer', 'josefa.okon@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'bYWmTd0Seu', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(35, 'Jamar Emmerich V', 'willms.dorothea@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'CJMrcD48NQ', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(36, 'Maximillian Windler', 'lizeth.weimann@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ffCF6Cv61X', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(37, 'Belle McLaughlin DVM', 'hilpert.annamae@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '48wTyCw4BC', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(38, 'Karen Pacocha', 'reichel.cortez@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'wPf5OG59QF', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(39, 'Prof. Arch Nolan', 'padberg.abby@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'lCyvPn1H4k', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(40, 'Mr. Bernhard Leuschke I', 'price.gibson@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'OSXAja9bAZ', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(41, 'Mr. Darius Abbott', 'jacinthe79@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'WVbywesFjf', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(42, 'Destany Predovic', 'jborer@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'OF6f7rSx0H', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(43, 'Ms. Carolyn Leannon IV', 'beverly02@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'hdhXAlHDag', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(44, 'Edythe Feeney', 'emerald92@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8eyJrd4xIP', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(45, 'Jarret Kerluke', 'dzemlak@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'bD9eOhMuqw', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(46, 'Dr. Olaf Beer', 'areilly@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'F6JfvYfKgM', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(47, 'Ricardo Howe MD', 'queen44@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'LNGlpXjLIU', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(48, 'Jacinthe Marquardt', 'feeney.lelia@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'PE3ZYI6nsL', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(49, 'Prof. Webster Schulist II', 'diamond.beer@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'zXB6wthSQQ', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(50, 'Miss Candace Ward', 'lehner.carlie@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'sEfp3AhO6Y', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(51, 'Adan Veum', 'roderick59@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'r1Ne2misDn', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(52, 'Dr. Dereck Ziemann', 'lessie64@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xfKfBZaNMN', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(53, 'Mr. Rogelio Keeling IV', 'dylan.kulas@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'yL9vfvAIv8', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(54, 'Erica O\'Conner', 'carolanne.effertz@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Bz2GHdLphJ', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(55, 'Marisa Blanda', 'cassin.rogelio@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'IoiInkA4ye', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(56, 'Mozell Senger', 'gibson.avery@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'dVXXawnBgg', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(57, 'Mr. Dominic Crona Sr.', 'evolkman@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'srQQ1b4TpL', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(58, 'Armando Ryan DVM', 'gstiedemann@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0uPCARZnW0', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(59, 'Mrs. Hallie Stanton MD', 'vzboncak@example.org', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'LcWAnMDuBO', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(60, 'Newton Rowe', 'shaun94@example.net', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'jMYJAHbJjM', '2018-10-15 20:23:40', '2018-10-15 20:23:40'),
(61, 'Prof. Johnathon Heidenreich', 'reichert.declan@example.com', '2018-10-15 20:23:40', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '02pvBaIZCR', '2018-10-15 20:23:40', '2018-10-15 20:23:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_user_id_index` (`user_id`),
  ADD KEY `activities_subject_id_index` (`subject_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorites_user_id_favorited_id_favorited_type_unique` (`user_id`,`favorited_id`,`favorited_type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
