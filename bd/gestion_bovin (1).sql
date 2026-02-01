-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 01 fév. 2026 à 14:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_bovin`
--

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

CREATE TABLE `alerte` (
  `idAlerte` int(11) NOT NULL,
  `idBovin` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `severite` varchar(20) NOT NULL,
  `dateCreation` datetime DEFAULT current_timestamp(),
  `dateResolution` datetime DEFAULT NULL,
  `etat` varchar(20) DEFAULT 'non_lue',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `alimentation`
--

CREATE TABLE `alimentation` (
  `idAlimentation` int(11) NOT NULL,
  `typeAliment` varchar(50) NOT NULL,
  `quantite` double NOT NULL,
  `unite` varchar(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `analyse`
--

CREATE TABLE `analyse` (
  `idAnalyse` int(11) NOT NULL,
  `typeAnalyse` varchar(50) NOT NULL,
  `dateAnalyse` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bovin`
--

CREATE TABLE `bovin` (
  `idBovin` int(11) NOT NULL,
  `age` int(11) NOT NULL CHECK (`age` >= 0 and `age` <= 30),
  `sexe` varchar(10) NOT NULL,
  `race` varchar(50) NOT NULL,
  `poids` double DEFAULT NULL,
  `etat` varchar(30) DEFAULT 'Sain',
  `dateAjout` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bovin`
--

INSERT INTO `bovin` (`idBovin`, `age`, `sexe`, `race`, `poids`, `etat`, `dateAjout`) VALUES
(1, 5, 'Femelle', 'Prim\'Holstein', 680, 'Sain', '2026-02-01 14:05:42'),
(2, 3, 'Mâle', 'Charolais', 850, 'Sain', '2026-02-01 14:05:42'),
(3, 2, 'Femelle', 'Montbéliarde', 620, 'Sain', '2026-02-01 14:05:42'),
(4, 4, 'Femelle', 'Prim\'Holstein', 700, 'Sain', '2026-02-01 14:05:42'),
(5, 6, 'Mâle', 'Simmental', 920, 'Sain', '2026-02-01 14:05:42'),
(6, 1, 'Femelle', 'Charolais', 550, 'Sain', '2026-02-01 14:05:42'),
(7, 3, 'Femelle', 'Montbéliarde', 640, 'Sain', '2026-02-01 14:05:42'),
(8, 5, 'Mâle', 'Prim\'Holstein', 800, 'Sain', '2026-02-01 14:05:42'),
(9, 2, 'Femelle', 'Limousin', 580, 'Sain', '2026-02-01 14:05:42'),
(10, 4, 'Femelle', 'Prim\'Holstein', 710, 'Sain', '2026-02-01 14:05:42'),
(11, 3, 'Mâle', 'Charolais', 900, 'Sain', '2026-02-01 14:05:42'),
(12, 2, 'Femelle', 'Montbéliarde', 600, 'Sain', '2026-02-01 14:05:42'),
(13, 5, 'Femelle', 'Prim\'Holstein', 690, 'Sain', '2026-02-01 14:05:42'),
(14, 1, 'Mâle', 'Simmental', 750, 'Sain', '2026-02-01 14:05:42'),
(15, 4, 'Femelle', 'Charolais', 650, 'Sain', '2026-02-01 14:05:42');

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

CREATE TABLE `capteur` (
  `idCapteur` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `idCollier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`idCapteur`, `type`, `unite`, `idCollier`) VALUES
(1, 'Température', '°C', 1),
(2, 'Température', '°C', 2),
(3, 'Température', '°C', 3),
(4, 'Température', '°C', 4),
(5, 'Température', '°C', 5);

-- --------------------------------------------------------

--
-- Structure de la table `collier`
--

