# Instagram Border Automation

![Badge Licence](https://img.shields.io/badge/license-MIT-blue)
![Badge Maintenance](https://img.shields.io/badge/maintained-yes-brightgreen)

Un script Bash automatisé permettant de traiter des lots d'images pour Instagram. Il ajoute une bordure interne de type "galerie" et adapte le format au ratio 4:5 idéal pour l'affichage mobile, sans déformer l'image originale.

Ce projet est maintenu par **Lechevlu** (Cle).

## Fonctionnalités

- **Traitement par lot** : Traite récursivement des dossiers entiers d'images.
- **Ratio Standardisé** : Formate toutes les images (portrait, paysage, carré) vers un ratio vertical 4:5.
- **Effet Galerie** : Ajoute une bordure blanche proportionnelle autour de l'image.
- **Préservation** : Ne rogne pas et ne déforme pas le sujet de la photo (ajout de padding blanc si nécessaire).
- **Miroir** : Reproduit la structure exacte des dossiers d'entrée vers le dossier de sortie.

## Prérequis

Ce script fonctionne sur les systèmes Unix (macOS, Linux).

- **Bash** (v3.2+)
- **ImageMagick** (v7+)
- **Python 3** (utilisé pour les calculs de dimensions)

### Installation des dépendances (macOS)

Assurez-vous qu'ImageMagick est installé et accessible dans votre PATH.

```bash
magick -version
```

Si la commande n'est pas trouvée, installez-la via Homebrew ou MacPorts, et ajoutez-la à votre configuration shell (.zshrc ou .bashrc).

## Installation

1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/cleeeeee/Border-Galery-Maker.git
   cd Border-Galery-Maker
   ```

2. Rendez le script exécutable :
   ```bash
   chmod +x insta-pad.sh
   ```

## Utilisation Rapide

Le script prend deux arguments obligatoires : le dossier source et le dossier de destination.

```bash
./insta-pad.sh [DOSSIER_ENTREE] [DOSSIER_SORTIE]
```

Exemple :

```bash
./insta-pad.sh "./photos_source" "./photos_pour_instagram"
```

Pour plus de détails, consultez le [Guide Utilisateur](docs/utilisation.md).

## Configuration

La taille de la bordure est configurée directement dans le script via la variable `BORDER_PCT`.
Par défaut, elle est fixée à **10%** du plus petit côté de l'image.

Pour modifier cette valeur, éditez la ligne suivante dans `insta-pad.sh` :

```bash
BORDER_PCT=10
```

## Contribution

Les contributions sont les bienvenues. Pour des changements majeurs, veuillez ouvrir d'abord une issue pour discuter de ce que vous souhaitez modifier.

## Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## Contact

**Lechevlu** - [https://lechevlu.fr](https://lechevlu.fr/)  
✉️ contact@lechevlu.fr
