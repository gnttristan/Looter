Answers :
    1. On obtient l’erreur Initializer 'init(_:rowContent:)' requires that 'String' conform to 'Identifiable’. Cela signifies que l’on ne peut pas itérer sur un objet qui n’est pas identifiable, c’est a dire qui n’a pas d’identifiants. Pour résoudre cette erreur on doit définir un moyen d’identifier le type String avec 

extension String: Identifiable {
    public var id: String {
        return self
    }
}

———
Expliquez le changement que j’ai effectué par rapport à l’exemple précédent : 
            ForEach(loot, id: \.self) { item in
                Text(item)
            }
On utilise le forEach pour obtenir un attribut id qui sert d’identifiant

Question 2:
Pour afficher les loot, on itère maintenant à l’aide de leur identifiant que l’on définit directement deans le forEach à l’aide de l’identifiant « id ». On a donc plus besoin de l’extension qui permettait d’identifier l’objet

On itère maintenant sur la liste pour afficher nos loots
On sépare l’affiche du bouton (forEach) du click car jsp

Question 3 :
Testez ce code, fonctionne-t-il ? Pourquoi ?
Non, le code ne marche pas, cela est du au fait que la variable n’est pas encore réactive avec l’affichage lorsque on l’a modifie car elle n’as pas d’état, on peut corriger ca en ajouter @State devant la variable.

Maintenant que la variable a un état, l’UI peut se mettre à jour réactivent (car SwiftUI est réactif), le code marche

4. Ajout)
Question 1)
Cliquez sur le bouton “Ajouter”, que se passe-t-il ? Pourquoi cela ne marche pas ?
Premièrement, l’objet inventaire n’a pas d’état obersvé dans la view ContentView, son changement n’est donc pas détecté, pour cela, il faut lui ajouter l’attribut StateObject afin que lorsque l’object est modifié, l’état soit retrouvé. Deuxièmement, il faut être capable d’envoyer les modifications de l’objet loot à la vue principale ContentView lorsque il est modifié, pour se faire, on envoie son contenu vers ContentView grâce à l’annotation @Publisher 	

Ce message apparait car un objet avec le même identifiant existe deja, puisque nous ajoutons le même objet.

Exercice 2)
ObservableObject n’est pas adapté car Inventory n’est pas un Observable mais une classe, il est donc préférable de récupérer son état
State n’est pas adapté car il n’est pas fonctionnel avec des objets.

Question 2)
Comme pour le [jsp], nous avons besoin d’un identifiant pour itérer sur cet objet

Que se passe-t’il si vous n’attendez pas avant de lancer l’animation ?
Les deux animations se lancent en même temps, le modificateur d’angle s’applique donc aussi à la shadow




