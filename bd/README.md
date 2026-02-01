# 📊 Base de Données

Scripts SQL et données de test pour la gestion du troupeau.

## Fichiers

- `gestion_bovin.sql` - Schéma initial
- `gestion_bovin_complet.sql` - Schéma complet avec toutes les tables
- `donnees_test.sql` - Données de test

## Création BD
```bash
mysql -u root -p < gestion_bovin_complet.sql
```

## Tables

- bovin (les vaches)
- utilisateur (admin, employé, vétérinaire)
- maladie (suivi santé)
- vaccin (historique vaccins)
- production_lait (suivi production)
- reproduction (données reproduction)
- alerte (alertes système)
- capteur (types de capteurs)
- mesure (valeurs capteurs)
