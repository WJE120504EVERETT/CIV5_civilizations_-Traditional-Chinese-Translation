CREATE TABLE IF NOT EXISTS ML_Labels_Dynamic (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, MainType TEXT default "FEATURE", SubType TEXT, CultureType TEXT);CREATE TABLE IF NOT EXISTS ML_CultureEras (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT, Description TEXT);

CREATE TABLE IF NOT EXISTS ML_CultureGroups (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT, Description TEXT);

CREATE TABLE IF NOT EXISTS ML_Cultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT, 'Group' TEXT, Description TEXT, SuggestedCivs TEXT);
INSERT INTO ML_Cultures (Type, 'Group', Description, SuggestedCivs)
SELECT 'MOD_LEUGI_MUISCA', 'CULTURE_GROUP_AMERICAN', 'TXT_KEY_ML_CULTURE_MUISCA' , 'TXT_KEY_ML_CULTURE_MUISCA_SUGGESTEDCIVS' ;

CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures(CivType, CultureType, CultureEra)
SELECT 'CIVILIZATION_MUISCA', 'MOD_LEUGI_MUISCA', 'ANY' ;