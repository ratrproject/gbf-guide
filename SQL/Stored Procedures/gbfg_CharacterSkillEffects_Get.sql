CREATE PROCEDURE `gbfg_CharacterSkillEffects_Get`(
	IN _Slug VARCHAR(100),
	IN _SkillMask TEXT
)
BEGIN
	SELECT		C.Name, C.slug, SE.Name, SR.ImageURL
	FROM		gbfg_GridCharacters AS C
	INNER JOIN	gbfg_CharacterSkillEffects AS CSE ON
					C.ID = CSE.CharacterID AND
					find_in_set(CSE.SkillID,_SkillMask) <> 0
	INNER JOIN	gbfg_SkillEffects AS SE   ON
				CSE.SkillID = S.SkillID
	WHERE
		C.slug = _Slug;
END