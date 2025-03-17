INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_EW_RUSSIA_ICON',	0.063,	0.118,	0.239,	1),
		('COLOR_EW_RUSSIA_BG',		0.745,	0.765,	0.843,	1);

INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_EW_RUSSIA',	'COLOR_EW_RUSSIA_ICON',	'COLOR_EW_RUSSIA_BG',	'COLOR_PLAYER_WHITE_TEXT');

-----

INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_EW_RUSSIA',	256,	'kolchakPlate_256.dds',	1,	1),
		('ATLAS_EW_RUSSIA',	128,	'kolchakPlate_128.dds',	1,	1),
		('ATLAS_EW_RUSSIA',	80,		'kolchakPlate_80.dds',	1,	1),
		('ATLAS_EW_RUSSIA',	64,		'kolchakPlate_64.dds',	1,	1),
		('ATLAS_EW_RUSSIA',	45,		'kolchakPlate_45.dds',	1,	1),
		('ATLAS_EW_RUSSIA',	32,		'kolchakPlate_32.dds',	1,	1),
		('ALPHA_EW_RUSSIA',	64,		'kolchakAlpha_64.dds',	1,	1),
		('ALPHA_EW_RUSSIA',	48,		'kolchakAlpha_48.dds',	1,	1),
		('ALPHA_EW_RUSSIA',	32,		'kolchakAlpha_32.dds',	1,	1),
		('ALPHA_EW_RUSSIA',	24,		'kolchakAlpha_24.dds',	1,	1),
		('ATLAS_EW_KOLCHAK',	256,	'kolchakAtlas_256.dds',	3,	1),
		('ATLAS_EW_KOLCHAK',	128,	'kolchakAtlas_128.dds',	3,	1),
		('ATLAS_EW_KOLCHAK',	80,	'kolchakAtlas_80.dds',	3,	1),
		('ATLAS_EW_KOLCHAK',	64,	'kolchakAtlas_64.dds',	3,	1),
		('ATLAS_EW_KOLCHAK',	45,	'kolchakAtlas_45.dds',	3,	1),
		('ATLAS_EW_KOLCHAK',	32,	'kolchakAtlas_32.dds',	3,	1),
		('ALPHA_EW_MARKOVTSY',	32,		'markovtsyAlpha.dds',	1,	1)
		;

--Music

INSERT INTO Audio_Sounds
		(SoundID,	Filename,	LoadType)
VALUES	('SND_LEADER_MUSIC_EW_KOLCHAK_WAR',	'PARG_War',	'DynamicResident'),
		('SND_LEADER_MUSIC_EW_KOLCHAK_PEACE',	'PARG_Peace',	'DynamicResident');

-----

INSERT INTO Audio_2DSounds
		(ScriptID,	SoundID,	SoundType,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_EW_KOLCHAK_WAR',	'SND_LEADER_MUSIC_EW_KOLCHAK_WAR',	'GAME_MUSIC',	60,	60,	1,	0),
		('AS2D_LEADER_MUSIC_EW_KOLCHAK_PEACE',	'SND_LEADER_MUSIC_EW_KOLCHAK_PEACE',	'GAME_MUSIC',	60,	60,	1,	0);