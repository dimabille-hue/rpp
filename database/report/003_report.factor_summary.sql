CREATE VIEW report.factor_summary AS

SELECT

    fv.object_id,

    f.code,

    f.name,

    fv.numeric_value,

    fv.text_value

FROM factors.factor_value fv

JOIN factors.factor f

ON f.id=fv.factor_id;
