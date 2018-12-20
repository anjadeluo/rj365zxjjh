DROP TABLE IF EXISTS bigdas_sequence_menuid;
CREATE TABLE `bigdas_sequence_menuid` (
  `pid` BIGINT(20) NOT NULL ,
  `id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY `pid` (`pid`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO bigdas_sequence_menuid(pid) SELECT id FROM bigdas_menu;
