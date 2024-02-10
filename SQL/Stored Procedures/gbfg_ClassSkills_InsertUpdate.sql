CREATE PROCEDURE `gbfg_ClassSkills_InsertUpdate`(
		IN _slug VARCHAR(100),
		IN _Name VARCHAR(100),
		IN _Class VARCHAR(100),
		IN _IX VARCHAR(100),
		IN _Family VARCHAR(100),
		IN _Description VARCHAR(2083)
)
BEGIN
	
	SET _slug = gbfg_CleanSlug(_slug);

	IF EXISTS(SELECT * FROM gbfg_ClassSkills WHERE Slug = _slug) THEN
		UPDATE `gbfguide_maindata`.`gbfg_ClassSkills`
		SET
		`slug` = _slug,
		`Name` = _Name,
		`Class` = _Class,
		`IX` = _IX,
		`Family` = _Family,
        `Description` = _Description
		WHERE `Slug` = _slug;
	ELSE
		INSERT INTO `gbfguide_maindata`.`gbfg_ClassSkills`(
			`slug`,
			`Name`,
			`Class`,
			`IX`,
			`Family`,
            `Description`
		)
		VALUES (
			_slug,
			_Name,
			_Class,
			_IX,
			_Family,
            _Description
		);
	END IF;
END