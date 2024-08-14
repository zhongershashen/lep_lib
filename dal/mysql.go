package dal

import (
	"fmt"
	"sync"

	"github.com/zhongershashen/lep_lib/constdef"

	"gorm.io/driver/mysql"

	"gorm.io/gorm"
)

var (
	db   *gorm.DB
	once sync.Once
)

func Init() {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8&parseTime=True&loc=Local&timeout=%s", constdef.MYSQL_USERNAME, constdef.MYSQL_PASSWORD, constdef.MYSQL_HOST, constdef.MYSQL_PORT, constdef.MYSQL_DBNAME, constdef.MYSQL_CONNECT_TIMEOUT)
	once.Do(func() {
		// init
		db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
		if err != nil {
			panic("连接数据库失败, error=" + err.Error())
		}
		sqlDB, _ := db.DB()
		sqlDB.SetMaxIdleConns(20)
		sqlDB.SetMaxOpenConns(100)
	})
}
func GetDB() *gorm.DB {
	return db
}
