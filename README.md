# PHOTOchaton

<p align="center">Bienvenue sur PHOTOchaton, la meilleure boutique en ligne pour acheter des photos de chats et chattes 100% SFW.</p>
<p align="center"><img src="app/assets/images/angels.png" alt="Les devs, ces anges!" width="400"/></p>

## Chat parle de quoi ?

<p align="center">PHOTOchaton est une application web permettant aux utilisateurs de parcourir une collection de photos de chatons et d'acheter leurs préférées en quelques clics.</p>
<p align="center"><img src="app/assets/images/sylvaindurifflute.png" alt="Sysy" width="500"/></p>

> Après des recherches approfondies, notre étude de marché révolutionnaire a révélé que la ménagère typique de moins de 50 ans est désespérément fatiguée de se faire arnaquer par le téléachat avec des produits inutiles.  

> Ayant découvert que son mari est toujours coincé dans le mystérieux "monde extérieur" et qu'elle n'a que peu d'affection réelle à la maison, elle cherche désespérément des moyens de combler le vide émotionnel.  

> C'est là que PHOTOchaton intervient, avec ses photos de chatons mignons, pour apporter une dose bien nécessaire de ronronnement virtuel dans sa vie.  

> Parce qu'après tout, qui a besoin d'un mari quand on peut avoir une collection infinie de photos de chatons pour égayer chaque journée ? 

> PHOTOchaton : comblant le vide émotionnel, une photo de chaton à la fois.

## Et techniquement, chat utilise quoi ?

<p align="center">L'application est construite avec Ruby on Rails, utilise PostgreSQL comme base de données, et intègre des fonctionnalités telles que le paiement en ligne via Stripe, la gestion d'images avec CarrierWave, et bien plus encore.</p>
<p align="center"><img src="app/assets/images/sylvainduriffassis.png" alt="Sysy" width="500"/></p>

- **Parcourir les Photos :** Les utilisateurs peuvent explorer une variété de photos de chatons disponibles à l'achat.
- **Achat Facile :** Un processus d'achat simple permet aux utilisateurs d'ajouter des photos à leur panier et de finaliser leur commande en toute sécurité.
- **Paiement Sécurisé :** Les transactions sont sécurisées grâce à l'intégration de Stripe pour le traitement des paiements.
- **Gestion d'Images :** Les photos de chatons sont gérées avec CarrierWave pour une expérience visuelle optimale.
- **Données de Test :** Utilisation de la gem Faker pour générer des données de test réalistes.

## Chat a besoin de quoi pour marcher ?

1. **Prérequis :** Assurez-vous d'avoir Ruby 3.2.2 installé sur votre machine.
2. **Base de données :** Configurez PostgreSQL et créez votre base de données avec `rails db:create` et `rails db:migrate`.
3. **Stripe :** Obtenez vos clés d'API Stripe et configurez-les dans le fichier `.env`.

   ```dotenv
   STRIPE_PUBLISHABLE_KEY=your_publishable_key
   STRIPE_SECRET_KEY=your_secret_key
   ```

## Structure de la base de données

L'application utilise une base de données PostgreSQL avec les tables suivantes :

- **users** : Stocke les informations des utilisateurs.
- **items** : Contient les détails des articles.
- **carts** : Enregistre les paniers des utilisateurs.
- **cart_items** : Associe les articles aux paniers.
- **orders** : Stocke les informations des commandes.
- **order_items** : Associe les articles aux commandes.

## Fonctionnement de la base de données

- **Utilisateurs :** Les utilisateurs sont enregistrés avec une adresse e-mail et un mot de passe.
- **Articles :** Les articles ont un nom, une description, un prix et une image ou bien une URL d'image.
- **Paniers :** Chaque utilisateur a un panier. Les paniers contiennent des articles sous la forme d'éléments de panier (CartItem).
- **Commandes :** Les utilisateurs peuvent passer des commandes, qui sont créées à partir des articles de leur panier. Chaque commande est associée à l'utilisateur et aux articles via OrderItem.

## Chat ressemble à quoi cette base de données ?

<p align="center">
  <img src="app/assets/images/full_db_photochaton.png" alt="La db" width="100%"/>
</p>

<p align="center">Chat buggggg des fois... Chat marche parfouuuuuaaaaaa...
  <img src="app/assets/images/chat4-removebg-preview.png" alt="Un chat pour la databse" width="250"/>
</p>

## Amusez-vous avec chat en console

1. Récupérez un utilisateur et son panier :

```ruby 
user = User.first
cart = user.cart
```

2. Créez une commande à partir du panier :

```ruby 
order = Order.create_from_cart(cart)
```

3. Afficher la liste des photos disponibles avec la gem table_print :

```ruby 
tp Item.all
```

# Ca marche pas ? Ca bug ? Ne vous inquiétez pas...

<p align="center">
  <img src="app/assets/images/sylvain-sylvain-durif.gif" alt="Hallucination" width="500"/>
</p>

## La version en ligne pour les plus vaillants, vous l'avez mérité si vous avez scrollé jusqu'ici

Juste... ici : https://photochaton-2d43e208c0f8.herokuapp.com/

# BONUS : La maquette Figma by 100PBaguuette (Grégory Magnat)

<p align="center">
  <img src="app/assets/images/full_maket.png" alt="Maquette" width="10000"/>
</p>

