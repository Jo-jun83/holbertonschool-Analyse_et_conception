## 1. Entités identifiées

- **Client** : représente un client qui peut passer des commandes.
- **Commande** : représente une commande effectuée par un client.
- **Produit** : représente un produit pouvant être présent dans plusieurs commandes.

## 2. Règles de gestion et cardinalités


- Un client peut passer **0 à plusieurs commandes** : cardinalité `(0,N)`.
- Une commande appartient obligatoirement à **un seul client** : cardinalité `(1,1)`.
- Un produit peut apparaître dans **0 à plusieurs commandes** : cardinalité `(0,N)`.
- Une commande doit contenir **1 à plusieurs produits** : cardinalité `(1,N)`.

## 3. Relation entre commandes et produits

La relation entre les entités **Commande** et **Produit** est de type **plusieurs-à-plusieurs (N,N)**.

Une commande peut contenir plusieurs produits et un même produit peut apparaître dans plusieurs commandes.

Cette relation nécessite la création d'une table de liaison appelée `ligne_commande`.

Cette table contiendra notamment les attributs suivants :

- `commande_id` : identifiant de la commande.
- `produit_id` : identifiant du produit.
- `quantite` : quantité du produit dans la commande.
- `prix_unitaire_ht` : prix unitaire HT appliqué au moment de la commande, afin de conserver l'historique des prix.

## 4. Données calculées

Le champ `total_ligne` présent dans le fichier CSV est une donnée calculée.

Il correspond au montant total HT d'un produit pour une ligne de commande.

**Formule :**

`total_ligne = quantite × prix_unitaire_ht`

Ce champ ne représente donc pas une entité métier indépendante.

## 5. Identification des clients

Le fichier CSV ne contient pas d'identifiant unique pour les clients.

Il est préférable de prévoir un attribut `id_client` afin d'identifier chaque client de manière unique, même lorsque plusieurs clients possèdent le même nom.