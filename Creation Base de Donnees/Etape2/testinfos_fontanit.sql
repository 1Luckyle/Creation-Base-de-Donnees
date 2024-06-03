/* Les informations relatives au passager n°916 : son nom, son âge, sa classe, sa ou ses cabines, le nom du port où il a embarqué, numéro et catégorie de l'embarcation de sauvetage qui l'a éventuellement secouru */
SELECT pa.Name, pa.Age, pa.PClass, oc.CabinCode, po.PortName, li.LifeBoatId, li.LifeBoatCat FROM PASSENGER pa, PORT po, OCCUPATION oc, RESCUE re, LIFEBOAT li, CATEGORY ca WHERE pa.PortId = po.PortId AND pa.PassengerId = oc.PassengerId AND pa.PassengerId = re.PassengerId AND re.LifeBoatId = li.LifeBoatId AND li.LifeBoatCat = ca.LifeBoatCat AND pa.PassengerId = '916';

/* Si le nom et le rôle des domestiques du passager n°1264 est exact */
SELECT pa.Name, se.Role, se.PassengerId_Emp FROM PASSENGER pa, SERVICE se WHERE pa.PassengerId = se.PassengerId_Dom AND se.PassengerId_Emp = '1264';

/* Si la liste des passagers ayant été secourus par le canot n°7 est exacte */
SELECT pa.Name, re.LifeBoatId FROM PASSENGER pa, RESCUE re WHERE pa.PassengerId = re.PassengerId AND LifeBoatId = '7';