CREATE TABLE `collier` (
  `idCollier` int(11) NOT NULL,
  `dateActivation` date NOT NULL,
  `statut` varchar(20) NOT NULL,
  `idBovin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `collier`
--

INSERT INTO `collier` (`idCollier`, `dateActivation`, `statut`, `idBovin`) VALUES
(1, '2025-12-01', 'Actif', 1),
(2, '2025-12-02', 'Actif', 2),
(3, '2025-12-03', 'Actif', 3),
(4, '2025-12-04', 'Actif', 4),
(5, '2025-12-05', 'Actif', 5);

-- --------------------------------------------------------

--
-- Structure de la table `etatsante`
--

CREATE TABLE `etatsante` (
  `idEtatSante` int(11) NOT NULL,
  `etat` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  `dateEvaluation` date NOT NULL,
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `idMaladie` int(11) NOT NULL,
  `nomMaladie` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `dateDetection` date NOT NULL,
  `traitement` varchar(255) DEFAULT NULL,
  `dateFinTraitement` date DEFAULT NULL,
  `etat` varchar(30) DEFAULT 'En cours',
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mesure`
--

CREATE TABLE `mesure` (
  `idMesure` int(11) NOT NULL,
  `valeur` double NOT NULL,
  `timestamp` datetime NOT NULL,
  `idCapteur` int(11) NOT NULL,
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `production_lait`
--

CREATE TABLE `production_lait` (
  `idProduction` int(11) NOT NULL,
  `dateProduction` date NOT NULL,
  `quantiteLait` double NOT NULL CHECK (`quantiteLait` > 0),
  `qualite` varchar(50) DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recommandation`
--

CREATE TABLE `recommandation` (
  `idRecommandation` int(11) NOT NULL,
  `idBovin` int(11) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `dateCreation` datetime DEFAULT current_timestamp(),
  `etat` varchar(20) DEFAULT 'active',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reproduction`
--

CREATE TABLE `reproduction` (
  `idReproduction` int(11) NOT NULL,
  `dateInsemination` date DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `nombreVeaux` int(2) DEFAULT 1,
  `typeReproduction` varchar(50) DEFAULT 'Naturelle',
  `etat` varchar(30) DEFAULT 'En attente',
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `dateCreation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nom`, `email`, `motDePasse`, `role`, `dateCreation`) VALUES
(1, 'Admin Principal', 'admin@bovin.local', '$2y$10$YIjlrPnoJ8/LewKOfN.H..8PmWv5RVW3X8.W.vd5FKvb0WQXsJ9vO', 'admin', '2026-02-01 14:05:42'),
(2, 'Jean Dupont', 'jean@bovin.local', '$2y$10$YIjlrPnoJ8/LewKOfN.H..8PmWv5RVW3X8.W.vd5FKvb0WQXsJ9vO', 'employe', '2026-02-01 14:05:42'),
(3, 'Dr. Marie Bernard', 'marie@bovin.local', '$2y$10$YIjlrPnoJ8/LewKOfN.H..8PmWv5RVW3X8.W.vd5FKvb0WQXsJ9vO', 'veterinaire', '2026-02-01 14:05:42');

-- --------------------------------------------------------

--
-- Structure de la table `vaccin`
--

CREATE TABLE `vaccin` (
  `idVaccin` int(11) NOT NULL,
  `nomVaccin` varchar(100) NOT NULL,
  `dateVaccination` date NOT NULL,
  `prochainRappel` date DEFAULT NULL,
  `descriptif` text DEFAULT NULL,
  `idBovin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD PRIMARY KEY (`idAlerte`),
  ADD KEY `idx_etat` (`etat`),
  ADD KEY `idx_severite` (`severite`),
  ADD KEY `idx_bovin` (`idBovin`);

--
-- Index pour la table `alimentation`
--
ALTER TABLE `alimentation`
  ADD PRIMARY KEY (`idAlimentation`),
  ADD KEY `idx_bovin` (`idBovin`);

--
-- Index pour la table `analyse`
--
ALTER TABLE `analyse`
  ADD PRIMARY KEY (`idAnalyse`),
  ADD KEY `idx_type` (`typeAnalyse`);

--
-- Index pour la table `bovin`
--
ALTER TABLE `bovin`
  ADD PRIMARY KEY (`idBovin`),
  ADD KEY `idx_sexe` (`sexe`),
  ADD KEY `idx_etat` (`etat`);

--
-- Index pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`idCapteur`),
  ADD KEY `idCollier` (`idCollier`),
  ADD KEY `idx_type` (`type`);

--
-- Index pour la table `collier`
--
ALTER TABLE `collier`
  ADD PRIMARY KEY (`idCollier`),
  ADD UNIQUE KEY `idBovin` (`idBovin`),
  ADD KEY `idx_statut` (`statut`);

--
-- Index pour la table `etatsante`
--
ALTER TABLE `etatsante`
  ADD PRIMARY KEY (`idEtatSante`),
  ADD KEY `idx_bovin` (`idBovin`);

--
-- Index pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`idMaladie`),
  ADD KEY `idx_etat` (`etat`),
  ADD KEY `idx_bovin` (`idBovin`);

--
-- Index pour la table `mesure`
--
ALTER TABLE `mesure`
  ADD PRIMARY KEY (`idMesure`),
  ADD KEY `idx_bovin` (`idBovin`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `idx_capteur` (`idCapteur`);

--
-- Index pour la table `production_lait`
--
ALTER TABLE `production_lait`
  ADD PRIMARY KEY (`idProduction`),
  ADD KEY `idx_bovin` (`idBovin`),
  ADD KEY `idx_date` (`dateProduction`);

--
-- Index pour la table `recommandation`
--
ALTER TABLE `recommandation`
  ADD PRIMARY KEY (`idRecommandation`),
  ADD KEY `idBovin` (`idBovin`),
  ADD KEY `idx_etat` (`etat`),
  ADD KEY `idx_categorie` (`categorie`);

--
-- Index pour la table `reproduction`
--
ALTER TABLE `reproduction`
  ADD PRIMARY KEY (`idReproduction`),
  ADD KEY `idx_etat` (`etat`),
  ADD KEY `idx_bovin` (`idBovin`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- Index pour la table `vaccin`
--
ALTER TABLE `vaccin`
  ADD PRIMARY KEY (`idVaccin`),
  ADD KEY `idx_bovin` (`idBovin`),
  ADD KEY `idx_rappel` (`prochainRappel`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alerte`
--
ALTER TABLE `alerte`
  MODIFY `idAlerte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `alimentation`
--
ALTER TABLE `alimentation`
  MODIFY `idAlimentation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `analyse`
--
ALTER TABLE `analyse`
  MODIFY `idAnalyse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bovin`
--
ALTER TABLE `bovin`
  MODIFY `idBovin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `idCapteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `collier`
--
ALTER TABLE `collier`
  MODIFY `idCollier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `etatsante`
--
ALTER TABLE `etatsante`
  MODIFY `idEtatSante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `idMaladie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mesure`
--
ALTER TABLE `mesure`
  MODIFY `idMesure` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `production_lait`
--
ALTER TABLE `production_lait`
  MODIFY `idProduction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recommandation`
--
ALTER TABLE `recommandation`
  MODIFY `idRecommandation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reproduction`
--
ALTER TABLE `reproduction`
  MODIFY `idReproduction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vaccin`
--
ALTER TABLE `vaccin`
  MODIFY `idVaccin` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD CONSTRAINT `alerte_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `alimentation`
--
ALTER TABLE `alimentation`
  ADD CONSTRAINT `alimentation_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur_ibfk_1` FOREIGN KEY (`idCollier`) REFERENCES `collier` (`idCollier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `collier`
--
ALTER TABLE `collier`
  ADD CONSTRAINT `collier_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `etatsante`
--
ALTER TABLE `etatsante`
  ADD CONSTRAINT `etatsante_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD CONSTRAINT `maladie_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mesure`
--
ALTER TABLE `mesure`
  ADD CONSTRAINT `mesure_ibfk_1` FOREIGN KEY (`idCapteur`) REFERENCES `capteur` (`idCapteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mesure_ibfk_2` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `production_lait`
--
ALTER TABLE `production_lait`
  ADD CONSTRAINT `production_lait_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recommandation`
--
ALTER TABLE `recommandation`
  ADD CONSTRAINT `recommandation_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reproduction`
--
ALTER TABLE `reproduction`
  ADD CONSTRAINT `reproduction_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vaccin`
--
ALTER TABLE `vaccin`
  ADD CONSTRAINT `vaccin_ibfk_1` FOREIGN KEY (`idBovin`) REFERENCES `bovin` (`idBovin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
