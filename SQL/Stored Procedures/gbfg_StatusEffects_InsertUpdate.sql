CREATE PROCEDURE `gbfg_StatusEffects_InsertUpdate`(
		IN _slug VARCHAR(100),
		IN _Name VARCHAR(100)
)
BEGIN
	SET _slug = gbfg_CleanSlug(_slug);

	IF EXISTS(SELECT * FROM gbfg_StatusEffects WHERE slug = _slug) THEN
		UPDATE `gbfguide_maindata`.`gbfg_StatusEffects`
		SET
		`Name` = _Name
		WHERE `slug` = _slug;
	ELSE
		INSERT INTO `gbfguide_maindata`.`gbfg_StatusEffects`(
			`slug`,
			`Name`
		)
		VALUES (
			_slug,
			_Name
		);
	END IF;
END