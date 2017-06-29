#
# Structure for table "user_t"
#

DROP TABLE IF EXISTS user_t;
CREATE TABLE user_t (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_name varchar(40) NOT NULL,
  password varchar(255) NOT NULL,
  age int(4) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "user_t"
#

INSERT INTO user_t VALUES (1,'æµ‹è¯•','123456',24);

cmdÃüÁî
java -jar mybatis-generator-core-1.3.2.jar -configfile generatorConfig.xml -overwrite