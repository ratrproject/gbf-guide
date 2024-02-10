CREATE PROCEDURE `gbfg_CharacterInformationGrid_InsertUpdate`(
		IN _slug VARCHAR(100),
		IN _Name VARCHAR(100),
		IN _Characters TEXT
)
BEGIN
	SET _slug = gbfg_CleanSlug(_slug);

	IF EXISTS(SELECT * FROM gbfg_CharacterInfortmationGrid WHERE Slug = _slug) THEN
		UPDATE `gbfguide_maindata`.`gbfg_CharacterInfortmationGrid`
		SET
		`slug` = _slug,
		`Name` = _Name,
        `Characters` = _Characters
		WHERE `Slug` = _slug;
	ELSE
		INSERT INTO `gbfguide_maindata`.`gbfg_CharacterInfortmationGrid`(
			`slug`,
			`Name`,
            `Characters`
		)
		VALUES (
			_slug,
			_Name,
            _Characters
		);
	END IF;
END