-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 25 Mars 2017 à 17:38
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `meetngeek`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_friends` (IN `@id1` INT, IN `@id2` INT)  NO SQL
BEGIN
    INSERT INTO friends VALUES(@id1,@id2);
    INSERT INTO friends VALUES(@id2,@id1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_friends_list` (IN `@userId` INT)  NO SQL
BEGIN  
	SELECT friend_id
	FROM friends
	Where user_id = @userId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `friends`
--

INSERT INTO `friends` (`user_id`, `friend_id`) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `steam_id` int(11) NOT NULL,
  `release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `games`
--

INSERT INTO `games` (`id`, `name`, `steam_id`, `release_date`) VALUES
(1, 'XCOM 2', 268500, NULL),
(2, 'Borderlands 2', 49520, NULL),
(4, 'Portal 2', 620, NULL),
(5, 'Divinity: Original Sin 2', 435150, NULL),
(8, 'Endless Space 2', 392110, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `game_tags`
--

CREATE TABLE `game_tags` (
  `game_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `game_tags`
--

INSERT INTO `game_tags` (`game_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 2),
(5, 5),
(5, 6),
(8, 2),
(8, 10),
(8, 11);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'SF'),
(2, 'Turn-based'),
(3, 'Aliens'),
(4, 'FPS'),
(5, 'Coop'),
(6, 'RPG'),
(7, 'Puzzle'),
(8, 'Best game ever'),
(9, 'Glados'),
(10, '4X'),
(11, 'Espace');

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `group_picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `group_memberships`
--

CREATE TABLE `group_memberships` (
  `id_group` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `liked_games`
--

CREATE TABLE `liked_games` (
  `id_user` int(11) NOT NULL,
  `id_game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `liked_games`
--

INSERT INTO `liked_games` (`id_user`, `id_game`) VALUES
(2, 1),
(2, 5),
(2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `liked_genres`
--

CREATE TABLE `liked_genres` (
  `id_user` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `liked_platforms`
--

CREATE TABLE `liked_platforms` (
  `id_user` int(11) NOT NULL,
  `id_platform` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `liked_types`
--

CREATE TABLE `liked_types` (
  `id_user` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `contact_skype` varchar(20) DEFAULT NULL,
  `contact_steam` varchar(20) DEFAULT NULL,
  `contact_discord` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact_facebok` varchar(50) DEFAULT NULL,
  `contact_twitter` varchar(20) DEFAULT NULL,
  `contact_nintendo` varchar(20) DEFAULT NULL,
  `contact_gamertag` varchar(20) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `birthdate_hidden` tinyint(4) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `prenom`, `nom`, `pseudo`, `description`, `localisation`, `contact_skype`, `contact_steam`, `contact_discord`, `email`, `password`, `contact_facebok`, `contact_twitter`, `contact_nintendo`, `contact_gamertag`, `birthdate`, `birthdate_hidden`, `sex`) VALUES
(1, 'Tom', 'Lechaux', 'Blignus', 'Je suis un peu con, mais ça va.', 'Paris', 'blignus_le_bogoss', 'blignus', '520', 'blignus@gmail.com', 'blignus', 'tom.lecheaux', 'tominou', 'bliblibli', 'blitag', '1998-07-18', 1, 0),
(2, 'Hugues', 'Rieublandou', 'Aldarick', 'Les pingouins ne gagneront pas la guerre. ', 'Chatenay-Malabry', 'aldarickdk', 'aldarick', 'aldarick', 'aldarick@orange.fr', 'aldarick', 'hugues.rieublandou', 'aldarick', 'aldato', 'aldatag', '1995-06-27', 0, 0),
(3, 'Chloé', 'Jartoux', 'Presea', 'Tales of c\'est bien', 'Chatou', 'skypre', 'presteam', 'prescord', 'presea@gmail.com', 'presea', 'presea', 'twittaire', 'nintendog', 'presertag', '1952-01-01', 0, 1),
(4, 'Pauline', 'Legendre', 'Paupaurock', '\\m/ Metal, metal, metal, metal \\m/ Et pokémon', 'Rennes', 'psychikagony', 'paupau', 'paupau', 'paupau@popo.com', 'paupau', 'facepau', 'twitpau', 'nintenpo', 'gamerpo', '1995-03-05', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_profile_pictures`
--

CREATE TABLE `users_profile_pictures` (
  `id` int(11) NOT NULL,
  `name` varchar(5) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `img_blob` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD KEY `user_id2` (`friend_id`);

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_tags`
--
ALTER TABLE `game_tags`
  ADD PRIMARY KEY (`game_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_memberships`
--
ALTER TABLE `group_memberships`
  ADD PRIMARY KEY (`id_group`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `liked_games`
--
ALTER TABLE `liked_games`
  ADD PRIMARY KEY (`id_user`,`id_game`),
  ADD KEY `id_game` (`id_game`);

--
-- Index pour la table `liked_genres`
--
ALTER TABLE `liked_genres`
  ADD PRIMARY KEY (`id_user`,`id_genre`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Index pour la table `liked_platforms`
--
ALTER TABLE `liked_platforms`
  ADD PRIMARY KEY (`id_user`,`id_platform`),
  ADD KEY `id_platform` (`id_platform`);

--
-- Index pour la table `liked_types`
--
ALTER TABLE `liked_types`
  ADD PRIMARY KEY (`id_user`,`id_type`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `game_tags`
--
ALTER TABLE `game_tags`
  ADD CONSTRAINT `game_tags_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_tags_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `group_memberships`
--
ALTER TABLE `group_memberships`
  ADD CONSTRAINT `group_memberships_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_memberships_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liked_games`
--
ALTER TABLE `liked_games`
  ADD CONSTRAINT `liked_games_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_games_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liked_genres`
--
ALTER TABLE `liked_genres`
  ADD CONSTRAINT `liked_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_genres_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liked_platforms`
--
ALTER TABLE `liked_platforms`
  ADD CONSTRAINT `liked_platforms_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_platforms_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liked_types`
--
ALTER TABLE `liked_types`
  ADD CONSTRAINT `liked_types_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_types_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
