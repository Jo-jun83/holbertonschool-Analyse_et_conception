
-- Script d'initialisation de la base MegaShop-B2B

BEGIN;

-- Suppression des tables existantes

DROP TABLE IF EXISTS ligne_commande CASCADE;
DROP TABLE IF EXISTS commande CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS client CASCADE;

-- CLIENT

CREATE TABLE client (
    id_client UUID PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    mail VARCHAR(255) NOT NULL
);

-- PRODUIT

CREATE TABLE produit (
    id_produit UUID PRIMARY KEY,
    code_prod VARCHAR(20) NOT NULL UNIQUE,
    designation VARCHAR(100) NOT NULL
);

-- COMMANDE

CREATE TABLE commande (
    id_commande UUID PRIMARY KEY,
    date_achat DATE NOT NULL,
    adresse_livraison VARCHAR(255) NOT NULL,
    statut_cmd VARCHAR(50) NOT NULL,
    id_client UUID NOT NULL,

    CONSTRAINT fk_commande_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client)
);

-- LIGNE_COMMANDE

CREATE TABLE ligne_commande (
    id_commande UUID NOT NULL,
    id_produit UUID NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire_ht DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_ligne_commande
        PRIMARY KEY (id_commande, id_produit),

    CONSTRAINT fk_ligne_commande_commande
        FOREIGN KEY (id_commande)
        REFERENCES commande(id_commande),

    CONSTRAINT fk_ligne_commande_produit
        FOREIGN KEY (id_produit)
        REFERENCES produit(id_produit),

    CONSTRAINT chk_quantite_positive
        CHECK (quantite > 0),

    CONSTRAINT chk_prix_non_negatif
        CHECK (prix_unitaire_ht >= 0)
);

COMMIT;
