# Guide d'Utilisation

Ce document explique comment utiliser le script **Instagram Border Automation** pour préparer vos photos.

## Concept

Instagram privilégie le format vertical 4:5 pour une visibilité maximale sur mobile. Cependant, poster des photos horizontales ou carrées oblige souvent à rogner l'image.

Ce script résout ce problème en :
1. Ajoutant une bordure esthétique autour de la photo.
2. Comblant l'espace restant avec du blanc pour atteindre le ratio 4:5.

## Tutoriel Pas à Pas

### 1. Préparation des Dossiers

Il est recommandé d'avoir une structure claire. Par exemple :

```text
/Images
    /Raw (Vos photos originales)
        /Voyage_Japon
        /Portrait_Studio
    /Insta_Ready (Dossier vide pour la sortie)
```

### 2. Exécution du Script

Ouvrez votre terminal et naviguez vers le dossier contenant le script `insta-pad.sh`.

Lancez la commande suivante :

```bash
./insta-pad.sh "/Chemin/Vers/Images/Raw" "/Chemin/Vers/Images/Insta_Ready"
```

Le script va parcourir tous les sous-dossiers de `/Raw` et recréer la même structure dans `/Insta_Ready`.

### 3. Lecture des Logs

Pendant l'exécution, le script affiche les détails de chaque image traitée :

```text
[1] photo1.jpg -> border 240px, final 2160x2700
[2] portfolio/photo2.png -> border 100px, final 1080x1350
...
Terminé.
Sortie: /Chemin/Vers/Images/Insta_Ready
```

## Réglages Avancés

### Modifier l'épaisseur du cadre

Vous pouvez ajuster l'épaisseur du cadre blanc ("effet galerie") en modifiant la variable `BORDER_PCT` au début du script `insta-pad.sh`.

Valeurs recommandées :
- **4** : Cadre très fin, discret.
- **6** : Standard "galerie", équilibré.
- **8** : Cadre marqué.
- **10** : Style "tirage d'art", laisse beaucoup d'espace blanc.

## Dépannage

### Erreur : "magick introuvable"

Le script ne parvient pas à localiser ImageMagick.
**Solution** : Vérifiez que vous avez installé ImageMagick et que la commande `magick` fonctionne dans votre terminal. Si vous venez de l'installer, redémarrez votre terminal ou lancez `source ~/.zshrc`.

### Le script ne trouve aucune image

Vérifiez que vos extensions de fichiers sont standard (`.jpg`, `.jpeg`, `.png`, `.tif`). Le script est insensible à la casse (il détectera `.JPG` et `.jpg`).

### Problèmes de permissions

Si vous obtenez une erreur `Permission denied`, assurez-vous que le script est exécutable :

```bash
chmod +x insta-pad.sh
```
